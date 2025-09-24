# Codelab 04

Praktikum 1: Eksperimen Tipe Data List

langkah 1 dan 2 : tidak ada error, output sesuai. 
![Gambar Praktikum1a](img/Praktikum1a.png)  

langkah 3 : menambahkan kode dan memasukkan nama dan nim ke dalam kode.
![Gambar Praktikum1b](img/Praktikum1b.png)  

Praktikum 2: Eksperimen Tipe Data Set

langkah 1 : tidak ada error, output sesuai dan mencetak semua elemen yang ada di dalam variabel halogens.
![Gambar Praktikum2a](img/Praktikum2a.png)  

langkah 2 : tidak ada error.
![Gambar Praktikum2b](img/Praktikum2b.png)  

menambahkan nama dan NIM ke names1 (menggunakan .add()) dan names2 (menggunakan .addAll()), dan hapus variabel Map (names3)
![Gambar Praktikum2c](img/Praktikum2c.png)  

Praktikum 3 : Eksperimen Tipe Data Maps

langkah 1 dan 2 : kedua variabel, gifts dan nobleGases, dideklarasikan sebagai Map. Map adalah koleksi data yang menyimpan pasangan key-value
![Gambar Praktikum3a](img/Praktikum3a.png)  

langkah 3 : awalnya ada error, untuk menghilangkan error dan membuat kode berjalan dengan tipe yang konsisten (seperti Map<String, String> dan Map<int, String>), kita harus menggunakan variabel baru (mhs1, mhs2) atau mendeklarasikan ulang tipe gifts dan nobleGases
![Gambar Praktikum3b](img/Praktikum3b.png)  

Praktikum 4: Eksperimen Tipe Data List: Spread dan Control-flow Operators

langkah 1 dan 2 : Terjadi Error. Variabel list1 pada baris print(list1); tidak pernah dideklarasikan. Anda mungkin bermaksud mencetak list.
![Gambar Praktikum4a](img/Praktikum4a.png)  

perbaikan: Ganti print(list1); menjadi print(list)
![Gambar Praktikum4aFixed](img/Praktikum4aFixed.png)  

langkah 3 : Terjadi Error karena list1 tidak didefinisikan. Asumsi perbaikan dari Langkah 2 adalah mengganti list1 dengan list.
![Gambar Praktikum4b](img/Praktikum4b.png)  

Perbaikan: Ganti list1 menjadi list
![Gambar Praktikum4bFixed](img/Praktikum4bFixed.png)  

menambahkan nim
![Gambar Praktikum4c](img/Praktikum4c.png)  

langkah 4 : ada error
![Gambar Praktikum4d](img/Praktikum4d.png)  

![Gambar Praktikum4dFixed](img/Praktikum4dFixed.png)  

langlah 5 : ada error
![Gambar Praktikum4e](img/Praktikum4e.png)  

![Gambar Praktikum4eFixed](img/Praktikum4eFixed.png)  

langkah 6 : 
![Gambar Praktikum4f](img/Praktikum4f.png)  

Praktikum 5: Eksperimen Tipe Data Records

langkah 1 dan 2 : tidak ada error, berhasil mencetak representasi string dari Record tersebut, termasuk nama field yang diberi nama.
![Gambar Praktikum5a](img/Praktikum5a.png)  

langkah 3 : tidak ada error, (10, 20) diteruskan ke swap. Di dalamnya, a menjadi 10 dan b menjadi 20. Fungsi mengembalikan Record baru (20, 10)
![Gambar Praktikum5b](img/Praktikum5b.png)  

langkah 4 : ada error karena mahasiswa belum dideklarasikan.
![Gambar Praktikum5c](img/Praktikum5c.png)  

perbaikan : diisi dengan nim dan mana
![Gambar Praktikum5cFixed](img/Praktikum5cFixed.png)  

langkah 5 : tidak ada error.
![Gambar Praktikum5d](img/Praktikum5d.png)  

Tugas Praktikum

a. Jelaskan yang dimaksud Functions dalam bahasa Dart!  
jawab : Functions (Fungsi) dalam bahasa Dart adalah blok kode yang terorganisir dan dapat digunakan kembali untuk melakukan satu tugas tertentu.

b. Jelaskan jenis-jenis parameter di Functions beserta contoh sintaksnya! 
![Gambar TugasPraktikum3](img/TugasPraktikum3.png)  
jawab : jenis-jenis parameter di functions adalah : Positional Parameters (Wajib urutan), Optional Positional Parameters (Boleh dikosongkan, pakai []), Named Parameters (Menggunakan {}), dan Required Named Parameters (pakai required).

c. Jelaskan maksud Functions sebagai first-class objects beserta contoh sintaknya!  
![Gambar TugasPraktikum4](img/TugasPraktikum4.png)  
jawab : Di Dart, fungsi adalah first-class objects, artinya fungsi diperlakukan seperti data/objek lain. Bisa disimpan ke variabel, dikirim sebagai argumen, atau dikembalikan dari fungsi lain.

d. Apa itu Anonymous Functions? Jelaskan dan berikan contohnya!  
![Gambar TugasPraktikum5](img/TugasPraktikum5.png)  
jawab : Anonymous Function (fungsi tanpa nama) adalah fungsi yang didefinisikan langsung tanpa memberi nama, biasanya dipakai sekali atau sebagai argumen.

e. Jelaskan perbedaan Lexical scope dan Lexical closures! Berikan contohnya!  
![Gambar TugasPraktikum6](img/TugasPraktikum6.png)  
jawab : Lexical Scope: Variabel dalam fungsi hanya bisa diakses dalam blok di mana variabel itu dideklarasikan, sedangkan :exical Closure: Fungsi bisa "mengingat" variabel dari scope di luar dirinya, meskipun scope itu sudah selesai dieksekusi.

f. Jelaskan dengan contoh cara membuat return multiple value di Functions!  
jawab : Dart tidak mendukung return banyak nilai secara langsung, tapi bisa pakai:
![Gambar TugasPraktikum7](img/TugasPraktikum7.png)  