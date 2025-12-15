import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  // Langkah 8 & Soal 12: Menambahkan Delay dan Logic Future
  Future<void> getPosition() async {
    try {
      // Soal 12: Menambahkan delay 3 detik untuk simulasi loading
      await Future.delayed(const Duration(seconds: 3));

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        myPosition =
            'Latitude: ${position.latitude} - Longitude: ${position.longitude}';
      });
    } catch (e) {
      // Handle jika user menolak izin lokasi atau GPS mati
      setState(() {
        myPosition = 'Gagal mendapatkan lokasi: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Langkah 8: Menambahkan animasi loading (CircularProgressIndicator)
    // Jika myPosition masih kosong, tampilkan loading. Jika sudah ada, tampilkan teks.
    final myWidget = myPosition == ''
        ? const CircularProgressIndicator()
        : Text(myPosition);

    return Scaffold(
      appBar: AppBar(
        // Soal 11: Ganti 'Namaku' dengan nama panggilan Anda
        title: const Text('Current Location Adani'), 
      ),
      body: Center(child: myWidget),
    );
  }
}