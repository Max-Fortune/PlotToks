library(tidyverse)
library(lubridate)
tt <- tidytuesdayR::tt_load("2022-03-01")
df <- tt$stations
theme_set(theme_classic())
df$OPEN_DATE <- lubridate::date(df$OPEN_DATE)
p <- df %>%
  mutate(new_date = floor_date(as_date(OPEN_DATE), "month")) %>% 
  group_by(new_date) %>%
  summarize(n = n()) %>%
  filter(new_date > date("2010-01-01")) %>%
  ggplot(aes(x = new_date, y = n)) +
  geom_col(fill = "white") +
  scale_x_date(breaks = seq(ymd('2010-01-01'),ymd('2022-07-01'), by = "years"),
               labels = scales::date_format(format = "%Y"),
               expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(3000, 12000, 3000), position = "right",
                     labels = scales::comma) +
  labs(title = "Total Monthly Openings of Alternative Fuel Stations",
       subtitle = "U.S. & Canada", x = "", y = "",
       caption = "Alternative Fuels Data Center, U.S. Dept. of Energy\n@solplots") +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(size = .2),
        axis.ticks = element_blank(),
        plot.title = element_text(face = "bold"),
        plot.margin = margin(1, 1.2, 1, 1.2, "cm"),
        text = element_text(family = "Georgia", color = "white"),
        axis.text = element_text(size = 11,color = "white"),
        panel.background = element_rect(fill = "grey40"),
        plot.background = element_rect(fill = "grey40"),
        axis.line = element_line(color = "white"))
ggsave("p.png", p)
p

