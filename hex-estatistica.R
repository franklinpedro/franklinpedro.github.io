library(palmerpenguins)
library(ggplot2)

penguins_clean <- na.omit(penguins)

ggplot(penguins_clean, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_jitter(color = "black", alpha = 0.5, size = 7) +
  geom_smooth(method = "lm", se = FALSE, color = "#8B4000", linewidth = 4) +
  theme_void()

ggsave("ensino/estatistica/regressao.png", width = 14, height = 9, dpi = 300, bg = "transparent")

library(hexSticker) # hexSticker generator
library(magick)     # Advanced image processing
library(sysfonts)   # font selection
library(tidyverse)
library(extrafont)

font_import()

loadfonts()

regressao_img <- image_read("~/site/franklinpedro.github.io/ensino/estatistica/regressao.png")
regressao_img

sticker(
  subplot = regressao_img,
  package = "estatística",
  s_width = 1.4,
  s_height = 1.0,
  s_x = 1.0,
  s_y = 0.85,
  p_size = 18,
  h_fill = "white",
  h_color = "#8B4000",
  h_size = 3,
  p_color = "#8B4000",
  p_family = "Rubik-Bold",
  filename = "hex-inferencia.png"
) |> print()


#IBM Bold melhor até agora
#RubikMonoOne-Regular

font_add("IBM-Bold", "~/fontes/IBMPlexMono-Bold.ttf")
font_add("Rubik-Bold", "~/fontes/RubikMonoOne-Regular.ttf")
font_add("Bitter", "Bitter-Regular.ttf")

font_add("Cutive Regular", "Cutive-Regular.ttf")
#SpecialElite-Regular
font_add("Kosugi", "KosugiMaru-Regular.ttf")
font_add("ChivoMono-Bold", "ChivoMono-Bold.ttf")
