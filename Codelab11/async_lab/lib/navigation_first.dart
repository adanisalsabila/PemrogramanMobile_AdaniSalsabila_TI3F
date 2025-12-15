import 'package:flutter/material.dart';
import 'navigation_second.dart'; // Pastikan import ini ada (file ini akan dibuat di langkah 4)

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  // Soal 15: Ganti warna default sesuai favorit Anda (misal: Blue)
  Color color = Colors.blue.shade700; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        // Soal 15: Ganti 'Gemini' dengan Nama Panggilan Anda
        title: const Text('Navigation First Adani Salsabila'), 
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }

  Future _navigateAndGetColor(BuildContext context) async {
   color = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NavigationSecond()),) ?? Colors.blue;
   setState(() {});
  } }