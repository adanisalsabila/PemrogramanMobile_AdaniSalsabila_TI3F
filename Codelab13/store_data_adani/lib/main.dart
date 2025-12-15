import 'package:flutter/material.dart';
import 'dart:convert'; // Untuk jsonDecode (nanti)
import 'dart:async'; // Untuk Future
import './pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Data Adani', // Soal 1: Nama Panggilan
      theme: ThemeData(
        primarySwatch: Colors.deepOrange, // Soal 1: Warna Tema Favorit
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('JSON Parsing Adani'),
//       ),
//       body: const Center(
//         child: Text('Pizza JSON will be here'),
//       ),
//     );
//   }
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // Langkah 6: Variabel penampung string JSON
//   String pizzaString = '';

//   // Langkah 7: Method membaca file JSON
//   Future<void> readJsonFile() async {
//     String myString = await DefaultAssetBundle.of(context)
//         .loadString('assets/pizzalist.json');
//     setState(() {
//       pizzaString = myString;
//     });
//   }

//   // Langkah 8: Panggil di initState
//   @override
//   void initState() {
//     super.initState();
//     readJsonFile();
//   }

//   // Langkah 9: Tampilkan hasil JSON
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('JSON Parsing Adani'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Text(pizzaString), // Menampilkan string mentah
//         ),
//       ),
//     );
//   }
// }

class _MyHomePageState extends State<MyHomePage> {
  // Langkah 19: List penampung objek Pizza
  List<Pizza> myPizzas = [];

  // Langkah 18: Ubah signature return type menjadi Future<List<Pizza>>
  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    
    // Langkah 14: Decode JSON String ke List Dynamic
    List pizzaMapList = jsonDecode(myString);
    
    // Langkah 16: Konversi List Map ke List<Pizza>
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      myPizzas.add(Pizza.fromJson(pizza));
    }

    // Langkah 17: Return hasil
    return myPizzas;
  }

  @override
  void initState() {
    super.initState();
    // Langkah 20: Panggil method dan update state
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Parsing Adani'),
      ),
      // Langkah 21: Gunakan ListView.builder
      body: ListView.builder(
        itemCount: myPizzas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myPizzas[index].pizzaName),
            subtitle: Text(myPizzas[index].description),
          );
        },
      ),
    );
  }
}