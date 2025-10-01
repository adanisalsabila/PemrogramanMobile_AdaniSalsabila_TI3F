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

import 'package:flutter/material.dart';

// Model Item
class Item {
  final String name;
  final int price;
  final String image;
  final String desc;

  Item({
    required this.name,
    required this.price,
    required this.image,
    required this.desc,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout & Navigasi - Adani Salsabila (2341720123)',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/item': (context) => const ItemPage(),
      },
    );
  }
}

// ================= HOME PAGE =================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: 'Gunung Bromo',
        price: 50000,
        image: 'assets/bromo.jpg', 
        desc:
            'Gunung Bromo adalah salah satu destinasi wisata populer di Jawa Timur. '
            'Keindahan sunrise dan lautan pasir menjadikannya daya tarik utama. '
            '— Adani Salsabila (2341720123)',
      ),
      Item(
        name: 'Gunung Semeru',
        price: 75000,
        image: 'assets/semeru.jpg',
        desc:
            'Gunung Semeru merupakan gunung tertinggi di Pulau Jawa. '
            'Banyak pendaki tertarik untuk menaklukkan puncaknya, Mahameru. '
            '— Adani Salsabila (2341720123)',
      ),
    ];

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
                    'Wisata Gunung di Jawa Timur',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Indonesia',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('99'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Selamat datang di aplikasi Flutter Layout & Navigasi. '
        'Aplikasi ini dibuat oleh Adani Salsabila (2341720123). '
        'Silakan pilih destinasi wisata di bawah untuk melihat detail.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Layout & Navigasi'),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/bromo.jpg',
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          const Divider(),
          ...items.map((item) {
            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/item', arguments: item);
                },
                child: ListTile(
                  leading: Image.asset(
                    item.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text('Rp ${item.price}'),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  static Column _buildButtonColumn(Color color, IconData icon, String label) {
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
}

// ================= ITEM PAGE =================
class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: ListView(
        children: [
          Image.asset(
            item.image,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Harga: Rp ${item.price}',
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 16),
                Text(item.desc),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
