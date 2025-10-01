// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:hello_world/basic_widgets/loading_cupertino.dart';
// import 'package:hello_world/basic_widgets/fab_widget.dart';

// // --- Widget untuk Dialog Widget (Langkah 4) ---
// class DialogWidget extends StatelessWidget {
//   const DialogWidget({super.key});

//   void showAlertDialog(BuildContext context) {
//     Widget okButton = TextButton(
//       child: const Text("OK"),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );

//     AlertDialog alert = AlertDialog(
//       title: const Text("Saya Adani Salsabila"),
//       content: const Text("NIM 2341720123"),
//       actions: [
//         okButton,
//       ],
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ElevatedButton(
//         child: const Text('Tampilkan Dialog'),
//         onPressed: () {
//           showAlertDialog(context);
//         },
//       ),
//     );
//   }
// }

// // --- Widget untuk TextField (Langkah 5) ---
// class TextFieldWidget extends StatelessWidget {
//   const TextFieldWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Adani Salsabila - 2341720123")),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: TextField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             labelText: 'Nama',
//           ),
//         ),
//       ),
//     );
//   }
// }

// // --- Widget untuk Date Picker (Langkah 6) ---
// class DatePickerWidget extends StatefulWidget {
//   const DatePickerWidget({super.key, required this.title});
//   final String title;

//   @override
//   State<DatePickerWidget> createState() => _DatePickerWidgetState();
// }

// class _DatePickerWidgetState extends State<DatePickerWidget> {
//   DateTime selectedDate = DateTime.now();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               "${selectedDate.toLocal()}".split(' ')[0],
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: const Text('Pilih Tanggal'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // --- MyHomePage dari Langkah 3 ---
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const BottomAppBar(
//         child: SizedBox(
//           height: 50.0,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment Counter',
//         child: const Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }

// // --- Layar galeri baru yang menggabungkan semua widget ---
// class WidgetGalleryScreen extends StatelessWidget {
//   const WidgetGalleryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Galeri Widget Flutter'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               // Tombol untuk contoh Cupertino
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const LoadingCupertino()),
//                   );
//                 },
//                 child: const Text('Cupertino Button & Loading'),
//               ),
//               const SizedBox(height: 16),
//               // Tombol untuk contoh FAB
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const FabWidget()),
//                   );
//                 },
//                 child: const Text('Floating Action Button'),
//               ),
//               const SizedBox(height: 16),
//               // Tombol untuk contoh Dialog
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const Scaffold(
//                       body: Center(
//                         child: DialogWidget(),
//                       ),
//                     )),
//                   );
//                 },
//                 child: const Text('Dialog Widget'),
//               ),
//               const SizedBox(height: 16),
//               // Tombol untuk contoh TextField
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const TextFieldWidget()),
//                   );
//                 },
//                 child: const Text('TextField Widget'),
//               ),
//               const SizedBox(height: 16),
//               // Tombol untuk contoh Date Picker
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const DatePickerWidget(title: 'Contoh Date Picker')),
//                   );
//                 },
//                 child: const Text('Date Picker'),
//               ),
//               const SizedBox(height: 16),
//               // Tombol untuk contoh MyHomePage
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const MyHomePage(title: 'My Increment App')),
//                   );
//                 },
//                 child: const Text('Increment Counter App'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       // Set 'home' ke WidgetGalleryScreen
//       home: const WidgetGalleryScreen(),
//     );
//   }
// }

// lib/main.dart

// import 'package:flutter/material.dart';

// // Model Item
// class Item {
//   final String name;
//   final int price;
//   final String image;
//   final String desc;

//   Item({
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.desc,
//   });
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Layout & Navigasi - Adani Salsabila (2341720123)',
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const HomePage(),
//         '/item': (context) => const ItemPage(),
//       },
//     );
//   }
// }

