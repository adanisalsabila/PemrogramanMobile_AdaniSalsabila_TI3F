// lib/widget/displaypicture_screen.dart

import 'dart:io'; // Perlu impor 'dart:io' untuk Image.file
import 'package:flutter/material.dart';

// Widget yang menampilkan gambar yang diambil oleh pengguna.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - NIM Anda')),
      // Gambar disimpan sebagai file di perangkat. Gunakan konstruktor `Image.file`
      // dengan path yang diberikan untuk menampilkan gambar.
      body: Image.file(File(imagePath)),
    );
  }
}