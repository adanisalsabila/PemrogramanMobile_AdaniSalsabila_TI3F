// lib/geolocation.dart

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Import geolocator

// ===========================================
// Langkah 4: Buat StatefulWidget
// ===========================================
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

// ===========================================
// Langkah 5: Isi kode geolocation.dart
// ===========================================
class _LocationScreenState extends State<LocationScreen> {
  // State: Variabel yang akan menyimpan lokasi dan status loading
  String _result = 'Tekan tombol untuk mendapatkan lokasi...';
  Position? _currentPosition;
  bool _isLoading = false; // Digunakan untuk menampilkan CircularProgressIndicator

  @override
  void initState() {
    super.initState();
    // Panggil method getPosition saat widget pertama kali dibuat
    getPosition();
  }

  // Method async untuk mendapatkan posisi GPS
  Future<void> getPosition() async {
    // 1. Set loading state
    setState(() {
      _isLoading = true;
      _result = 'Sedang mencari lokasi...';
    });

    try {
      // Cek apakah layanan lokasi aktif
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Layanan lokasi tidak aktif.');
      }

      // Cek izin akses lokasi
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Izin lokasi ditolak.');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception('Izin lokasi ditolak permanen. Silakan ubah di pengaturan.');
      }

      // ===========================================
      // Soal 12: Tambahkan delay di sini
      await Future.delayed(const Duration(seconds: 3)); 
      // ===========================================

      // Ambil posisi saat ini
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // 2. Update state setelah mendapatkan posisi
      setState(() {
        _currentPosition = position;
        _result = 
          'Lat: ${_currentPosition!.latitude.toStringAsFixed(6)}\n'
          'Long: ${_currentPosition!.longitude.toStringAsFixed(6)}';
        _isLoading = false;
      });

    } catch (e) {
      // 3. Update state jika terjadi error
      setState(() {
        _result = 'Gagal mendapatkan lokasi: ${e.toString()}';
        _isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Soal 11: Tambahkan nama panggilan
        title: const Text('Adani Salsabila - Praktikum 6: Future & StatefulWidget'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ===========================================
            // Langkah 8: Tambahkan animasi loading (conditional)
            // ===========================================
            if (_isLoading)
              const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Memuat lokasi (Delay 3 detik)...', style: TextStyle(fontSize: 16)),
                ],
              )
            else
              // Tampilkan hasil
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            
            const SizedBox(height: 30),

            // Tombol untuk memuat ulang lokasi
            ElevatedButton(
              onPressed: _isLoading ? null : getPosition, // Disable saat loading
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Refresh Lokasi'),
            ),
          ],
        ),
      ),
    );
  }
}