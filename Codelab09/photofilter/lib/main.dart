// lib/main.dart

import 'package:flutter/material.dart';
import 'package:photofilter/widget/filter_carousel.dart'; // Import widget utama

void main() {
  // Pastikan Image.network berfungsi
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    const MaterialApp(
      home: PhotoFilterCarousel(),
      debugShowCheckedModeBanner: false,
    ),
  );
}