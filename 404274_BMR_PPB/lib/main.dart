import 'package:flutter/material.dart';
import 'pages/input_page.dart';

/// Entry point aplikasi BMR Calculator
void main() {
  runApp(const MyApp());
}

/// Root widget aplikasi
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul aplikasi yang muncul di task manager
      title: 'BMR Calculator',
      
      // Mengatur tema aplikasi dengan dark mode
      theme: ThemeData.dark().copyWith(
        // Warna utama aplikasi (dark blue)
        primaryColor: const Color(0xFF0A0E21),
        
        // Warna background untuk Scaffold
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        
        // Tema untuk AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,      // Title di tengah
          elevation: 0.0,         // Tidak ada shadow
        ),
      ),
      
      // Halaman pertama yang ditampilkan adalah InputPage
      home: const InputPage(),
      
      // Menyembunyikan banner debug di pojok kanan atas
      debugShowCheckedModeBanner: false,
    );
  }
}