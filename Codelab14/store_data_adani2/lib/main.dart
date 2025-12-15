import 'package:flutter/material.dart';
import 'httphelper.dart';
import 'pizza.dart';
import 'pizza_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Adani',
      theme: ThemeData(
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
        title: const Text('JSON Adani'),
      ),
      body: FutureBuilder(
        future: callPizzas(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          // 1. Error Handling
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong (Cek koneksi/Domain API)'),
            );
          }
          // 2. Loading State
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // 3. Menampilkan Data dengan Dismissible (Swipe to Delete)
          return ListView.builder(
            itemCount: (snapshot.data == null) ? 0 : snapshot.data!.length,
            itemBuilder: (BuildContext context, int position) {
              final pizza = snapshot.data![position];

              // IMPLEMENTASI SOAL 4: Dismissible
              return Dismissible(
                // Key harus unik, gunakan ID pizza
                key: Key(pizza.id.toString()),
                
                // Background Merah saat di-swipe
                background: Container(color: Colors.red),
                
                // Aksi ketika item di-swipe (Dihapus)
                onDismissed: (direction) {
                  HttpHelper helper = HttpHelper();
                  // Panggil fungsi delete di API
                  helper.deletePizza(pizza.id);
                  
                  // Opsional: Tampilkan snackbar konfirmasi
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${pizza.pizzaName} deleted')),
                  );
                },
                
                // Child: Tampilan ListTile seperti biasa
                child: ListTile(
                  leading: const Icon(Icons.local_pizza),
                  title: Text(pizza.pizzaName),
                  subtitle: Text(
                    '${pizza.description} - € ${pizza.price}',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PizzaDetailScreen(
                          pizza: pizza,
                          isNew: false, // Mode Edit
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      // Tombol Tambah (FAB)
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetailScreen(
                pizza: Pizza(
                    id: 0,
                    pizzaName: '',
                    description: '',
                    price: 0,
                    imageUrl: '',
                    myCrust: ''),
                isNew: true, // Mode Baru
              ),
            ),
          );
        },
      ),
    );
  }
}