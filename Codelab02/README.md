# Soal 2
# Mengapa Memahami Bahasa Pemrograman Dart Sangat Penting Sebelum Menggunakan Flutter?

memahami bahasa pemrograman dart sangat penting sebelum menggunakan flutter karena dart adalah bahasa inti yang digunakan untuk membangun semua aplikasi flutter. flutter hanyalah kumpulan library dan tool yang ditulis dalam dart.

# Soal 3
# Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter.

dart adalah bahasa pemrograman inti yang digunakan oleh flutter. flutter bukan hanya kerangka kerja, tetapi juga ekosistem yang dibangun sepenuhnya di atas dart. jadi, memahami dart adalah fundamental untuk menjadi pengembang flutter. fitur modern dart di antaranya adakah productive tooling, garbage collection, type safety, dan probability 

kode dart dapat dieksekusi melalui dua cara, yaitu dart virtual machine (vm) dan kompilasi ahead of time (aot). dart memiliki sintaks yang mirip dengan bahasa lain seperti c dan javascript. operators dart antara lain : aritmetika (+, -, *, /, ~/, %), increment dan decrement (++ dan --), equality dan relational (==, !=, >, <, >=, <=), dan logika (!, ||, &&)

# Soal 4
# Buatlah penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late variabel !

null safety adalah fitur di dart yang mencegah kesalahan umum yang sering disebut null reference exception atau null pointer exception. fitur ini memastikan bahwa sebuah variabel tidak dapat memiliki nilai null kecuali jika kita secara eksplisit menyatakannya. sedangkan, late variabel adalah modifier yang digunakan untuk mendeklarasikan sebuah variabel yang tidak akan diinisialisasi segera, tetapi dijamin akan diinisialisasi sebelum.

penjelasan kode eksekusi tentang perbedaan null safety dan late variabel : 
jadi, null safety menandai bahwa variabel bisa bernilai null, sedangkan late variabel menunda inisialisasi variabel yang dijamin akan bernilai. cara penggunaan null safety adalah saat tidak yakin apakah sebuah variabel akan memiliki nilai atau tidak, sedangkan cara penggunaan late variabel adalah saat yakin variabel akan memiliki nilai, tetapi tidak bisa menginisialisasinya saat deklarasi.