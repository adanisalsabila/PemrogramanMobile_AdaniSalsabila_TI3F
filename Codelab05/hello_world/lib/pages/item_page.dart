// import 'package:flutter/material.dart';
// import '../models/item.dart'; 

// class ItemPage extends StatelessWidget {
//   const ItemPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Menerima argumen (objek Item) yang dikirim melalui navigasi
//     // '!' menandakan kita yakin argumen tidak null
//     final item = ModalRoute.of(context)!.settings.arguments as Item;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail ${item.name}'), // Judul dinamis
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Detail Produk Belanja',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             const Divider(),
//             Text(
//               'Nama Barang: ${item.name}',
//               style: const TextStyle(fontSize: 20.0),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Harga: Rp ${item.price.toString()}',
//               style: const TextStyle(fontSize: 20.0, color: Colors.green),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigasi kembali ke halaman sebelumnya (HomePage)
//                 Navigator.pop(context);
//               },
//               child: const Text('Kembali ke Daftar'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Pembacaan nilai yang dikirimkan menggunakan ModalRoute (Langkah Baru)
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Image.network(
              item.photo,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 250,
                color: Colors.grey[200],
                child: Center(child: Text('Gambar ${item.name} Gagal Dimuat')),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Produk (Besar)
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Harga
                  Text(
                    'Rp ${item.price.toString()}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const Divider(height: 20),

                  // Detail Tambahan: Stok dan Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDetailRow(
                        icon: Icons.inventory_2, 
                        label: 'Stok Tersedia', 
                        value: item.stock.toString(),
                      ),
                      _buildDetailRow(
                        icon: Icons.star, 
                        label: 'Rating', 
                        value: item.rating.toString(), 
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  const Divider(height: 20),

                  // Tombol Kembali
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Kembali ke Daftar Produk'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function untuk menampilkan detail baris
  Widget _buildDetailRow({required IconData icon, required String label, required String value, Color color = Colors.blueGrey}) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }
}
