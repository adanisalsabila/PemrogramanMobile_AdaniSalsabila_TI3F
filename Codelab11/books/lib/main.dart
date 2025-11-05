// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async'; // dart:async (untuk Future, Completer)
// // import 'package:async/async.dart'; // FutureGroup memerlukan impor ini
// import 'package:books/geolocation.dart'; // Import file baru

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pemrograman Asynchronous Flutter',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       // home: const FuturePage(),
//       home: const LocationScreen(),
//     );
//   }
// }

// class FuturePage extends StatefulWidget {
//   const FuturePage({super.key});

//   @override
//   State<FuturePage> createState() => _FuturePageState();
// }

// class _FuturePageState extends State<FuturePage> {
//   // Variabel untuk menyimpan hasil data
//   String result = '';
//   // Variabel untuk mengontrol status loading
//   bool isDataLoading = false;

//   // Praktikum 1: Method untuk mengambil data (Tidak digunakan)
//   Future<http.Response> getData() {
//     const String path = 'https://www.googleapis.com/books/v1/volumes/pJmyEAAAQBAJ'; 
//     final Uri uri = Uri.parse(path);
//     return http.get(uri);
//   }

//   // Praktikum 2: Tiga method async/await yang masing-masing 3 detik
//   Future<int> returnOneAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 1;
//   }

//   Future<int> returnTwoAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 2;
//   }

//   Future<int> returnThreeAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 3;
//   }

//   // Praktikum 2: Metode yang menjalankan Future secara BERURUTAN (Total 9 detik)
//   Future<int> count() async {
//     int total = 0;
//     total += await returnOneAsync(); // 3s
//     total += await returnTwoAsync(); // + 3s
//     total += await returnThreeAsync(); // + 3s
//     return total;
//   }
  
//   // =======================================================
//   // Praktikum 3: Menggunakan Completer (Kode dipertahankan)
//   late Completer completer;

//   Future getNumber() {
//     completer = Completer<int>();
//     calculate();
//     return completer.future;
//   }

//   Future calculate() async {
//     await Future.delayed(const Duration(seconds : 3)); 
//     completer.complete(42); 
//   }
//   // =======================================================
  
//   // Praktikum 4: Memanggil Future secara PARALEL
//   Future<int> countParalel() async {
//     final results = await Future.wait<int>([
//       returnOneAsync(),
//       returnTwoAsync(),
//       returnThreeAsync(),
//     ]);
//     int total = results.reduce((sum, element) => sum + element);
//     return total;
//   }

//   // =======================================================
//   // Praktikum 5: Menangani Respon Error pada Async Code
  
//   // Langkah 1: Method yang akan melempar error
//   Future<String> getError() async {
//     await Future.delayed(const Duration(seconds: 2));
//     throw Exception('Simulasi Kegagalan Data (Praktikum 5)');
//   }

//   // Langkah 4: Method untuk menangani error menggunakan pola async/await
//   Future<void> handleErrorAsync() async {
//     try {
//       // Panggil Future yang berpotensi gagal
//       await getError();
//     } catch (e) {
//       // Tangkap error dan perbarui UI
//       setState(() {
//         result = 'Error Ditangani (Async/Await): ${e.toString()}';
//         isDataLoading = false;
//       });
//       // Menampilkan di console untuk konfirmasi bahwa error tertangani
//       print('Complete: Error tertangani dengan async/await'); 
//     }
//   }
  
//   // =======================================================


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Adani Salsabila - Codelab11 - Async Programming'),
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             const Spacer(),
//             Expanded(
//               child: Center(
//                 child: isDataLoading
//                     ? const CircularProgressIndicator()
//                     : Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(
//                           result,
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                         ),
//                       ),
//               ),
//             ),
            
//             // Praktikum 5, Langkah 2: Menangani error menggunakan .catchError()
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 backgroundColor: Colors.red[800], // Warna untuk error handling
//                 foregroundColor: Colors.white,
//               ),
//               onPressed: () { 
//                 setState(() {
//                   isDataLoading = true; 
//                   result = 'Loading... Menunggu 2 detik untuk hasil error.'; 
//                 });
                
//                 // Panggil Future yang berpotensi gagal, dan gunakan .catchError()
//                 getError().then((value) {
//                   // Blok ini hanya dieksekusi jika sukses (tidak akan dieksekusi)
//                   setState(() {
//                     result = 'Sukses: $value';
//                     isDataLoading = false;
//                   });
//                 }).catchError((e) {
//                   // Blok ini dieksekusi karena ada error
//                   setState(() {
//                     result = 'Error Ditangani (.catchError): ${e.toString()}';
//                     isDataLoading = false;
//                   });
//                   // Menampilkan di console
//                   print('Complete: Error tertangani dengan .catchError()'); 
//                 });

//               },
//               child: const Text('GO! (CatchError)'),
//             ),

//             const SizedBox(height: 10),
            
//             // Praktikum 5, Soal 10: Menangani error menggunakan handleErrorAsync (async/await)
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 backgroundColor: Colors.deepOrange[800], // Warna untuk async/await error handling
//                 foregroundColor: Colors.white,
//               ),
//               onPressed: () async {
//                  setState(() {
//                    isDataLoading = true; 
//                    result = 'Loading... Menunggu 2 detik untuk hasil error.'; 
//                  });
//                  // Panggil method yang sudah menangani error menggunakan try-catch
//                  await handleErrorAsync();
//               },
//               child: const Text('GO! (Async/Await)'),
//             ),
            
//             const SizedBox(height: 20),

//             // Tombol Praktikum 4 (Paralel: 3 detik)
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 backgroundColor: Colors.indigo[800],
//                 foregroundColor: Colors.white,
//               ),
//               onPressed: () async {
//                 setState(() {
//                   isDataLoading = true; 
//                   result = 'Counting PARALEL... Please wait 3 seconds.'; 
//                 });
                
//                 try {
//                   int total = await countParalel(); 
                  
//                   setState(() {
//                     result = 'Total Paralel: $total (Time saved: 6 seconds!)';
//                     isDataLoading = false;
//                   });
//                 } catch (e) {
//                   setState(() {
//                     result = 'Error Paralel: ${e.toString()}';
//                     isDataLoading = false;
//                   });
//                 }
//               },
//               child: const Text('Count Paralel (Praktikum 4)'),
//             ),
            
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/main.dart

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http; // Tidak diperlukan lagi untuk Praktikum 6
import 'package:books/geolocation.dart'; // Import file baru

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Adani Salsabila - Pemrograman Asynchronous Flutter',
theme: ThemeData(primarySwatch: Colors.teal), // Ganti warna primary
// home: const FuturePage(), // <-- Baris ini dinonaktifkan
// home: const LocationScreen(), // <-- Panggil screen baru
home: LocationScreen(),
 );
 }
}

// Catatan: Class FuturePage dapat Anda hapus atau biarkan di sini, 
// asalkan home: menunjuk ke LocationScreen().
// ...