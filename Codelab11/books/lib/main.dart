import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async'; // Diperlukan untuk Future dan error handling

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemrograman Asynchronous Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  // Variabel untuk menyimpan hasil data dari API
  String result = '';
  // Variabel untuk mengontrol status loading
  bool isDataLoading = false;

  // Praktikum 1: Method untuk mengambil data dari Google Books API
  Future<http.Response> getData() {
    // ID buku dari URL yang Anda berikan (pJmyEAAAQBAJ)
    // Perhatikan: Endpoint diubah ke API URL yang benar untuk mendapatkan respons JSON
    const String path = 'https://www.googleapis.com/books/v1/volumes/pJmyEAAAQBAJ'; 
    final Uri uri = Uri.parse(path);
    
    // http.get mengembalikan sebuah Future<http.Response>
    return http.get(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Jawaban Soal 1: Tambahkan nama panggilan Anda
        title: const Text('Adani Salsabila - Codelab11 - Async Programming'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            // Bagian untuk menampilkan hasil atau indikator loading
            Expanded(
              child: Center(
                child: isDataLoading
                    ? const CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        // Menampilkan hasil dari API
                        child: Text(
                          result,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
              ),
            ),
            // Tombol untuk memicu pengambilan data
            // Kesalahan pengetikan ganda 'ElevatedButton(' telah dihapus di sini
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isDataLoading = true; // Mulai loading
                  result = 'Loading...'; 
                });
                
                // Praktikum 1: Panggil method asynchronous dan gunakan .then() dan .catchError()
                getData().then((response) {
                  // Jika berhasil (status code 200 OK)
                  if (response.statusCode == 200) {
                    setState(() {
                      // Ambil 500 karakter pertama dari body respon (String JSON)
                      // Jawaban Soal 3: Penggunaan substring untuk membatasi output UI
                      result = response.body.substring(0, 500) + '... (data terpotong)'; 
                      isDataLoading = false; // Hentikan loading
                    });
                  } else {
                    // Jika kode status bukan 200 (misalnya 404, 500)
                    setState(() {
                      result = 'Gagal memuat data. Status: ${response.statusCode}';
                      isDataLoading = false;
                    });
                  }
                // Jawaban Soal 3: Penggunaan catchError untuk menangani exception jaringan
                }).catchError((error) {
                  // Menangani error jaringan atau error lain dari Future
                  setState(() {
                    result = 'Error koneksi terjadi: $error';
                    isDataLoading = false;
                  });
                });
              },
              child: const Text('Get Data'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}