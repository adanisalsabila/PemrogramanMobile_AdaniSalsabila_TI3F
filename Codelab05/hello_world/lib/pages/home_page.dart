// import 'package:flutter/material.dart';
// import '../models/item.dart'; // Import model Item

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   // Definisi Sumber Data (Langkah 5)
//   final List<Item> items = const [
//     Item(name: 'Gula', price: 5000),
//     Item(name: 'Garam', price: 2000),
//     Item(name: 'Minyak Goreng', price: 15000),
//     Item(name: 'Telur', price: 30000),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Daftar Belanja'),
//       ),
//       // Implementasi ListView.builder (Langkah 6)
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index];
          
//           return InkWell( // Menggunakan InkWell untuk aksi sentuhan (Langkah 7)
//             onTap: () {
//               // Navigasi ke halaman '/item' dan mengirim objek Item sebagai argumen
//               Navigator.pushNamed(
//                 context, 
//                 '/item', 
//                 arguments: item, // Data yang dikirim ke ItemPage
//               );
//             },
//             child: Card(
//               margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//               child: Container(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       item.name,
//                       style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Rp ${item.price.toString()}',
//                       style: const TextStyle(fontSize: 16.0, color: Colors.green),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ); 
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data List dengan atribut baru dan placeholder foto
  final List<Item> items = const [
    Item(
      name: 'Gula Pasir 1Kg', 
      price: 15000, 
      photo: 'assets/gula.jpg',
      stock: 50,
      rating: 4.8,
    ),
    Item(
      name: 'Minyak Kelapa 2L', 
      price: 28000, 
      photo: 'assets/minyakkelapa.jpg',
      stock: 120,
      rating: 4.5,
    ),
    Item(
      name: 'Telur Ayam 1 Tray', 
      price: 32000, 
      photo: 'https://placehold.co/100x100/FDEBD0/000?text=TELUR',
      stock: 80,
      rating: 4.9,
    ),
    Item(
      name: 'Tepung Terigu Serbaguna', 
      price: 12000, 
      photo: 'https://placehold.co/100x100/D6EAF8/000?text=TEPUNG',
      stock: 200,
      rating: 4.2,
    ),
    Item(
      name: 'Kopi Bubuk Murni', 
      price: 18000, 
      photo: 'https://placehold.co/100x100/EBDEF0/000?text=KOPI',
      stock: 90,
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Belanja Marketplace'),
        backgroundColor: Colors.blueAccent,
      ),
      // Menggunakan GridView.builder untuk tampilan seperti marketplace
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolom
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7, // Mengatur rasio tinggi/lebar
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          
          return InkWell(
            onTap: () {
              // Navigasi ke halaman detail dan kirim objek 'item' (Langkah 7)
              Navigator.pushNamed(
                context, 
                '/item', 
                arguments: item,
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar Produk
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      item.photo,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 120,
                        color: Colors.grey[200],
                        child: Center(child: Text(item.name)),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama Produk
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Harga
                        Text(
                          'Rp ${item.price.toString()}',
                          style: const TextStyle(
                            fontSize: 18, 
                            fontWeight: FontWeight.w800, 
                            color: Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Rating dan Stok
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  item.rating.toString(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Text(
                              'Stok: ${item.stock}',
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