// // ================= HOME PAGE =================
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Item> items = [
//       Item(
//         name: 'Gunung Bromo',
//         price: 50000,
//         image: 'assets/bromo.jpg', 
//         desc:
//             'Gunung Bromo adalah salah satu destinasi wisata populer di Jawa Timur. '
//             'Keindahan sunrise dan lautan pasir menjadikannya daya tarik utama. '
//             '— Adani Salsabila (2341720123)',
//       ),
//       Item(
//         name: 'Gunung Semeru',
//         price: 75000,
//         image: 'assets/semeru.jpg',
//         desc:
//             'Gunung Semeru merupakan gunung tertinggi di Pulau Jawa. '
//             'Banyak pendaki tertarik untuk menaklukkan puncaknya, Mahameru. '
//             '— Adani Salsabila (2341720123)',
//       ),
//     ];

//     Widget titleSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: const Text(
//                     'Wisata Gunung di Jawa Timur',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Text(
//                   'Indonesia',
//                   style: TextStyle(color: Colors.grey[500]),
//                 ),
//               ],
//             ),
//           ),
//           Icon(Icons.star, color: Colors.red[500]),
//           const Text('99'),
//         ],
//       ),
//     );

//     Color color = Theme.of(context).primaryColor;
//     Widget buttonSection = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildButtonColumn(color, Icons.call, 'CALL'),
//         _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//         _buildButtonColumn(color, Icons.share, 'SHARE'),
//       ],
//     );

//     Widget textSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: const Text(
//         'Selamat datang di aplikasi Flutter Layout & Navigasi. '
//         'Aplikasi ini dibuat oleh Adani Salsabila (2341720123). '
//         'Silakan pilih destinasi wisata di bawah untuk melihat detail.',
//         softWrap: true,
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home - Layout & Navigasi'),
//       ),
//       body: ListView(
//         children: [
//           Image.asset(
//             'assets/bromo.jpg',
//             width: double.infinity,
//             height: 240,
//             fit: BoxFit.cover,
//           ),
//           titleSection,
//           buttonSection,
//           textSection,
//           const Divider(),
//           ...items.map((item) {
//             return Card(
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, '/item', arguments: item);
//                 },
//                 child: ListTile(
//                   leading: Image.asset(
//                     item.image,
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(item.name),
//                   subtitle: Text('Rp ${item.price}'),
//                 ),
//               ),
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   }

//   static Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ================= ITEM PAGE =================
// class ItemPage extends StatelessWidget {
//   const ItemPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final item = ModalRoute.of(context)!.settings.arguments as Item;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(item.name),
//       ),
//       body: ListView(
//         children: [
//           Image.asset(
//             item.image,
//             width: double.infinity,
//             height: 250,
//             fit: BoxFit.cover,
//           ),
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(item.name,
//                     style: const TextStyle(
//                         fontSize: 24, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 Text('Harga: Rp ${item.price}',
//                     style: const TextStyle(fontSize: 18)),
//                 const SizedBox(height: 16),
//                 Text(item.desc),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // lib/main.dart


// import 'package:flutter/material.dart';

// // Model Item
// class Item {
//   final String name;
//   final int price;
//   final String image;
//   final String desc;

//   Item({
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.desc,
//   });
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Layout & Navigasi - Adani Salsabila (2341720123)',
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const HomePage(),
//         '/item': (context) => const ItemPage(),
//       },
//     );
//   }
// }

// // ================= HOME PAGE =================
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Item> items = [
//       Item(
//         name: 'Gunung Bromo',
//         price: 50000,
//         image: 'assets/bromo.jpg',
//         desc:
//             'Gunung Bromo adalah salah satu destinasi wisata populer di Jawa Timur. '
//             'Keindahan sunrise dan lautan pasir menjadikannya daya tarik utama. '
//             '— Adani Salsabila (2341720123)',
//       ),
//       Item(
//         name: 'Gunung Semeru',
//         price: 75000,
//         image: 'assets/semeru.jpg',
//         desc:
//             'Gunung Semeru merupakan gunung tertinggi di Pulau Jawa. '
//             'Banyak pendaki tertarik untuk menaklukkan puncaknya, Mahameru. '
//             '— Adani Salsabila (2341720123)',
//       ),
//     ];

//     Widget titleSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: const Text(
//                     'Wisata Gunung di Jawa Timur',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Text(
//                   'Indonesia',
//                   style: TextStyle(color: Colors.grey[500]),
//                 ),
//               ],
//             ),
//           ),
//           Icon(Icons.star, color: Colors.red[500]),
//           const Text('99'),
//         ],
//       ),
//     );

//     Color color = Theme.of(context).primaryColor;
//     Widget buttonSection = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildButtonColumn(color, Icons.call, 'CALL'),
//         _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//         _buildButtonColumn(color, Icons.share, 'SHARE'),
//       ],
//     );

//     Widget textSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: const Text(
//         'Selamat datang di aplikasi Flutter Layout & Navigasi. '
//         'Aplikasi ini dibuat oleh Adani Salsabila (2341720123). '
//         'Silakan pilih destinasi wisata di bawah untuk melihat detail.',
//         softWrap: true,
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home - Layout & Navigasi'),
//       ),
//       body: ListView(
//         children: [
//           Image.asset(
//             'assets/bromo.jpg',
//             width: double.infinity,
//             height: 240,
//             fit: BoxFit.cover,
//           ),
//           titleSection,
//           buttonSection,
//           textSection,
//           const Divider(),
//           ...items.map((item) {
//             return Card(
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, '/item', arguments: item);
//                 },
//                 child: ListTile(
//                   leading: Hero(
//                     tag: item.name, // Hero untuk transisi gambar
//                     child: Image.asset(
//                       item.image,
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   title: Text(item.name),
//                   subtitle: Text('Rp ${item.price}'),
//                 ),
//               ),
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   }

