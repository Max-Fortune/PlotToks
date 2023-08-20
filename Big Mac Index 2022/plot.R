library(tidyverse)
library(ggrepel)

mac <- read_csv("https://raw.githubusercontent.com/TheEconomist/big-mac-data/master/output-data/big-mac-full-index.csv")
  
top_5 <- 
  mac |>
  filter(date == max(date)) |>
  slice_max(order_by = dollar_price, n = 5) |> 
  pull(name)

bottom_5 <- 
  mac |>
  filter(date == max(date)) |>
  slice_min(order_by = dollar_price, n = 5) |> 
  pull(name)

df <- 
  mac |>
  select(date, name, dollar_price) |>
  mutate(top_bottom = case_when(
    name %in% top_5  ~ "top5",
    name %in% bottom_5 ~ "bottom5",
    TRUE ~ "other")
  ) 

df |>
  ggplot(aes(x = date,
             y = dollar_price,
             group = name,
             color = top_bottom)) +
  geom_line() +
  geom_label(data = df |> filter(date == max(date),
                                 name %in% c(top_5, bottom_5)),
                   aes(label = name,
                       fill = top_bottom),
                   color = "white") +
  scale_color_manual(values = c(top5 = "#FFC72C", other = "grey90", bottom5 = "black")) +
  scale_fill_manual(values = c(top5 = "#FFC72C", other = "grey80", bottom5 = "black")) +
  scale_y_continuous(labels = scales::dollar) +
  scale_x_date(limits = c(min(df$date), date("2024-07-01"))) +
  labs(title = "Big Mac Index, July 2022 Update",
       subtitle = "Countries with Most- and Least-Expensive Big Macs",
       x = "Year",
       y = "Dollar Price (USD)") +
  theme_classic() +
  theme(
    legend.position = "none",
    text = element_text(family = "Helvetica", face = "bold", color = "#FFC72C"),
    plot.background = element_rect(fill = "#DA291C"),
    panel.background = element_rect(fill = "#DA291C"),
    plot.title = element_text(size = rel(1.8)),
    plot.subtitle = element_text(size = rel(1.3)),
    axis.line = element_line(color = "#FFC72C"),
    panel.grid = element_line(color = "#FFC72C"),
    panel.grid.major = element_line(linetype = "dashed"),
    axis.text = element_text(color = "#FFC72C", size = rel(1.05)),
    axis.title = element_text(size = rel(1.2)),
    axis.ticks = element_blank()
  )

p <- mac |>
  select(date, name, dollar_price) |>
  mutate(top_bottom = case_when(
    name %in% c("Switzerland", "Lebanon",
                "Norway", "Sweden", 
                "United States") ~ "top5",
    name %in% c("Mexico", "Russia", 
                "Turkey", "Ukraine", 
                "South Africa") ~ "bottom5",
    name %!in% c("Switzerland", "Lebanon",
                 "Norway", "Sweden", 
                 "United States",
                 "Mexico", "Russia", 
                 "Turkey", "Ukraine", 
                 "South Africa") ~ "other")
  ) |>
  ggplot() +
  geom_line(aes(x = date, y = dollar_price,
                group = name, color = top_bottom,
                alpha = top_bottom)) +
  scale_color_manual(values = c("#FFC72C", "darkgrey", "black")) +
  scale_alpha_manual(values = c(1, .6, 1)) +
  scale_x_date(limits = as.Date(c("2000-01-01", "2023-01-01"))) + 
  labs(title = "Big Mac Index, 2000-2020",
       subtitle = "Top 5 & Bottom 5 Countries with Most Expensive Big Mac Prices, 2020",
       x = "Year",
       y = "Dollar Price (USD)") +
  annotate("text",
           x = as.Date(c("2020-09-01", "2020-09-01", "2020-09-01", "2020-09-01", "2020-09-01")),
           y = c(6.91, 6.25, 6, 5.75, 5.5),
           hjust = 0,
           label = c("Switzerland", "Lebanon", "Sweden", "United States", "Norway")) +
  annotate("text",
           x = as.Date(c("2020-09-01", "2020-09-01", "2020-09-01", "2020-09-01", "2020-09-01")),
           y = c(2.5, 2.27, 2.04, 1.85, 1.63),
           hjust = 0,
           label = c("Mexico", "Ukraine", "Turkey", "Russia", "South Africa"),
           color = "#FFC72C") +
  theme_classic() +
  theme(
    legend.position = "none",
    text = element_text(family = "Helvetica", face = "bold", color = "#FFC72C"),
    plot.background = element_rect(fill = "#DA291C"),
    panel.background = element_rect(fill = "#DA291C"),
    plot.title = element_text(size = rel(1.8)),
    plot.subtitle = element_text(size = rel(1.3)),
    axis.line = element_line(color = "#FFC72C"),
    panel.grid = element_line(color = "#FFC72C"),
    panel.grid.major = element_line(linetype = "dashed"),
    axis.text = element_text(color = "#FFC72C", size = rel(1.05)),
    axis.title = element_text(size = rel(1.2))
  )