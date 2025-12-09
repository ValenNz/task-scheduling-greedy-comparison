#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <chrono>
#include <fstream>

using namespace std;
using namespace std::chrono;

long long hitungWaitingTimeRekursif(const vector<int>& sorted, int idx, long long acc, long long total) {
    if (idx == (int)sorted.size() - 1) return total;
    long long newAcc = acc + sorted[idx];
    return hitungWaitingTimeRekursif(sorted, idx + 1, newAcc, total + newAcc);
}

long long hitungWaitingTimeIteratif(const vector<int>& sorted) {
    long long totalWaitingTime = 0;
    long long cumulativeTime = 0;
    for (int i = 0; i < (int)sorted.size() - 1; ++i) {
        cumulativeTime += sorted[i];
        totalWaitingTime += cumulativeTime;
    }
    return totalWaitingTime;
}

// Generate data acak
vector<int> generateRandomTasks(int n) {
    vector<int> tasks(n);
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<> dis(1, 1000);
    for (int i = 0; i < n; ++i) {
        tasks[i] = dis(gen);
    }
    return tasks;
}

int main() {
    cout << "========================================" << endl;
    cout << "  ANALISIS KOMPLEKSITAS ALGORITMA       " << endl;
    cout << "  TASK SCHEDULING - SJF OPTIMIZATION   " << endl;
    cout << "========================================" << endl;

    ofstream logFile("log.txt", ios::app);

    while (true) {
        int n;
        cout << "\nMasukkan jumlah data (N): ";
        cin >> n;

        auto start = high_resolution_clock::now();

        vector<int> tasks = generateRandomTasks(n);
        cout << n << " data berhasil di-generate!" << endl;
        cout << "========================================" << endl;

        sort(tasks.begin(), tasks.end());

        auto startIteratif = high_resolution_clock::now();
        long long resultIteratif = hitungWaitingTimeIteratif(tasks);
        auto stopIteratif = high_resolution_clock::now();
        auto durationIteratif = duration_cast<microseconds>(stopIteratif - startIteratif).count() / 1000.0;

        auto startRekursif = high_resolution_clock::now();
        long long resultRekursif = hitungWaitingTimeRekursif(tasks, 0, 0, 0);
        auto stopRekursif = high_resolution_clock::now();
        auto durationRekursif = duration_cast<microseconds>(stopRekursif - startRekursif).count() / 1000.0;

        cout << "Waktu eksekusi Iteratif: " << durationIteratif << " detik" << endl;
        cout << "Waktu eksekusi Rekursif: " << durationRekursif << " detik" << endl;
        cout << "========================================" << endl;

        logFile << "N=" << n << ", Iteratif=" << durationIteratif << "ms, Rekursif=" << durationRekursif << "ms" << endl;

        char ulang;
        cout << "Apakah Anda ingin memasukkan data lagi? (y/n): ";
        cin >> ulang;
        if (ulang != 'y' && ulang != 'Y') break;
    }

    logFile.close();
    cout << "\nTerima kasih telah menggunakan aplikasi ini!" << endl;
    return 0;
}