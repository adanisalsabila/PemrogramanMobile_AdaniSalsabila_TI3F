import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Langkah 3: Import
import 'dart:convert';
import 'dart:async';
import 'pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Data Adani',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
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
  // Langkah 4: Variabel appCounter
  int appCounter = 0;

  // Langkah 5: Method readAndWritePreference
  Future<void> readAndWritePreference() async {
    // Langkah 6: Dapatkan Instance SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Langkah 7: Baca, Cek Null (?? 0), dan Increment
    appCounter = (prefs.getInt('appCounter') ?? 0) + 1;
    
    // Langkah 8: Simpan Nilai Baru
    await prefs.setInt('appCounter', appCounter);
    
    // Langkah 9: Perbarui State
    setState(() {
      // appCounter sudah diupdate di atas, setState hanya trigger rebuild
    });
  }

  // Langkah 13: Method deletePreference
  Future<void> deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Menghapus semua data preference
    await prefs.clear();
    
    setState(() {
      appCounter = 0; // Reset counter di UI ke 0
    });
  }

  @override
  void initState() {
    super.initState();
    // Langkah 10: Panggil di initState
    readAndWritePreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Adani'),
      ),
      // Langkah 11: Perbarui Tampilan (body)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have opened the app $appCounter times.',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Langkah 14: Panggil deletePreference
                deletePreference();
              },
              child: const Text('Reset counter'),
            ),
          ],
        ),
      ),
    );
  }
}