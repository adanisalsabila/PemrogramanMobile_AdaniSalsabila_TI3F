import 'package:flutter/material.dart';
import '../models/item.dart'; 

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menerima argumen (objek Item) yang dikirim melalui navigasi
    // '!' menandakan kita yakin argumen tidak null
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${item.name}'), // Judul dinamis
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detail Produk Belanja',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(
              'Nama Barang: ${item.name}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 8),
            Text(
              'Harga: Rp ${item.price.toString()}',
              style: const TextStyle(fontSize: 20.0, color: Colors.green),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ke halaman sebelumnya (HomePage)
                Navigator.pop(context);
              },
              child: const Text('Kembali ke Daftar'),
            )
          ],
        ),
      ),
    );
  }
}