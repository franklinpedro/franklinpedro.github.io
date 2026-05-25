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


library(tidyverse)
faces <- 1:6
z <- c()
for (j in 1:40000) {
  lancamentos <- sample(faces, size = 1, replace = FALSE)
  total <- 1
  L <- length(unique(lancamentos))
  
  while (L < 6) {
    lancamentos <- c(lancamentos, sample(faces, size = 1, replace = FALSE))
    total <- total + 1
    L <- length(unique(lancamentos))
  }
  z[j] <- total
}
df_dado <- data.frame(quantidade = z)
df_dado |>
  ggplot(aes(x = quantidade)) +
  geom_histogram(col = "darkgreen", fill = "#C8970A", bins = 30) +
  scale_x_continuous(breaks = seq(from = 0, to = 80, by = 5)) +
  labs(x = "Número de lançamentos para obter todas as faces",
       y = "Número de simulações",
       title = "Distribuição do número de lançamentos necessários para completar o dado") +
  theme_bw()
