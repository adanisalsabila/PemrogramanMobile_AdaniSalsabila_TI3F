// class Item {
//   // 1. TAMBAHKAN 'final' ke semua fields (Langkah Kunci)
//   final String name;
//   final int price;

//   // 2. Sekarang 'const' constructor sudah valid
//   const Item({required this.name, required this.price});
// }

class Item {
  // Semua field harus 'final' agar constructor bisa menjadi 'const'
  final String name;
  final int price;
  final String photo;    // Atribut baru
  final int stock;       // Atribut baru
  final double rating;   // Atribut baru

  // Constructor konstan
  const Item({
    required this.name,
    required this.price,
    required this.photo,
    required this.stock,
    required this.rating,
  });
}
