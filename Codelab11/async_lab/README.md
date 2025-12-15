# async_lab

# PRAKTIKUM 1 : Mengunduh Data dari Web Service (API)

![hasil](img/praktikum1.png)   

# PRAKTIKUM 2 : Menggunakan await/async untuk menghindari callbacks

![hasil](img/kodepraktikum2.png)      

![hasil](img/praktikum2.png)      

![hasil](img/praktikum2b.png)      

Jawaban Soal
Pertanyaan: Jelaskan maksud kode langkah 1 dan 2 tersebut!

Jawaban:

Langkah 1 (Deklarasi Method Async): Kita membuat tiga fungsi (returnOneAsync, returnTwoAsync, returnThreeAsync) yang bertipe Future<int>. Setiap fungsi memiliki jeda waktu (delay) selama 3 detik sebelum mengembalikan nilai integer (1, 2, dan 3). Kata kunci async menandakan bahwa fungsi ini bersifat asynchronous, dan await Future.delayed memastikan fungsi menunggu waktunya habis sebelum lanjut mengembalikan nilai.

Langkah 2 (Eksekusi Sequential dengan await): Pada method count(), kita menjumlahkan hasil dari ketiga fungsi tersebut. Poin kuncinya adalah penggunaan kata kunci await pada setiap pemanggilan fungsi.

Ketika await returnOneAsync() dipanggil, kode berhenti menunggu selama 3 detik sampai angka 1 didapat.

Baru setelah itu, await returnTwoAsync() dijalankan (menunggu 3 detik lagi).

Terakhir await returnThreeAsync() dijalankan (menunggu 3 detik lagi).

Karena dijalankan secara berurutan (tunggu satu selesai, baru lanjut ke berikutnya), total waktu yang dibutuhkan adalah 3 + 3 + 3 = 9 detik. Hasil akhirnya adalah 1 + 2 + 3 = 6. Kode ini ditulis seperti kode synchronous biasa (mudah dibaca dari atas ke bawah) namun berjalan secara asynchronous.

# PRAKTIKUM 3 : Menggunakan Completer di Future    

![hasil](img/kodepraktikum3.png)      

# PRAKTIKUM 4: Memanggil Future secara paralel

![hasil](img/kodepraktikum4.png)      

# PRAKTIKUM 5: Menangani Respon Error pada Async Code

![hasil](img/kodepraktikum5.png)      

# PRAKTIKUM 6 : Menggunakan Future dengan StatefulWidget