//   static Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ================= ITEM PAGE =================
// class ItemPage extends StatelessWidget {
//   const ItemPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final item = ModalRoute.of(context)!.settings.arguments as Item;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(item.name),
//       ),
//       body: ListView(
//         children: [
//           Hero(
//             tag: item.name, // Hero harus punya tag yang sama dengan di HomePage
//             child: Image.asset(
//               item.image,
//               width: double.infinity,
//               height: 250,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(item.name,
//                     style: const TextStyle(
//                         fontSize: 24, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 Text('Harga: Rp ${item.price}',
//                     style: const TextStyle(fontSize: 18)),
//                 const SizedBox(height: 16),
//                 Text(item.desc),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// main.dart - Versi Navigasi Standar (Tanpa GoRouter)

// import 'package:flutter/material.dart';

// // =========================================================================
// // MODEL & DATA
// // =========================================================================

// class Item {
//   final String name;
//   final int price;
//   final String image;
//   final String desc;
//   final int stock; // Atribut tambahan
//   final double rating; // Atribut tambahan

//   Item({
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.desc,
//     required this.stock,
//     required this.rating,
//   });
// }

// // Data produk yang dimodifikasi
// final List<Item> itemsData = [
//   Item(
//     name: 'Gunung Bromo',
//     price: 50000,
//     image: 'assets/bromo.jpg', // Pastikan gambar ada di folder assets
//     desc: 'Gunung Bromo adalah salah satu destinasi wisata populer di Jawa Timur. Keindahan sunrise dan lautan pasir menjadikannya daya tarik utama. — Adani Salsabila (2341720123)',
//     stock: 100,
//     rating: 4.8,
//   ),
//   Item(
//     name: 'Gunung Semeru',
//     price: 75000,
//     image: 'assets/semeru.jpg', // Pastikan gambar ada di folder assets
//     desc: 'Gunung Semeru merupakan gunung tertinggi di Pulau Jawa. Banyak pendaki tertarik untuk menaklukkan puncaknya, Mahameru. — Adani Salsabila (2341720123)',
//     stock: 50,
//     rating: 4.5,
//   ),
//   Item(
//     name: 'Kawah Ijen',
//     price: 60000,
//     image: 'assets/ijen.jpg', // Pastikan gambar ada di folder assets
//     desc: 'Kawah Ijen terkenal dengan fenomena api birunya yang langka. Pemandangan kawah asam sulfat sangat memukau. — Adani Salsabila (2341720123)',
//     stock: 80,
//     rating: 4.9,
//   ),
//   Item(
//     name: 'Gunung Arjuno',
//     price: 45000,
//     image: 'assets/arjuno.jpg', // Pastikan gambar ada di folder assets
//     desc: 'Gunung Arjuno adalah gunung berapi kerucut (istirahat) yang berada di Jawa Timur, Indonesia.',
//     stock: 70,
//     rating: 4.2,
//   ),
// ];

// // =========================================================================
// // WIDGET KECIL & KOMPONEN
// // =========================================================================

// // Card Widget untuk GridView
// class ItemCard extends StatelessWidget {
//   final Item item;

//   const ItemCard({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Navigasi menggunakan Named Route
//         Navigator.pushNamed(context, '/item', arguments: item);
//       },
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         elevation: 4.0,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Gambar dengan Hero Animation
//             Expanded(
//               child: Hero(
//                 tag: item.name,
//                 child: Image.asset(
//                   item.image,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     item.name,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 16),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   // Rating dan Harga
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(Icons.star, color: Colors.amber, size: 16),
//                           const SizedBox(width: 4),
//                           Text(item.rating.toString()),
//                         ],
//                       ),
//                       Text('Rp ${item.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   // Stok
//                   Text('Stok: ${item.stock}', style: TextStyle(fontSize: 12, color: item.stock > 0 ? Colors.green : Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Footer
// class AppFooter extends StatelessWidget {
//   final String nama;
//   final String nim;

