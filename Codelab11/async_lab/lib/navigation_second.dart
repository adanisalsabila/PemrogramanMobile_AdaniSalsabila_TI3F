import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol 1: Warna Merah (Red)
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                // Mengirim warna Merah kembali ke layar sebelumnya
                Navigator.pop(context, Colors.red);
              },
              child: const Text('Red', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            
            // Tombol 2: Warna Hijau (Green)
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                // Mengirim warna Hijau kembali
                Navigator.pop(context, Colors.green);
              },
              child: const Text('Green', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            
            // Tombol 3: Warna Ungu (Purple)
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                // Mengirim warna Ungu kembali
                Navigator.pop(context, Colors.purple);
              },
              child: const Text('Purple', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}