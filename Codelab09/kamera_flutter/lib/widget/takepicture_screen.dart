// lib/widget/takepicture_screen.dart

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kamera_flutter/widget/displaypicture_screen.dart'; // Import ini akan dibutuhkan di Langkah 9

// Layar yang memungkinkan pengguna mengambil gambar menggunakan kamera tertentu.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  // Variabel untuk menyimpan Controller dan Future inisialisasi
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Untuk menampilkan output saat ini dari Kamera,
    // buat CameraController.
    _controller = CameraController(
      // Dapatkan kamera tertentu dari daftar kamera yang tersedia.
      widget.camera,
      // Tentukan resolusi yang akan digunakan.
      ResolutionPreset.medium,
    );

    // Selanjutnya, inisialisasi controller. Ini mengembalikan Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Buang controller saat widget dibuang.
    _controller.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   // Akan diisi di langkah berikutnya
  //   return Container();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture - NIM Anda')),
      // Anda harus menunggu hingga controller diinisialisasi sebelum menampilkan
      // pratinjau kamera. Gunakan FutureBuilder untuk menampilkan indikator
      // loading sampai controller selesai diinisialisasi.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Jika Future selesai, tampilkan pratinjau.
            return CameraPreview(_controller);
          } else {
            // Jika tidak, tampilkan indikator loading.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // FloatingActionButton akan ditambahkan di Langkah 6 dan 9
      floatingActionButton: FloatingActionButton(
        // Sediakan callback onPressed.
        onPressed: () async {
          // Ambil Gambar dalam blok try/catch. Jika ada yang salah, tangkap errornya.
          try {
            // Pastikan kamera telah diinisialisasi.
            await _initializeControllerFuture;

            // Coba ambil gambar dan dapatkan lokasi file gambar disimpan.
            final image = await _controller.takePicture();

            if (!context.mounted) return; // Guard: pastikan widget masih mounted

            // Jika gambar telah diambil, tampilkan di layar baru.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Teruskan path yang dibuat secara otomatis ke widget DisplayPictureScreen.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // Jika terjadi error, log error tersebut ke konsol.
          print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }}