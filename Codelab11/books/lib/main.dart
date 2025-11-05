import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async'; 

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
  // Variabel untuk menyimpan hasil data
  String result = '';
  // Variabel untuk mengontrol status loading
  bool isDataLoading = false;

  // Praktikum 1: Method untuk mengambil data (Tidak digunakan di onPressed langkah 3, tapi tetap dipertahankan)
  Future<http.Response> getData() {
    const String path = 'https://www.googleapis.com/books/v1/volumes/pJmyEAAAQBAJ'; 
    final Uri uri = Uri.parse(path);
    return http.get(uri);
  }

  // Langkah 1: Tiga method asynchronous
  Future<int> returnOneAsync() async {
    // Menunggu 3 detik sebelum mengembalikan nilai 1
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    // Menunggu 3 detik sebelum mengembalikan nilai 2
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    // Menunggu 3 detik sebelum mengembalikan nilai 3
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  // Langkah 2: Method count() menggunakan async/await
  // Method ini akan menunggu masing-masing Future selesai secara berurutan.
  Future<int> count() async {
    int total = 0;
    
    // await: Menunggu returnOneAsync() selesai (3 detik)
    total += await returnOneAsync();
    
    // await: Menunggu returnTwoAsync() selesai (3 detik)
    total += await returnTwoAsync();
    
    // await: Menunggu returnThreeAsync() selesai (3 detik)
    total += await returnThreeAsync();
    
    // Total delay: 3s + 3s + 3s = 9 detik
    return total;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adani Salsabila - Codelab11 - Async Programming'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            Expanded(
              child: Center(
                child: isDataLoading
                    ? const CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          result,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
              ),
            ),
            // Langkah 3: Mengubah isi onPressed()
            ElevatedButton(
              onPressed: () async { // Tambahkan 'async' di sini!
                setState(() {
                  isDataLoading = true; // Mulai loading
                  result = 'Counting... Please wait 9 seconds.'; 
                });
                
                // Praktikum 1 code: (dikonversi ke comment)
                /*
                getData().then((response) {
                  if (response.statusCode == 200) {
                    setState(() {
                      result = response.body.substring(0, 500) + '... (data terpotong)'; 
                      isDataLoading = false; 
                    });
                  } else {
                    setState(() {
                      result = 'Gagal memuat data. Status: ${response.statusCode}';
                      isDataLoading = false;
                    });
                  }
                }).catchError((error) {
                  setState(() {
                    result = 'Error koneksi terjadi: $error';
                    isDataLoading = false;
                  });
                });
                */

                // Praktikum 2 code: Menggunakan async/await
                try {
                  // Gunakan await untuk menunggu hasil dari method count()
                  int total = await count();
                  
                  // Setelah count() selesai (setelah 9 detik), perbarui UI
                  setState(() {
                    result = 'Total: $total';
                    isDataLoading = false; 
                  });
                } catch (e) {
                  // Penanganan error menggunakan try-catch di method async
                  setState(() {
                    result = 'Error: $e';
                    isDataLoading = false;
                  });
                }

              },
              child: const Text('Count Async'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}