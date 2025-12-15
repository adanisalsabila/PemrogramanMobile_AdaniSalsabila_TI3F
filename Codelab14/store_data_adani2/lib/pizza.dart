// // Langkah 1: Buat Konstanta di luar class
// const String keyId = 'id';
// const String keyName = 'pizzaName';
// const String keyDescription = 'description';
// const String keyPrice = 'price';
// const String keyImage = 'imageUrl';

// class Pizza {
//   final int id;
//   final String pizzaName;
//   final String description;
//   final double price;
//   final String imageUrl;

//   Pizza({
//     required this.id,
//     required this.pizzaName,
//     required this.description,
//     required this.price,
//     required this.imageUrl,
//   });

//   // Langkah 2: Perbarui fromJson menggunakan Konstanta
//   // (Tetap pertahankan logika tryParse dari Praktikum 2 agar robust)
//   factory Pizza.fromJson(Map<String, dynamic> json) {
//     return Pizza(
//       id: int.tryParse(json[keyId].toString()) ?? 0,
//       pizzaName: json[keyName]?.toString() ?? 'Unknown Pizza',
//       description: json[keyDescription]?.toString() ?? 'No description available',
//       price: double.tryParse(json[keyPrice].toString()) ?? 0.0,
//       imageUrl: json[keyImage]?.toString() ?? 'images/default.png',
//     );
//   }

//   // Langkah 3: Perbarui toJson menggunakan Konstanta
//   Map<String, dynamic> toJson() {
//     return {
//       keyId: id,
//       keyName: pizzaName,
//       keyDescription: description,
//       keyPrice: price,
//       keyImage: imageUrl,
//     };
//   }
// }

// Tambahkan konstanta untuk field baru
const String keyId = 'id';
const String keyName = 'pizzaName';
const String keyDescription = 'description';
const String keyPrice = 'price';
const String keyImage = 'imageUrl';
const String keyCrust = 'myCrust'; // FIELD BARU (Soal 2)

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;
  final String myCrust; // FIELD BARU (Soal 2)

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.myCrust, // Tambahkan di constructor
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: int.tryParse(json[keyId].toString()) ?? 0,
      pizzaName: json[keyName]?.toString() ?? 'Unknown Pizza',
      description:
          json[keyDescription]?.toString() ?? 'No description available',
      price: double.tryParse(json[keyPrice].toString()) ?? 0.0,
      imageUrl: json[keyImage]?.toString() ?? 'images/default.png',
      // Handle field baru
      myCrust: json[keyCrust]?.toString() ?? 'Original', 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
      keyCrust: myCrust, // Sertakan di JSON output
    };
  }
}