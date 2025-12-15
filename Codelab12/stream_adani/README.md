# stream_adani

# PRAKTIKUM 1 : Dart Streams         

![hasil](img/kodepraktikum1.png)      

![hasil](img/praktikum1.png)      

-- menambahkan stream.dart

![hasil](img/kodepraktikum1b.png)      

![hasil](img/praktikum1b.png)      

![hasil](img/praktikum1c.png)      

![hasil](img/praktikum1d.png)      

![hasil](img/praktikum1e.png)      

Jawaban Soal 3 :

Fungsi keyword yield*: Keyword ini digunakan untuk mendelegasikan (mengoper) pembuatan nilai ke Stream lain (sub-stream). Dalam konteks ini, getColors mengambil seluruh event yang dihasilkan oleh Stream.periodic dan meneruskannya keluar seolah-olah getColors sendiri yang menghasilkannya.

Maksud perintah kode tersebut: Kode Stream.periodic membuat stream yang memancarkan event setiap 1 detik. Parameter (int t) adalah hitungan detik yang berjalan (0, 1, 2, ...). Rumus t % colors.length digunakan untuk mendapatkan index warna secara berulang (looping) agar tidak index out of bounds.

Jawaban Soal 5 : Perbedaan listen dan await for:

await for: Ini adalah konstruksi looping yang digunakan di dalam fungsi async. Ia akan menunggu (memblokir eksekusi baris kode di bawahnya dalam fungsi tersebut) sampai stream selesai atau ditutup. Ini cocok jika kita ingin memproses stream secara berurutan dalam satu alur fungsi.

listen: Ini adalah metode standar untuk men-subscribe sebuah stream. Ia tidak memblokir eksekusi kode selanjutnya. listen mendaftarkan sebuah callback function yang akan dipanggil setiap kali ada data baru. Ia mengembalikan objek StreamSubscription yang bisa digunakan untuk mengontrol stream (pause, resume, cancel).


# PRAKTIKUM 2 : Stream controllers dan sinks            

![hasil](img/praktikum2.png)      

![hasil](img/praktikum2b.png)    

Soal 6: Jelaskan maksud kode langkah 8 dan 10 tersebut!

Jawaban:

Langkah 8 (initState): Pada langkah ini, kita melakukan inisialisasi objek NumberStream dan StreamController. Bagian terpenting adalah stream.listen((event) { ... }). Kode ini berfungsi untuk berlangganan (subscribe) ke stream. Setiap kali ada data baru yang masuk ke stream, fungsi di dalam listen akan dijalankan. Di sini, kita memanggil setState untuk memperbarui variabel lastNumber dengan data terbaru (event), yang kemudian akan memicu rebuild pada UI untuk menampilkan angka baru tersebut.

Langkah 10 (addRandomNumber): Method ini berfungsi sebagai pemicu (producer) data. Kita membuat angka acak (0-9) menggunakan Random(). Kemudian, kode numberStream.addNumberToSink(myNum) memasukkan angka tersebut ke dalam Sink milik StreamController. Setelah masuk ke Sink, data akan mengalir ke Stream, ditangkap oleh listener (di langkah 8), dan akhirnya muncul di layar.

Soal 7: Jelaskan maksud kode langkah 13 sampai 15 tersebut!

Jawaban:

Langkah 13: Kita menambahkan method addError() pada class NumberStream yang berfungsi untuk mengirimkan event Error ke dalam sink menggunakan controller.sink.addError('error'). Ini mensimulasikan kejadian jika terjadi kesalahan pada stream.

Langkah 14: Kita menambahkan properti onError pada method .listen() di main.dart. Ini berfungsi sebagai exception handler. Jika stream menerima event error (bukan data biasa), maka blok kode di dalam onError yang akan dijalankan, bukan blok utamanya. Dalam kasus ini, kita mengubah nilai lastNumber menjadi -1 sebagai penanda error.

Langkah 15: Kita sengaja memanggil numberStream.addError() saat tombol ditekan untuk menguji apakah fungsi handling error bekerja. Hasilnya, UI menampilkan angka -1, membuktikan bahwa event error berhasil ditangkap.

# PRAKTIKUM 3 : Injeksi data ke streams



 