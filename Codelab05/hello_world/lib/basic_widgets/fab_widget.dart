import 'package:flutter/material.dart';

class FabWidget extends StatelessWidget {
  const FabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold secara otomatis meletakkan FAB di pojok kanan bawah
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh Floating Action Button'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi saat FAB ditekan
          debugPrint('FAB ditekan!');
        },
        child: const Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
