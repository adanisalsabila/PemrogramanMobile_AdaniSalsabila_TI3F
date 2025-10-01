class Item {
  // 1. TAMBAHKAN 'final' ke semua fields (Langkah Kunci)
  final String name;
  final int price;

  // 2. Sekarang 'const' constructor sudah valid
  const Item({required this.name, required this.price});
}