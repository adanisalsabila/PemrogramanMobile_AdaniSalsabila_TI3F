// import 'package:flutter/material.dart';
// import 'stream.dart'; 

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stream Adani', // Soal 1: Nama panggilan
//       theme: ThemeData(
//         primarySwatch: Colors.teal, // Soal 1: Warna favorit (Ganti jika mau)
//       ),
//       home: const StreamHomePage(),
//     );
//   }
// }

// class StreamHomePage extends StatefulWidget {
//   const StreamHomePage({super.key});

//   @override
//   State<StreamHomePage> createState() => _StreamHomePageState();
// }

// // ... (kode main dan MyApp tetap sama) ...

// class _StreamHomePageState extends State<StreamHomePage> {
//   // Langkah 8: Tambah Variabel
//   Color bgColor = Colors.blueGrey;
//   late ColorStream colorStream;

//   // Langkah 9: Method changeColor (Versi await for)
//   Future<void> changeColor() async {
//     // await for loop digunakan untuk mendengarkan stream
//     await for (var eventColor in colorStream.getColors()) {
//       setState(() {
//         bgColor = eventColor;
//       });
//     }
//   }

//   // Langkah 10: Override initState
//   @override
//   void initState() {
//     super.initState();
//     colorStream = ColorStream();
//     changeColor();
//   }

//   // Langkah 11: Ubah Scaffold
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stream Adani'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(color: bgColor),
//       ),
//     );
//   }
// }

// // class _StreamHomePageState extends State<StreamHomePage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Stream Adani'), // Soal 1: Nama panggilan
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(color: Colors.white), // Nanti akan berubah
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async'; // Langkah 6
import 'dart:math';  // Langkah 6 (untuk Random)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Adani',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  
  // Langkah 7: Tambah variabel untuk NumberStream
  int lastNumber = 0;
  late NumberStream numberStream;
  late StreamController numberStreamController;
  late StreamSubscription subscription;

  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  // Langkah 8: Edit initState
  @override
  void initState() {
    super.initState();
    // Inisialisasi NumberStream
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    
    // Listening (Mendengarkan stream)
    Stream stream = numberStreamController.stream;
    subscription = stream.listen((event) {
      setState(() {
        lastNumber = event; // Update state jika ada angka baru
      });
    }, 
    // Langkah 14: onError handler (Untuk Soal 7 nanti)
    onError: (error) {
      setState(() {
        lastNumber = -1; // Indikator error
      });
    });

    super.initState();
  }

  // Langkah 9: Edit dispose
  @override
  void dispose() {
    numberStreamController.close(); // Tutup controller
    subscription.cancel(); // Batalkan subscription agar hemat memori
    super.dispose();
  }

  // Langkah 10: Method addRandomNumber
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
    
    // Langkah 15: Comment line di atas dan gunakan ini untuk Soal 7
    // numberStream.addError(); 
  }

  // Langkah 11: Edit build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Adani'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lastNumber.toString(),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: const Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}