import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  // Langkah 4 & Soal 2: Daftar warna
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    // Soal 2: Tambahan 5 warna
    Colors.redAccent,
    Colors.green,
    Colors.pink,
    Colors.indigo,
    Colors.orangeAccent,
  ];

  // Langkah 5 & 6: Method getColors dengan yield*
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