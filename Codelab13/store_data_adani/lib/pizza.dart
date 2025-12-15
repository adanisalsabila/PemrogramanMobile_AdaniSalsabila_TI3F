class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  // Langkah 12: Constructor utama
  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

//   // Langkah 13: Constructor fromJson (Map -> Object)
//   factory Pizza.fromJson(Map<String, dynamic> json) {
//     return Pizza(
//       id: json['id'],
//       pizzaName: json['pizzaName'],
//       description: json['description'],
//       price: json['price'],
//       imageUrl: json['imageUrl'],
//     );
//   }
// }

factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      // Langkah 3: Handle ID (String/Int -> Int)
      // Mengambil value, ubah ke string, coba parse ke int. Jika gagal/null, beri nilai 0.
      id: int.tryParse(json['id'].toString()) ?? 0,

      // Langkah 5, 6, 10: Handle String & Null
      // Cek apakah key ada? Jika null, beri nilai default 'Unknown ...'.
      // toString() memastikan jika data dikirim sebagai angka, tetap terbaca sebagai string.
      pizzaName: json['pizzaName']?.toString() ?? 'Unknown Pizza',
      description: json['description']?.toString() ?? 'No description available',
      imageUrl: json['imageUrl']?.toString() ?? 'images/default.png', // Beri gambar default jika null

      // Langkah 7 & 8: Handle Price (String/Double/Int -> Double)
      // Ubah ke string dulu, lalu parse ke double.
      price: double.tryParse(json['price'].toString()) ?? 0.0,
    );
  } } 