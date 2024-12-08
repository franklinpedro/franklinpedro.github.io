library(hexSticker) # hexSticker generator
library(magick)     # Advanced image processing
library(sysfonts)   # font selection
library(tidyverse)

ciencia_img <- image_read("~/site/franklinpedro.github.io/ensino/ciencia-dados/hex_ciencia_dados2.jpeg")
ciencia_img

sticker(
  subplot = ciencia_img,
  package = "ciência\nde\ndados",
  s_width = 1.4,
  s_height = 1.0,
  s_x = 1.0,
  s_y = 0.65,
  p_size = 13,
  h_fill = "white",
  #h_color = "#08519c",
  h_color = "#2f6100",
  h_size = 3,
  #p_color ="#08519c",
  p_color ="#2f6100",
  p_family = "Rubik-Bold",
  filename = "hexfamat31203.png"
) |> print()


#IBM Bold melhor até agora

font_add("Bitter", "Bitter-Regular.ttf")

font_add("Cutive Regular", "Cutive-Regular.ttf")
#SpecialElite-Regular
font_add("Kosugi", "KosugiMaru-Regular.ttf")
font_add("ChivoMono-Bold", "ChivoMono-Bold.ttf")
