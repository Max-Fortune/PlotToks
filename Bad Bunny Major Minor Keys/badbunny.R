
# setup -------------------------------------------------------------------

library(tidyverse)
library(spotifyr)
library(ggtext)
library(extrafont)
library(camcorder)

Sys.setenv(SPOTIFY_CLIENT_ID = '26ede6ad39e847cca9b8731c380da6d6')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '5982e012c0a64eb4b1e580355ba414ee')

access_token <- get_spotify_access_token()

loadfonts()

# trying it out ---------------------------------------------------------

# bf = get_artist_audio_features("between friends") |> as_tibble()
# bf_top = get_artist_top_tracks("between friends")
# 
# a7x = get_artist_audio_features("avenged sevenfold") |> as_tibble()
# a7x_albums = unique(a7x$album_name)[c(4, 7:12)]
# 
# a7x$valence = with(a7x, reorder(album_name, valence, mean))
# a7x |> 
#   filter(album_name %in% a7x_albums) |> 
#   arrange(valence) %>%    # First sort by val. This sort the dataframe but NOT the factor levels
#   mutate(album_name = factor(album_name, levels = unique(a7x$album_name))) |> 
#   ggplot(aes(x = valence, y = album_name)) +
#   stat_halfeye()




# bad bunny ---------------------------------------------------------------

# bb = get_artist_audio_features("bad bunny")
bb = read_csv("bb.csv")
bb = as_tibble(bb)

a1 = "#1E1E1E"
a2 = "#048ABF"
a3 = "#D12F1B"
a4 = "#F3B94B"
bg = "#C5B0F3"

temp =
  bb |> 
  filter(!album_name %in% c("OASIS", "LAS QUE NO IBAN A SALIR")) |> 
  mutate(key_name = factor(key_name),
         album_name = recode(album_name,
                                 "X 100PRE" = "X 100PRE",
                                 "YHLQMDLG" = "YHLQMDLG",
                                 "EL ÚLTIMO TOUR DEL MUNDO" = "EL ÚLTIMO TOUR DEL MUNDO",
                                 "Un Verano Sin Ti" = "Un Verano Sin Ti"),  
         mode_name = recode(mode_name,
                           minor = "Minor",
                           major = "Major")) |> 
  group_by(key_name, album_name, mode_name) |> 
  count() |> 
  arrange(desc(n))

temp$album_name = factor(temp$album_name, levels = c("X 100PRE",
                                                     "YHLQMDLG",
                                                     "EL ÚLTIMO TOUR DEL MUNDO",
                                                     "Un Verano Sin Ti"))

# bb_plot = function(english = TRUE) {
#   
#   if(english) {
#     title = "Bad Bunny Avoids D# & F# Major"
#     subtitle = "Total Tracks by Key, Studio Album Releases"
#     
#   }
#   
#   temp |> 
#     ggplot(aes(x = n, y = key_name, fill = album_name )) +
#     geom_bar(position = position_stack(reverse = TRUE), 
#              stat = "identity") +
#     facet_grid(mode_name ~ .) +
#     guides(fill = guide_legend(nrow = 2)) +
#     scale_y_discrete(limits = rev(levels(temp$key_name))) +
#     scale_x_continuous(breaks = 0:10,
#                        limits = c(0, 10)) +
#     scale_fill_manual(values = c(a1, a2, a3, a4)) +
#     labs(title = "Bad Bunny Avoids D# & F# Major",
#          subtitle = "Total Tracks by Key, Studio Album Releases",
#          caption = "@solplots\nSource: Spotify API") +
#     theme_minimal() +
#     theme(axis.title = element_blank(),
#           strip.text = element_text(size = rel(1)),
#           strip.text.y = element_text(angle = 0,
#                                       vjust = 1,
#                                       hjust = 1), 
#           strip.background = element_rect(size = 1,
#                                           fill = bg,
#                                           color = bg),
#           legend.position = "top",
#           legend.title = element_blank(),
#           axis.text.y = element_text(hjust = 0),
#           panel.grid = element_blank(),
#           # legend.text = element_text(size = 7),
#           text = element_text(family = "Morning Rainbow",
#                               size = 15),
#           plot.caption = element_text(lineheight = 0.85),
#           panel.background = element_rect(fill = bg,
#                                           color = bg),
#           plot.background = element_rect(fill = bg),
#           legend.key.size = unit(.2, "cm"))
#   
#   
#   
# }



temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
            switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  scale_x_continuous(breaks = 0:10,
                     limits = c(0, 10)) +
  scale_fill_manual(values = c(a1, a2, a3, a4)) +
  labs(title = "Bad Bunny Avoids D# & F# Major",
       subtitle = "Total Tracks by Key & Studio Album Release",
       caption = "@solplots\nSource: Spotify API") +
  theme_minimal() +
  theme(axis.title = element_blank(),
        strip.text = element_text(size = rel(1)),
        strip.background = element_rect(size = 1,
                                        fill = bg,
                                        color = bg),
        legend.position = "top",
        legend.title = element_blank(),
        axis.text.y = element_text(hjust = 0),
        panel.grid = element_blank(),
        # legend.text = element_text(size = 7),
        text = element_text(family = "Morning Rainbow",
                            size = 15),
        plot.caption = element_text(lineheight = 0.85),
        panel.background = element_rect(fill = bg,
                                        color = bg),
        plot.background = element_rect(fill = bg),
        legend.key.size = unit(.2, "cm"),
        axis.text = element_text(color = "black"))


# in spanish --------------------------------------------------------------

es_title = "Bad Bunny Evita D# & F# Mayor"
es_major = "Mayor"
es_minor = "Menor"
es_subtitle = "Total de Canciones por Tonalidad y\nLanzamientos de Estudio"

temp2 = temp |> 
  mutate(mode_name = recode(mode_name,
                               Major = "Mayor",
                               Minor = "Menor"))

temp2 |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  scale_x_continuous(breaks = 0:10,
                     limits = c(0, 10)) +
  scale_fill_manual(values = c(a1, a2, a3, a4)) +
  labs(title = es_title,
       subtitle = es_subtitle,
       caption = "@solplots\nSource: Spotify API") +
  theme_minimal() +
  theme(axis.title = element_blank(),
        strip.text = element_text(size = rel(1)),
        strip.background = element_rect(size = 1,
                                        fill = bg,
                                        color = bg),
        legend.position = "top",
        legend.title = element_blank(),
        axis.text.y = element_text(hjust = 0),
        panel.grid = element_blank(),
        # legend.text = element_text(size = 7),
        text = element_text(family = "Morning Rainbow",
                            size = 15),
        plot.caption = element_text(lineheight = 0.85),
        panel.background = element_rect(fill = bg,
                                        color = bg),
        plot.background = element_rect(fill = bg),
        legend.key.size = unit(.2, "cm"),
        axis.text = element_text(color = "black"),
        plot.subtitle = element_text(lineheight = .65))







  