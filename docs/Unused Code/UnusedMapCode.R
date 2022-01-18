# Nice GEOM_SF Map

ggplot() + 
  geom_sf(data = us_states, fill = "grey20", color = NA, size = 2) +
  geom_sf(data = MapDataTable, 
          aes(fill = LaborRatioRounded, 
              geometry = geometry), color = NA) +
  geom_sf(data = county_subdivisions_map, 
          aes(geometry = geometry), fill = NA, color = "white") + #grey10
  geom_sf(data = ca_water_na, 
          aes(geometry = geometry), fill = "white", color = NA) +
  geom_sf(data = ca_state, 
          aes(geometry = geometry), fill = NA, color = "white", size = .75) +
  geom_sf(data = us_states, fill = NA, color = 'black', size = .9) +
  labs(fill = "Workers:Permits",
       caption = "Time: 2009-2019") +
  scale_fill_manual(breaks = c("-2","-1","1","2","3","4"),
                    labels = c("Lost Workers",
                               "\u22641:1",
                               ">1:1",
                               ">2:1",
                               ">3:1",
                               ">4:1"),
                    values = cols) +
  theme_void() +
  theme(legend.title = element_text(size = 12, face = "bold"),
        legend.text = element_text(size = 12),
        legend.position = c(.17, .12),
        legend.direction = "vertical",
        legend.key.width = unit(10, "mm"),
        plot.background = element_rect(fill = NULL)) +
  coord_sf(xlim = st_bbox(ca_counties_bb)[c(1, 3)],
           ylim = st_bbox(ca_counties_bb)[c(2, 4)])

