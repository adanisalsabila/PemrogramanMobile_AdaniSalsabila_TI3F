// import 'package:flutter/material.dart';
// import 'dart:async';

// class ColorStream {
//   // Langkah 4 & Soal 2: Daftar warna
//   final List<Color> colors = [
//     Colors.blueGrey,
//     Colors.amber,
//     Colors.deepPurple,
//     Colors.lightBlue,
//     Colors.teal,
//     // Soal 2: Tambahan 5 warna
//     Colors.redAccent,
//     Colors.green,
//     Colors.pink,
//     Colors.indigo,
//     Colors.orangeAccent,
//   ];

//   // Langkah 5 & 6: Method getColors dengan yield*
//   Stream<Color> getColors() async* {
//     yield* Stream.periodic(
//       const Duration(seconds: 1),
//       (int t) {
//         int index = t % colors.length;
//         return colors[index];
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async'; // Langkah 1: Import dart async

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.redAccent,
    Colors.green,
    Colors.pink,
    Colors.indigo,
    Colors.orangeAccent,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int t) {
        int index = t % colors.length;
        return colors[index];
      },
    );
  }
}

// Langkah 2: Tambah class NumberStream
class NumberStream {
  // Langkah 3: Tambah StreamController
  final StreamController<int> controller = StreamController<int>();

  // Langkah 4: Tambah method addNumberToSink
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  // Langkah 5: Tambah method close
  void close() {
    controller.close();
  }
  
  // Langkah 13: Tambah method addError (Untuk nanti Soal 7)
  void addError() {
    controller.sink.addError('error');
  }
}