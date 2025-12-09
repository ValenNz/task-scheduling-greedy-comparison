# Load library yang dibutuhkan
if (!require("readr")) install.packages("readr")
if (!require("dplyr")) install.packages("dplyr")
if (!require("ggplot2")) install.packages("ggplot2")

library(readr)
library(dplyr)
library(ggplot2)

# Baca file log.txt sebagai teks
log_file <- "log"
if (!file.exists(log_file)) stop("File 'log.txt' tidak ditemukan!")

lines <- readLines(log_file)

# Ekstrak data menggunakan regex
data <- do.call(rbind, lapply(lines, function(line) {
  # Ambil angka setelah N=, Iteratif=, Rekursif=
  n_match <- regmatches(line, regexpr("N=(\\d+)", line))
  iter_match <- regmatches(line, regexpr("Iteratif=([\\d.]+)ms", line))
  rek_match <- regmatches(line, regexpr("Rekursif=([\\d.]+)ms", line))
  
  if (length(n_match) > 0 && length(iter_match) > 0 && length(rek_match) > 0) {
    n_val <- as.numeric(sub("N=", "", n_match))
    iter_val <- as.numeric(sub("Iteratif=", "", iter_match))
    rek_val <- as.numeric(sub("Rekursif=", "", rek_match))
    return(data.frame(N = n_val, Iteratif = iter_val, Rekursif = rek_val))
  }
  return(NULL)
}))

# Hapus NULL rows
data <- data[!sapply(data, is.null), ]
data <- bind_rows(data)

# Ubah ke format long untuk ggplot
library(tidyr)
data_long <- pivot_longer(data, cols = c(Iteratif, Rekursif), names_to = "Algoritma", values_to = "Waktu_ms")

# Plot grafik
p <- ggplot(data_long, aes(x = N, y = Waktu_ms, color = Algoritma, shape = Algoritma)) +
  geom_point(size = 3) +
  geom_line() +
  scale_x_log10(name = "Jumlah Tugas (N) - Skala Logaritmik") +
  scale_y_log10(name = "Waktu Eksekusi (ms) - Skala Logaritmik") +
  labs(
    title = "Perbandingan Running Time: Algoritma Iteratif vs Rekursif",
    subtitle = "Penjadwalan Tugas dengan Strategi Shortest Job First (SJF)",
    color = "Algoritma",
    shape = "Algoritma"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "right")

# Tampilkan grafik
print(p)

# Simpan grafik
ggsave("grafik_perbandingan_R.png", plot = p, width = 10, height = 6, dpi = 300)