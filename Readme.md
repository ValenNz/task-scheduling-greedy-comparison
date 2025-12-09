Berikut adalah contoh **`README.md`** yang profesional, informatif, dan sesuai dengan **deskripsi TUBES Analisis Kompleksitas Algoritma (AKA)** serta topik Anda:

---

# 📊 Analisis Perbandingan Efisiensi Algoritma Iteratif dan Rekursif pada Penjadwalan Tugas dengan Strategi Greedy

> **Tugas Besar Mata Kuliah Analisis Kompleksitas Algoritma (AKA)**  
> Program Studi Informatika – Telkom University Surabaya  
> Semester Ganjil 2025/2026

---

## 🎯 Tujuan
Membandingkan efisiensi **algoritma iteratif** dan **rekursif** dalam menyelesaikan masalah **penjadwalan tugas (task scheduling)** menggunakan strategi **Shortest Job First (SJF)** untuk meminimalkan **total waktu tunggu (waiting time)**. Analisis mencakup:
- Perhitungan kompleksitas waktu asimtotik (Big-O)
- Pengukuran running time aktual pada berbagai ukuran input
- Visualisasi perbandingan performa melalui grafik

---

## 📌 Studi Kasus
Dalam sistem manajemen sumber daya (misalnya CPU, pekerja, atau perangkat), terdapat **N tugas** dengan durasi eksekusi berbeda. Tujuannya:  
**Mengurutkan tugas sedemikian rupa sehingga total waktu tunggu menjadi minimum.**

Solusi optimal:  
✅ **Shortest Job First (SJF)** → urutkan tugas berdasarkan durasi terpendek.

Setelah pengurutan, total waiting time dihitung dengan dua pendekatan:
- **Iteratif**: menggunakan loop
- **Rekursif**: menggunakan pemanggilan fungsi berulang

---

## ⚙️ Implementasi

### 💻 Aplikasi
- **Bahasa**: C++ (standar C++17)
- **Fitur**:
  - Input jumlah tugas (`N`)
  - Generate durasi tugas acak (1–1000)
  - Jalankan kedua algoritma
  - Tampilkan running time (dalam milidetik)
  - Simpan hasil ke `log.txt`
  - Uji ulang tanpa keluar program

### 📈 Visualisasi
- Dukungan plotting via:
  - **Python** (`matplotlib`) → `generate_graph.py`
  - **R/RStudio** → `plot_aka.R`
- Grafik menampilkan perbandingan running time vs ukuran input (`N`)

---

## 📂 Struktur Proyek
```
task-scheduling-greedy-comparison/
├── src/
│   └── main.cpp                 # Aplikasi utama (C++)
├── log.txt                      # Hasil running time (auto-generated)
├── generate_graph.py            # Visualisasi dengan Python
├── plot_aka.R                   # Visualisasi dengan R
├── grafik_perbandingan.png      # Contoh output grafik
├── report.pdf                   # Laporan lengkap TUBES
└── README.md
```

---

## ▶️ Cara Menjalankan

### 1. Kompilasi Aplikasi (C++)
```bash
g++ -std=c++17 -O2 src/main.cpp -o scheduler
```

### 2. Jalankan Aplikasi
```bash
./scheduler
```
> Masukkan nilai `N` (misal: 1000, 10000), lalu ulangi sebanyak yang diperlukan.  
> Hasil akan otomatis disimpan di `log.txt`.

### 3. Generate Grafik (Pilih Salah Satu)

#### Dengan Python:
```bash
pip install matplotlib
python generate_graph.py
```

#### Dengan R/RStudio:
```r
# Buka plot_aka.R di RStudio, pastikan log.txt ada di working directory
# Jalankan seluruh skrip
```

---

## 📈 Contoh Output

```
Masukkan jumlah data (N): 5000
5000 data berhasil di-generate!
========================================
Waktu eksekusi Iteratif: 0.042ms
Waktu eksekusi Rekursif: 0.078ms
========================================
Apakah Anda ingin memasukkan data lagi? (y/n): n
```

![Contoh Grafik](grafik_perbandingan.png)

> *Grafik menunjukkan algoritma iteratif konsisten lebih cepat dan stabil pada input besar.*

---

## 📚 Analisis Utama
- **Kompleksitas Waktu (Teoretis)**:  
  - Sorting: **O(N log N)**  
  - Akumulasi waiting time: **O(N)** (baik iteratif maupun rekursif)
- **Running Time (Praktis)**:  
  - Iteratif: lebih cepat, overhead minimal  
  - Rekursif: overhead stack call, berisiko stack overflow pada `N > 100.000`
- **Kesimpulan**:  
  > **Algoritma iteratif lebih efisien dalam praktik**, meskipun kelas kompleksitasnya sama.

---

## 👥 Anggota Kelompok
- Nuevalen Refitra Alswando  
- Haniel Juanta Sembiring
- Farrellino Ulung Satya Amando 

---

## 📄 Referensi
1. Cormen, T. H., et al. *Introduction to Algorithms* (3rd ed.)  
2. Telkom University. (2025). *Modul Analisis Kompleksitas Algoritma*  
3. GeeksforGeeks. *Shortest Job First Scheduling*

---

## 📄 Lisensi
Proyek ini dibuat untuk keperluan akademik Tugas Besar AKA Telkom University Surabaya dan **tidak untuk tujuan komersial**.

---

> ⚠️ **Catatan**: Pastikan `log.txt` tidak kosong sebelum menjalankan visualisasi!

---

Jika Anda ingin, saya juga bisa bantu:
- Generate versi PDF dari README
- Tambahkan badge build/status (jika deploy CI)
- Buat template laporan LaTeX berdasarkan struktur ini

Silakan beri tahu!