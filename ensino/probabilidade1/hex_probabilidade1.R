library(hexSticker) # hexSticker generator
library(magick)     # Advanced image processing
library(sysfonts)   # font selection
library(tidyverse)
library(extrafont)

font_import()

loadfonts()

dice_img <- image_read("~/site/franklinpedro.github.io/ensino/probabilidade1/dado_prob1.png")
dice_img

sticker(
  subplot = dice_img,
  package = "probabilidade 1",
  s_width = 1.4,
  s_height = 1.0,
  s_x = 1.0,
  s_y = 0.65,
  p_size = 12,
  h_fill = "white",
  h_color = "#2f6100",
  h_size = 3,
  p_color = "#2f6100",
  p_family = "Rubik-Bold",
  filename = "hexfamat31203_2.png"
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
