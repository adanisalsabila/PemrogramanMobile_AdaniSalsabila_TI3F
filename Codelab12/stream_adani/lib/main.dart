import 'package:flutter/material.dart';
import 'stream.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Adani', // Soal 1: Nama panggilan
      theme: ThemeData(
        primarySwatch: Colors.teal, // Soal 1: Warna favorit (Ganti jika mau)
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

// ... (kode main dan MyApp tetap sama) ...

class _StreamHomePageState extends State<StreamHomePage> {
  // Langkah 8: Tambah Variabel
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // Langkah 9: Method changeColor (Versi await for)
  Future<void> changeColor() async {
    // await for loop digunakan untuk mendengarkan stream
    await for (var eventColor in colorStream.getColors()) {
      setState(() {
        bgColor = eventColor;
      });
    }
  }

  // Langkah 10: Override initState
  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  }

  // Langkah 11: Ubah Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Adani'),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
      ),
    );
  }
}

// class _StreamHomePageState extends State<StreamHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stream Adani'), // Soal 1: Nama panggilan
//       ),
//       body: Container(
//         decoration: BoxDecoration(color: Colors.white), // Nanti akan berubah
//       ),
//     );
//   }
// }