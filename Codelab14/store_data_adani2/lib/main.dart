// File: lib/main.dart
import 'package:flutter/material.dart';
import 'httphelper.dart';
import 'pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // SOAL 1: Identitas Nama
      title: 'Flutter JSON Adani', 
      theme: ThemeData(
        // SOAL 1: Warna Tema Favorit (Misal: Indigo)
        primarySwatch: Colors.indigo, 
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

class _MyHomePageState extends State<MyHomePage> {
  // Method untuk memanggil API
  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    List<Pizza> pizzas = await helper.getPizzaList();
    return pizzas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Adani'), // Pastikan nama Anda ada di sini
      ),
      body: FutureBuilder(
        future: callPizzas(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          // 1. Jika terjadi Error
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong (Cek koneksi/Domain API)'),
            );
          }
          // 2. Jika Data belum ada (Loading)
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // 3. Jika Data Ada -> Tampilkan ListView
          return ListView.builder(
            itemCount: (snapshot.data == null) ? 0 : snapshot.data!.length,
            itemBuilder: (BuildContext context, int position) {
              final pizza = snapshot.data![position];
              return ListTile(
                leading: const Icon(Icons.local_pizza),
                title: Text(pizza.pizzaName),
                subtitle: Text(
                  '${pizza.description} - € ${pizza.price}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}