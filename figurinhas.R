library(tidyverse)

figurinhas <- 1:980
x <- c()


for (j in 1:20000) {
  album <- sample(figurinhas, size = 7, replace = FALSE)
  pacotes <- 1 
  L <- length(unique(album))
  
  while(L < 980) {
    album <- c(album, sample(figurinhas, size = 7, replace = FALSE))
    pacotes <- pacotes + 1 
    L <- length(unique(album))
  }
  x[j] <- pacotes
}

df <- data.frame(quantidade = x)

df |>
  ggplot(aes(x = quantidade)) +
  geom_histogram(fill = "darkgrey", col = "black", bins = 30) +
  scale_x_continuous(breaks = seq(from = 700, to = 2500, by = 200)) +
  labs(x = "Número de pacotes comprados para completar o álbum",
       y = "Número de simulações",
       title = "Distribuição do número de pacotes necessários para completar o álbum da Copa") +
  theme_bw() 

df |>
  ggplot(aes(x = quantidade)) +
  geom_histogram(fill = "lightbrown", col = "black", bins = 30) +
  scale_x_continuous(breaks = seq(from = 700, to = 2500, by = 200)) +
  theme_void() 

