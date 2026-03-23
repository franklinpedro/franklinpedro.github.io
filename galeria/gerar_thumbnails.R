# ============================================================
# Gerador de thumbnails para galeria fotográfica
# Requisito: install.packages("magick")
# ============================================================
# Execute este script UMA vez, dentro da pasta do seu projeto
# Quarto (onde estão os .jpg da galeria).
# Ele cria uma subpasta "thumbs/" com versões redimensionadas
# de cada foto, mantendo os originais intactos.
# ============================================================

library(magick)

# --- Configurações ---
THUMB_WIDTH   <- 800   # largura máxima da thumbnail em pixels
                       # (altura é proporcional, preserva aspect ratio)
THUMB_QUALITY <- 82    # qualidade JPEG (0–100); 82 é um bom equilíbrio
THUMB_DIR     <- "thumbs"

# --- Cria a pasta de thumbnails se não existir ---
if (!dir.exists(THUMB_DIR)) dir.create(THUMB_DIR)

# --- Lista todos os JPGs na pasta atual (exceto os já em thumbs/) ---
fotos <- list.files(
  path       = ".",
  pattern    = "\\.(jpg|jpeg|JPG|JPEG)$",
  full.names = FALSE,
  recursive  = FALSE
)

cat(sprintf("Encontradas %d fotos. Gerando thumbnails...\n\n", length(fotos)))

for (foto in fotos) {
  destino <- file.path(THUMB_DIR, foto)

  # Pula se o thumbnail já existir (útil ao adicionar fotos novas)
  if (file.exists(destino)) {
    cat(sprintf("  [já existe] %s\n", foto))
    next
  }

  img <- image_read(foto)

  # Redimensiona apenas se a imagem for mais larga que THUMB_WIDTH
  info <- image_info(img)
  if (info$width > THUMB_WIDTH) {
    img <- image_resize(img, geometry_size_pixels(width = THUMB_WIDTH))
  }

  img <- image_write(img, path = destino, format = "jpeg", quality = THUMB_QUALITY)

  # Tamanho antes/depois para referência
  tam_original  <- round(file.size(foto)    / 1024)
  tam_thumb     <- round(file.size(destino) / 1024)
  reducao       <- round((1 - tam_thumb / tam_original) * 100)

  cat(sprintf(
    "  %-50s  %5d KB → %5d KB  (-%d%%)\n",
    foto, tam_original, tam_thumb, reducao
  ))
}

cat("\nPronto! Thumbnails salvas em ./thumbs/\n")
cat("Lembre de adicionar 'thumbs/' ao seu .gitignore se não quiser\n")
cat("versionar as miniaturas (recomendado: regerar no build).\n")
