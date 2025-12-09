import matplotlib.pyplot as plt
import re

def parse_log_file(filename):
    n_values = []
    iteratif_times = []
    rekursif_times = []

    with open(filename, 'r') as file:
        for line in file:
            # Regex untuk menangkap N, Iteratif, dan Rekursif
            match = re.search(r'N=(\d+),\s*Iteratif=([\d.]+)ms,\s*Rekursif=([\d.]+)ms', line)
            if match:
                n = int(match.group(1))
                iteratif = float(match.group(2))
                rekursif = float(match.group(3))
                n_values.append(n)
                iteratif_times.append(iteratif)
                rekursif_times.append(rekursif)
    
    return n_values, iteratif_times, rekursif_times

def plot_graph(n_values, iteratif_times, rekursif_times):
    plt.figure(figsize=(10, 6))
    plt.plot(n_values, iteratif_times, marker='o', label='Iteratif', color='blue')
    plt.plot(n_values, rekursif_times, marker='s', label='Rekursif', color='red')

    plt.title('Perbandingan Running Time: Algoritma Iteratif vs Rekursif\n(Penjadwalan Tugas - Minimasi Waktu Tunggu)')
    plt.xlabel('Jumlah Tugas (N)')
    plt.ylabel('Waktu Eksekusi (milidetik)')
    plt.grid(True, linestyle='--', alpha=0.6)
    plt.legend()
    plt.xscale('log')  # Skala logaritmik untuk sumbu X agar distribusi data merata
    plt.yscale('log')  # Opsional: jika perbedaan besar
    plt.tight_layout()

    # Simpan grafik
    plt.savefig('grafik_perbandingan.png', dpi=300)
    print("Grafik berhasil disimpan sebagai 'grafik_perbandingan.png'")

    # Tampilkan grafik
    plt.show()

if __name__ == "__main__":
    try:
        n_vals, iter_vals, rek_vals = parse_log_file('log.txt')
        if not n_vals:
            print("ERROR: Tidak ada data valid ditemukan di log.txt!")
            print("Pastikan format log sesuai: N=100, Iteratif=0.02ms, Rekursif=0.04ms")
        else:
            plot_graph(n_vals, iter_vals, rek_vals)
    except FileNotFoundError:
        print("ERROR: File 'log.txt' tidak ditemukan!")
        print("Jalankan aplikasi C++ terlebih dahulu untuk menghasilkan log.")