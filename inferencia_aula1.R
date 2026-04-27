amostra <- sample(populacao, size = 1000, replace = TRUE)
amostra


li <- mean(amostra) - 1.96*1/sqrt(1000)
ls <- mean(amostra) + 1.96*1/sqrt(1000)
c(li, ls)

mean(amostra)
medias <- c()

for(j in 1:10000){
  amostra <- sample(populacao, size = 2000, replace = TRUE)
  medias[j] <- mean(amostra)
}
medias
hist(medias)

