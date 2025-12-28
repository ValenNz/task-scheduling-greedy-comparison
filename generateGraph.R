#Untuk generate grafik menggunakan R

# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Data dari tabel di laporan (n vs waktu dalam milidetik)
data <- data.frame(
  n = c(10, 100, 1000, 10000, 50000, 100000),
  Iteratif_ms = c(0.001, 0.005, 0.002, 0.018, 0.092, 0.187),
  Rekursif_ms = c(0.002, 0.008, 0.004, 0.032, 0.165, 0.341)
)

# Ubah ke format long untuk plotting
plot_data <- data %>%
  pivot_longer(
    cols = c(Iteratif_ms, Rekursif_ms),
    names_to = "Algoritma",
    values_to = "Waktu_ms"
  ) %>%
  mutate(Algoritma = factor(Algoritma, 
                            levels = c("Iteratif_ms", "Rekursif_ms"),
                            labels = c("Iteratif", "Rekursif")))

# Plot
ggplot(plot_data, aes(x = n, y = Waktu_ms, color = Algoritma, group = Algoritma)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  scale_x_log10(breaks = data$n, labels = scales::comma) +  # log scale karena rentang n sangat lebar
  scale_y_continuous(trans = 'log10', labels = scales::number_format(accuracy = 0.001)) +
  labs(
    title = "Perbandingan Waktu Eksekusi: Algoritma Iteratif vs Rekursif",
    subtitle = "Pada Penjadwalan Tugas dengan Optimasi Waktu Tunggu (SJF)",
    x = "Jumlah Tugas (n)",
    y = "Waktu Eksekusi (milidetik, skala log)",
    color = "Algoritma"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "top"
  )

