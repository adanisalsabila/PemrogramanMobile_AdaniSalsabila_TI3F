// import 'package:flutter/material.dart';
// import 'dart:async'; // Diperlukan untuk Completer
// import 'package:async/async.dart'; // Wajib ada untuk FutureGroup

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Async Lab',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const AsyncScreen(),
//     );
//   }
// }

// class AsyncScreen extends StatefulWidget {
//   const AsyncScreen({super.key});

//   @override
//   State<AsyncScreen> createState() => _AsyncScreenState();
// }

// class _AsyncScreenState extends State<AsyncScreen> {
//   String result = 'Belum ada data';

//   Future<void> fetchData() {
//     return Future.delayed(const Duration(seconds: 2), () {
//       setState(() {
//         result = 'Data berhasil diunduh (Simulasi API)';
//       });
//     });
//   }

//   // Future<String> mockApi() {
//   //   return Future.delayed(const Duration(seconds: 2), () {
//   //     return 'Data dari Async/Await';
//   //   });
//   // }

//   // Future<void> getDataWithAsync() async {
//   //   setState(() {
//   //     result = 'Menunggu data...';
//   //   });

//   //   // Menunggu hasil mockApi selesai sebelum lanjut ke baris berikutnya
//   //   String data = await mockApi();

//   //   setState(() {
//   //     result = data;
//   //   });
//   // }

//   // Future<void> completerExample() async {
//   //   Completer<String> completer = Completer<String>();

//   //   // Simulasi proses yang selesai setelah 3 detik
//   //   Future.delayed(const Duration(seconds: 3), () {
//   //     completer.complete('Completer selesai!');
//   //   });

//   //   setState(() {
//   //     result = 'Menunggu Completer...';
//   //   });

//   //   String value = await completer.future;
//   //   setState(() {
//   //     result = value;
//   //   });
//   // }

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

//   Future<void> count() async {
//     int total = 0;

//     // Mengambil nilai 1, butuh waktu 3 detik
//     total = await returnOneAsync();

//     // Menambah nilai 2, butuh waktu 3 detik lagi
//     total += await returnTwoAsync();

//     // Menambah nilai 3, butuh waktu 3 detik lagi
//     total += await returnThreeAsync();

//     setState(() {
//       result = total.toString(); // Akan menampilkan angka 6
//     });
//   }

//   late Completer completer;

//   Future getNumber() {
//     completer = Completer<int>(); // Inisialisasi Completer
//     calculate(); // Memulai proses perhitungan
//     return completer.future; // Mengembalikan Future segera, isinya menyusul
//   }

//   // Future calculate() async {
//   //   // Simulasi proses yang memakan waktu 5 detik
//   //   await Future.delayed(const Duration(seconds: 5));
//   //   completer.complete(42); // Menyelesaikan Future dengan angka 42
//   // }

//   Future calculate() async {
//     try {
//       await Future.delayed(const Duration(seconds: 5));
//       // Kita memaksakan terjadinya error untuk simulasi
//       throw Exception('Something bad happened');
//     } catch (_) {
//       // Jika terjadi error, kita selesaikan completer dengan error
//       completer.completeError({});
//     }
//   }

//   void returnFG() {
//     // Membuat FutureGroup
//     FutureGroup<int> futureGroup = FutureGroup<int>();

//     // Menambahkan Future ke dalam group
//     futureGroup.add(returnOneAsync());
//     futureGroup.add(returnTwoAsync());
//     futureGroup.add(returnThreeAsync());

//     // Menutup group (tanda tidak ada future lagi yang akan ditambahkan)
//     futureGroup.close();

//     // Menerima hasil ketika semua future selesai
//     futureGroup.future.then((List<int> values) {
//       int total = values.fold(0, (a, b) => a + b); // Menjumlahkan hasil: 1+2+3
//       setState(() {
//         result = total.toString();
//       });
//     });
//   }

//   Future returnError() async {
//     await Future.delayed(const Duration(seconds: 2));
//     throw Exception('Something terrible happened!');
//   }

//   Future<void> handleError() async {
//     try {
//       await returnError();
//     } catch (error) {
//       setState(() {
//         result = error.toString();
//       });
//     } finally {
//       print('Complete Jos Mantap');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Asynchronous Programming')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // <--- Awal List
//             Text(
//               result,
//               style: const TextStyle(fontSize: 20),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 handleError();
//               },
//               child: const Text('Praktikum 5: Handle Error'),
//             ),
//           ], // <--- BAGIAN INI YANG HILANG/SALAH (Tutup Siku)
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'geolocation.dart'; // Jangan lupa import ini

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const LocationScreen(), // Panggil screen baru di sini
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'navigation_first.dart'; // Import file baru

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const NavigationFirst(), // Ganti home ke sini
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'navigation_dialog.dart'; // Import file baru

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationDialogScreen(), // Ganti home ke sini
    );
  }
}