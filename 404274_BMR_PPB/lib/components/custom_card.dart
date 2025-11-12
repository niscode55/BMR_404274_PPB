import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.color, this.cardChild, this.onPress});

  final Color color;            // Warna latar kartu
  final Widget? cardChild;      // Isi di dalam kartu
  final Function()? onPress;    // Aksi saat kartu ditekan (opsional)

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // Menangani tap pada kartu
      child: Container(
        margin: const EdgeInsets.all(15.0),             // Jarak luar kartu
        padding: const EdgeInsets.only(left: 1.0, right: 1.0), // Jarak dalam
        decoration: BoxDecoration(
          color: color,                                 // Warna kartu
          borderRadius: BorderRadius.circular(10.0),    // Sudut membulat
        ),
        child: cardChild, // Menampilkan widget anak di dalam kartu
      ),
    );
  }
}