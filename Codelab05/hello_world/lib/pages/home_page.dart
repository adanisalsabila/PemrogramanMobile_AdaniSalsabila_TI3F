import 'package:flutter/material.dart';
import '../models/item.dart'; // Import model Item

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Definisi Sumber Data (Langkah 5)
  final List<Item> items = const [
    Item(name: 'Gula', price: 5000),
    Item(name: 'Garam', price: 2000),
    Item(name: 'Minyak Goreng', price: 15000),
    Item(name: 'Telur', price: 30000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Belanja'),
      ),
      // Implementasi ListView.builder (Langkah 6)
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          
          return InkWell( // Menggunakan InkWell untuk aksi sentuhan (Langkah 7)
            onTap: () {
              // Navigasi ke halaman '/item' dan mengirim objek Item sebagai argumen
              Navigator.pushNamed(
                context, 
                '/item', 
                arguments: item, // Data yang dikirim ke ItemPage
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rp ${item.price.toString()}',
                      style: const TextStyle(fontSize: 16.0, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ); 
        },
      ),
    );
  }
}