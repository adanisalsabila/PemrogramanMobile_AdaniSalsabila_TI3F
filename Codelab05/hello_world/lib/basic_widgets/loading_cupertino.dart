import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingCupertino extends StatelessWidget {
  const LoadingCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan Scaffold untuk struktur dasar aplikasi Material Design
    return const Scaffold(
      body: Center( // Menggunakan Center agar konten berada di tengah
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              child: Text("Contoh button"),
              onPressed: null, // Set null agar tombol tidak bisa ditekan
            ),
            SizedBox(height: 16), // Memberi sedikit spasi
            CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}
