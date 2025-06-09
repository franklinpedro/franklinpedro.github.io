# Bibliotecas necessárias
library(ggplot2)

# Função para criar a curva gaussiana com áreas nas caudas preenchidas
plot_gaussian_with_tails <- function(mean = 0, sd = 1, tail_prob = 0.05) {
  # Gera sequência de pontos para a curva
  x <- seq(mean - 4*sd, mean + 4*sd, length.out = 200)
  
  # Calcula a densidade da distribuição normal
  densidade <- dnorm(x, mean = mean, sd = sd)
  
  # Calcula os pontos de corte para as caudas
  lower_tail_cut <- qnorm(tail_prob, mean = mean, sd = sd)
  upper_tail_cut <- qnorm(1 - tail_prob, mean = mean, sd = sd)
  
  # Prepara os dados para o plot
  df <- data.frame(x = x, densidade = densidade)
  
  # Cria o plot com ggplot2
  ggplot(df, aes(x = x, y = densidade)) +
    # Curva principal
    geom_line(color = "blue", size = 1) +
    
    # Preenchimento da cauda esquerda
    geom_area(data = subset(df, x <= lower_tail_cut), 
              aes(x = x, y = densidade), 
              fill = "red", 
              alpha = 0.3) +
    
    # Preenchimento da cauda direita
    geom_area(data = subset(df, x >= upper_tail_cut), 
              aes(x = x, y = densidade), 
              fill = "red", 
              alpha = 0.3) +
    
    # Personalização do gráfico
    labs(title = "Curva Gaussiana com Caudas Preenchidas",
         x = "Valor",
         y = "Densidade de Probabilidade") +
    theme_minimal() +
    
    # Adiciona linhas verticais nos pontos de corte
    geom_vline(xintercept = lower_tail_cut, color = "red", linetype = "dashed") +
    geom_vline(xintercept = upper_tail_cut, color = "red", linetype = "dashed")
}

# Gera o gráfico
plot_gaussian_with_tails()

# Se quiser salvar a imagem
# ggsave("curva_gaussiana_caudas.png", width = 10, height = 6)