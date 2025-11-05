import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async'; // dart:async sudah mencakup class Completer

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

  // Praktikum 1: Method untuk mengambil data (Tidak digunakan)
  Future<http.Response> getData() {
    const String path = 'https://www.googleapis.com/books/v1/volumes/pJmyEAAAQBAJ'; 
    final Uri uri = Uri.parse(path);
    return http.get(uri);
  }

  // Praktikum 2: Method async/await (Tidak digunakan di Praktikum 3)
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future<int> count() async {
    int total = 0;
    total += await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    return total;
  }
  
  // =======================================================
  // Praktikum 3: Menggunakan Completer
  // Langkah 2: Tambahkan variabel late Completer
  late Completer completer;

  // Langkah 2: Method getNumber()
  Future getNumber() {
    // 1. Buat object Completer baru yang akan menghasilkan tipe data <int>
    completer = Completer<int>();
    // 2. Panggil method yang akan menjalankan operasi asinkron
    calculate();
    // 3. Kembalikan object Future yang terkait dengan Completer ini
    return completer.future;
  }

  // Langkah 5: Method calculate() diubah untuk memicu error (menjawab Soal 6)
  Future calculate() async {
    await Future.delayed(const Duration(seconds : 3)); 
    
    // --- SKENARIO 1: SUKSES (Langkah 2) ---
    // Ganti komentar di bawah jika ingin mencoba skenario sukses
    // completer.complete(42); 

    // --- SKENARIO 2: ERROR (Langkah 5) ---
    // Memanggil completeError() akan menolak (reject) Future yang dikembalikan getNumber()
    completer.completeError(Exception('Failed to calculate the secret number! (Intentional Error)')); 
  }
  // =======================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adani Salsabila - Codelab11 - Async Programming'),
        backgroundColor: Colors.blueGrey,
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
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
              ),
            ),
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.blueGrey[700],
                foregroundColor: Colors.white,
              ),
              onPressed: () { 
                setState(() {
                  isDataLoading = true; 
                  // Sesuaikan pesan loading dengan skenario error (3 detik)
                  result = 'Calculating with Completer... Waiting 3 seconds for result/error.'; 
                });
                
                // Praktikum 3, Langkah 6: Menggunakan getNumber() dengan then dan catchError
                getNumber().then((value) {
                  // Blok ini akan dipanggil jika completer.complete(value) dipanggil (Skenario Sukses)
                  setState(() {
                    result = 'Total: $value (Success from Completer)';
                    isDataLoading = false;
                  });
                }).catchError((e) {
                  // Blok ini akan dipanggil jika completer.completeError(error) dipanggil (Skenario Error)
                  setState(() {
                    result = 'Error from Completer: ${e.toString()}';
                    isDataLoading = false;
                  });
                });

              },
              child: const Text('Calculate with Completer (Praktikum 3)'),
            ),
            
            const SizedBox(height: 20),
            
            // Tombol Praktikum 2 (dijadikan referensi)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.grey[400],
                foregroundColor: Colors.black87,
              ),
              onPressed: () async {
                 setState(() {
                   isDataLoading = true; 
                   result = 'Counting Async/Await... Please wait 9 seconds.'; 
                 });
                 
                 try {
                   int total = await count();
                   setState(() {
                     result = 'Total: $total (Success from Async/Await)';
                     isDataLoading = false; 
                   });
                 } catch (e) {
                   setState(() {
                     result = 'Error: $e';
                     isDataLoading = false;
                   });
                 }
              },
              child: const Text('Count Async/Await (Praktikum 2)'),
            ),
            
            const Spacer(),
          ],
        ),
      ),
    );
  }
}