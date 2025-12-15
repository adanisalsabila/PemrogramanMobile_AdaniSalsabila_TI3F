import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  // Warna awal background
  Color color = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        // Ganti 'Gemini' dengan Nama Panggilan Anda
        title: const Text('Navigation Dialog Adani Salsabila'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            // Langkah 4: Memanggil method async saat tombol ditekan
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

  // Langkah 3: Method async untuk menampilkan Dialog
  Future _showColorDialog(BuildContext context) async {
    Color? selectedColor = await showDialog(
      barrierDismissible: false, // User harus memilih tombol, tidak bisa klik luar
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            // Soal 17: Mengganti 3 warna dengan warna favorit (DeepPurple, Teal, Amber)
            TextButton(
                child: const Text('Deep Purple'),
                onPressed: () {
                  Navigator.pop(context, Colors.deepPurple);
                }),
            TextButton(
                child: const Text('Teal'),
                onPressed: () {
                  Navigator.pop(context, Colors.teal);
                }),
            TextButton(
                child: const Text('Amber'),
                onPressed: () {
                  Navigator.pop(context, Colors.amber);
                }),
          ],
        );
      },
    );

    // Update state background color berdasarkan pilihan user
    // Jika null (user tidak memilih), gunakan warna default
    setState(() {
      color = selectedColor ?? Colors.blue.shade700;
    });
  }
}