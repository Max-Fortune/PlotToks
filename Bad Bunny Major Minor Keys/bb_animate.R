## bb gif

gg_record(
  dir = paste(getwd(), "animations", sep = "/"), # where to save the recording
  device = "png", # device to use to save images
  width = 4.94,      # width of saved image
  height = 5.21,     # height of saved image
  units = "in",   # units for width and height
  dpi = 300       # dpi to use when saving image
)

## 1
temp |> 
  ggplot() 

## 2
temp |> 
  ggplot(aes(x = n))

## 3
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name))

## 4
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name)) +
  geom_bar(stat = "identity")

## 5
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name)) +
  geom_bar(stat = "identity",
           position = position_stack(reverse = TRUE))

## 6
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name)) +
  geom_bar(stat = "identity",
           position = position_stack(reverse = TRUE)) +
  facet_grid(mode_name ~ .)

## 7
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name)) +
  geom_bar(stat = "identity",
           position = position_stack(reverse = TRUE)) +
  facet_grid(mode_name ~ .,
             switch = "y")

## 8
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2))

## 9
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  theme(legend.key.size = unit(.2, "cm"))

## 10
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  theme(legend.key.size = unit(.2, "cm"),
        legend.position = "top")

# ## 11
# temp |> 
#   ggplot(aes(x = n, y = key_name, fill = album_name )) +
#   geom_bar(position = position_stack(reverse = TRUE), 
#            stat = "identity") +
#   facet_grid(mode_name ~ .,
#              switch = "y") +
#   guides(fill = guide_legend(nrow = 2)) +
#   # theme_minimal() +
#   theme(legend.key.size = unit(.2, "cm"),
#         legend.position = "top")

## 12
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  # theme_minimal() +
  theme(legend.key.size = unit(.2, "cm"),
        legend.position = "top")
  
## 13
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  scale_x_continuous(breaks = 0:10) +
  # theme_minimal() +
  theme(legend.key.size = unit(.2, "cm"),
        legend.position = "top")

## 14
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  scale_x_continuous(breaks = 0:10) +
  scale_fill_manual(values = c(a1, a2, a3, a4)) +
  # theme_minimal() +
  theme(legend.key.size = unit(.2, "cm"),
        legend.position = "top")

## 15
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  scale_x_continuous(breaks = 0:10) +
  scale_fill_manual(values = c(a1, a2, a3, a4)) +
  # theme_minimal() +
  theme(legend.key.size = unit(.2, "cm"),
        legend.position = "top",
        axis.title = element_blank(),
        strip.text = element_text(size = rel(1)))

## 16
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  scale_x_continuous(breaks = 0:10) +
  scale_fill_manual(values = c(a1, a2, a3, a4)) +
  # theme_minimal() +
  theme(legend.key.size = unit(.2, "cm"),
        legend.position = "top",
        axis.title = element_blank(),
        strip.text = element_text(size = rel(1)),
        legend.title = element_blank(),
        axis.text.y = element_text(hjust = 0),
        panel.grid = element_blank())

## 17
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  scale_x_continuous(breaks = 0:10) +
  scale_fill_manual(values = c(a1, a2, a3, a4)) +
  # theme_minimal() +
  theme(legend.key.size = unit(.2, "cm"),
        legend.position = "top",
        axis.title = element_blank(),
        strip.text = element_text(size = rel(1)),
        legend.title = element_blank(),
        axis.text.y = element_text(hjust = 0),
        panel.grid = element_blank(),
        strip.background = element_rect(size = 1,
                                        fill = bg,
                                        color = bg),
        panel.background = element_rect(fill = bg,
                                        color = bg),
        plot.background = element_rect(fill = bg),
        legend.background = element_rect(fill = bg))

## 18
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  scale_x_continuous(breaks = 0:10) +
  scale_fill_manual(values = c(a1, a2, a3, a4)) +
  labs(title = "Bad Bunny Avoids D# & F# Major") +
  # theme_minimal() +
  theme(legend.key.size = unit(.2, "cm"),
        legend.position = "top",
        axis.title = element_blank(),
        strip.text = element_text(size = rel(1)),
        legend.title = element_blank(),
        axis.text.y = element_text(hjust = 0),
        panel.grid = element_blank(),
        strip.background = element_rect(size = 1,
                                        fill = bg,
                                        color = bg),
        panel.background = element_rect(fill = bg,
                                        color = bg),
        plot.background = element_rect(fill = bg),
        legend.background = element_rect(fill = bg))

## 19
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  scale_x_continuous(breaks = 0:10) +
  scale_fill_manual(values = c(a1, a2, a3, a4)) +
  labs(title = "Bad Bunny Avoids D# & F# Major",
       subtitle = "Total Tracks by Key & Studio Album Release") +
  # theme_minimal() +
  theme(legend.key.size = unit(.2, "cm"),
        legend.position = "top",
        axis.title = element_blank(),
        strip.text = element_text(size = rel(1)),
        legend.title = element_blank(),
        axis.text.y = element_text(hjust = 0),
        panel.grid = element_blank(),
        strip.background = element_rect(size = 1,
                                        fill = bg,
                                        color = bg),
        panel.background = element_rect(fill = bg,
                                        color = bg),
        plot.background = element_rect(fill = bg),
        legend.background = element_rect(fill = bg))

## 20
temp |> 
  ggplot(aes(x = n, y = key_name, fill = album_name )) +
  geom_bar(position = position_stack(reverse = TRUE), 
           stat = "identity") +
  facet_grid(mode_name ~ .,
             switch = "y") +
  guides(fill = guide_legend(nrow = 2)) +
  scale_y_discrete(limits = rev(levels(temp$key_name))) +
  scale_x_continuous(breaks = 0:10) +
  scale_fill_manual(values = c(a1, a2, a3, a4)) +
  labs(title = "Bad Bunny Avoids D# & F# Major",
       subtitle = "Total Tracks by Key & Studio Album Release",
       caption = "@solplots\nSource: Spotify API") +
  # theme_minimal() +
  theme(legend.key.size = unit(.2, "cm"),
        legend.position = "top",
        axis.title = element_blank(),
        strip.text = element_text(size = rel(1)),
        legend.title = element_blank(),
        axis.text.y = element_text(hjust = 0),
        panel.grid = element_blank(),
        strip.background = element_rect(size = 1,
                                        fill = bg,
                                        color = bg),
        panel.background = element_rect(fill = bg,
                                        color = bg),
        plot.background = element_rect(fill = bg),
        legend.background = element_rect(fill = bg))

## final
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

gg_playback(
  name = "the new bb gif.gif",
  first_image_duration = 5,
  last_image_duration = 15,
  frame_duration = .4,
  image_resize = 800
)
