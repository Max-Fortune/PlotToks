library(tidyverse)
library(tidycensus)

## campaign donations data
df = read_csv("content/blog/house20.csv")
# view(df)

## census api key
key = "696165c2f1261f2f4ddbb94380558a8dd0e4a8bd"
census_api_key(key)




df = df %>% 
  mutate(dollar_amount = as.numeric(gsub("\\$", "", Total)),
         out_pct = as.numeric(gsub("\\%", "", `Out-of-District`))/100,
         in_pct = as.numeric(gsub("\\%", "", `In-District`))/100,
         party = gsub("[()]", "", word(Name, -1)),
         total_out = dollar_amount*out_pct,
         total_in = dollar_amount*in_pct) 

#### total donations and out-of-district percent


df %>%
  ggplot(aes(x = out_pct, 
             y = dollar_amount, 
             color = party)) +
  geom_point(show.legend = FALSE,
             shape = 1) +
  ggrepel::geom_label_repel(data = df %>% filter(dollar_amount > 9000000 & 
                                                   out_pct > .90),
             aes(label = Name,
                 fill = party),
             hjust = 1,
             size = 2.7,
             show.legend = FALSE,
             fontface = "bold",
             color = "white") +
  scale_fill_manual(values = c("#6c91e6", "tomato")) +
  scale_colour_manual(values = c("#6c91e6", "tomato")) + 
  scale_x_continuous(breaks = seq(0, 1, .25),
                     limits = seq(0, 1),
                     labels = scales::percent) +
  scale_y_continuous(labels = scales::dollar,
                     position = "right") +
  labs(y = "",
       x = "Percent of 2020 Campaign Donations Coming\nfrom Donors Residing Out-of-District",
       title = "Total 2020 Campaign Contributions by Share of\nOut-of-District Donors",
       subtitle = "House of Representatives, 117th Congress") +
  theme(line = element_line(color = "white"),
        text = element_text(color = "white"),
        plot.title = element_text(face = "bold"),
        axis.line = element_line(color = "white"),
        axis.text = element_text(color = "white"),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "grey20"),
        plot.background = element_rect(fill = "grey20",
                                       color = "white"),
        plot.margin = unit(c(1, 1, 1, 1), "cm"))
  
ggsave("out-of-district.png",
       width = 6.29,
       height = 6.05, 
       units = "in")  


df %>% 
  ggplot(aes(x = out_pct, fill = party)) +
  geom_histogram(alpha = .7,
                 show.legend = FALSE) +
  scale_fill_manual(values = c("#6c91e6", "tomato")) +
  theme(line = element_line(color = "white"),
        text = element_text(color = "white"),
        plot.title = element_text(face = "bold"),
        axis.line = element_line(color = "white"),
        axis.text = element_text(color = "white"),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "grey20"),
        plot.background = element_rect(fill = "grey20",
                                       color = "white"),
        plot.margin = unit(c(1, 1, 1, 1), "cm"))

df %>% 
  group_by(party) %>% 
  count()


  
cor(df$dollar_amount, df$out_pct)


df %>% 
  ggplot(aes(x = total_in)) +
  geom_histogram()