//   const AppFooter({super.key, required this.nama, required this.nim});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(12.0),
//       color: Theme.of(context).primaryColor.withOpacity(0.1),
//       child: Center(
//         child: Text(
//           '$nama ($nim)',
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//         ),
//       ),
//     );
//   }
// }

// // ================= HOME PAGE =================
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wisata Gunung Jatim (Marketplace View)'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(8.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // 2 kolom
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//                 childAspectRatio: 0.7, // Sesuaikan rasio
//               ),
//               itemCount: itemsData.length,
//               itemBuilder: (context, index) {
//                 return ItemCard(item: itemsData[index]);
//               },
//             ),
//           ),
//           // Footer
//           const AppFooter(nama: 'Adani Salsabila', nim: '2341720123'),
//         ],
//       ),
//     );
//   }
// }

// // ================= ITEM PAGE =================
// class ItemPage extends StatelessWidget {
//   const ItemPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Ambil data item dari arguments
//     final item = ModalRoute.of(context)!.settings.arguments as Item;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(item.name),
//       ),
//       body: ListView(
//         children: [
//           // Hero Animation Image
//           Hero(
//             tag: item.name,
//             child: Image.asset(
//               item.image,
//               width: double.infinity,
//               height: 250,
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Detail Produk
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item.name,
//                   style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(Icons.star, color: Colors.amber),
//                     const SizedBox(width: 4),
//                     Text(
//                       '${item.rating} / 5.0 Rating',
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//                 const Divider(),
//                 // Harga
//                 Text(
//                   'Harga: Rp ${item.price}',
//                   style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue),
//                 ),
//                 const SizedBox(height: 8),
//                 // Stok
//                 Text(
//                   'Stok Tersedia: ${item.stock}',
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: item.stock > 0 ? Colors.green : Colors.red),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text('Deskripsi:',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 Text(item.desc),
//                 const SizedBox(height: 30),
//                 // Tombol Beli
//                 Center(
//                   child: ElevatedButton.icon(
//                     onPressed: item.stock > 0 ? () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Anda membeli ${item.name}!')),
//                       );
//                     } : null, // Disable jika stok 0
//                     icon: Icon(Icons.shopping_cart),
//                     label: Text(item.stock > 0 ? 'Beli Sekarang' : 'Stok Habis'),
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                       textStyle: const TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ================= APP UTAMA =================
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Layout & Navigasi - Adani Salsabila (2341720123)',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const HomePage(),
//         '/item': (context) => const ItemPage(),
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Method Pembantu dari Praktikum 2
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Tentukan warna primer berdasarkan tema aplikasi
    Color color = Theme.of(context).primaryColor;

    // --- Praktikum 1: titleSection ---
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    // --- Praktikum 2: buttonSection ---
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Langkah 1: Buat widget textSection
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Kawasan wisata gunung di Batu menawarkan kombinasi sempurna antara petualangan dan relaksasi berkat keberadaan gugusan gunung seperti Gunung Panderman, Gunung Arjuno, dan Gunung Welirang. Selain pendakian yang menantang dengan pemandangan alam yang memukau, daerah pegunungan ini menjadi latar bagi berbagai destinasi populer, mulai dari taman rekreasi modern seperti Jatim Park yang memanfaatkan udara sejuknya, hingga area perkemahan yang tenang. Pengunjung dapat menikmati udara segar, berburu spot foto estetis, atau hanya bersantai di kafe dan vila dengan panorama lembah dan perbukitan yang menyegarkan mata, menjadikan wisata gunung di Batu daya tarik utama bagi turis domestik maupun mancanegara.',
        softWrap: true,
      ),
    );

  

    // --- Layout Utama (Scaffold) ---
    return MaterialApp(
      title: 'Flutter layout Adani Salsabila',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout Adani Salsabila - 2341720123'),
        ),
        // Langkah 2: Tambahkan variabel textSection ke body
        // Menggunakan Column untuk menumpuk semua bagian secara vertikal
        body: Column(
          children: [
            imageSection,
            titleSection,
            buttonSection,
            textSection, // textSection ditambahkan setelah buttonSection
          ],
        ),
      ),
    );
  }
}