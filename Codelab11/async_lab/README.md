# async_lab

# PRAKTIKUM 1 : Mengunduh Data dari Web Service (API)

![hasil](img/praktikum1.png)   

# PRAKTIKUM 2 : Menggunakan await/async untuk menghindari callbacks

![hasil](img/kodepraktikum2.png)      

![hasil](img/praktikum2.png)      

![hasil](img/praktikum2b.png)      

Jawaban Soal 4
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

![hasil](img/praktikum3.png)      

![hasil](img/praktikum3b.png)      

Jawaban Soal 5
Pertanyaan: Jelaskan maksud kode langkah 2 tersebut!

Jawaban: Kode pada langkah 2 bertujuan untuk membuat mekanisme Future secara manual menggunakan Completer.

completer = Completer<int>();: Kita membuat object Completer baru yang nantinya akan menghasilkan nilai bertipe int.

return completer.future;: Pada method getNumber, kita tidak menunggu proses selesai. Kita langsung mengembalikan object Future dari completer tersebut. Ini seperti memberikan "janji" (tiket) kepada pemanggil bahwa nanti akan ada data.

calculate() & completer.complete(42): Method calculate berjalan secara asynchronous (menunggu 5 detik). Setelah waktu habis, kita memanggil completer.complete(42). Perintah ini memberitahu Completer bahwa tugas sudah selesai dan "janji" tadi dipenuhi dengan nilai 42. Saat baris ini dieksekusi, bagian .then() di tombol akan berjalan.

![hasil](img/kodepraktikum3fix.png)      

![hasil](img/praktikum3c.png)      

Jawaban Soal 6
Pertanyaan: Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!

Jawaban:

Langkah 2 (Sukses): Kode ini berasumsi proses selalu berhasil. Method calculate() menggunakan completer.complete(42) untuk mengirimkan data sukses. Di bagian pemanggil (Langkah 3), kita hanya menggunakan .then() untuk menangkap data sukses tersebut.

Langkah 5-6 (Error Handling):

Pada Langkah 5, kita mensimulasikan kegagalan proses (menggunakan try-catch dan throw Exception). Alih-alih complete(), kita menggunakan completer.completeError({}). Ini memberitahu Future bahwa tugas gagal.

Pada Langkah 6, kita menambahkan blok .catchError(...) setelah .then(). Ini berfungsi untuk "menangkap" jika completer mengirimkan status error. Jika kita tidak menambahkan catchError, aplikasi bisa crash (Uncaught Exception) saat completer.completeError dipanggil.

# PRAKTIKUM 4: Memanggil Future secara paralel

![hasil](img/kodepraktikum4.png)      

![hasil](img/praktikum4.png)      

Jawaban Soal 8
Pertanyaan: Jelaskan maksud perbedaan kode langkah 1 dan 4!

Jawaban:

Langkah 1 (FutureGroup): Menggunakan FutureGroup dari package async. Class ini lebih fleksibel jika kita memiliki skenario yang kompleks di mana jumlah future yang ingin dijalankan belum diketahui di awal. Kita bisa menggunakan .add() berulang kali di berbagai bagian kode logika, dan baru memanggil .close() saat kita yakin semua future sudah ditambahkan. Ini berguna untuk kasus dynamic batch processing.

Langkah 4 (Future.wait): Menggunakan Future.wait yang merupakan bawaan dari Dart (dart:async). Ini adalah cara yang lebih bersih, ringkas, dan standar untuk menangani kumpulan future yang sudah fix (tetap) dan diketahui jumlahnya sejak awal. Kita langsung memasukkan List future ke dalam konstruktor. Kode menjadi lebih pendek karena tidak perlu inisialisasi group, add manual, dan close manual. Untuk kasus praktikum ini (hanya 3 fungsi tetap), Future.wait sebenarnya lebih efisien secara penulisan kode.

# PRAKTIKUM 5: Menangani Respon Error pada Async Code

![hasil](img/kodepraktikum5.png)      

# PRAKTIKUM 6 : Menggunakan Future dengan StatefulWidget


