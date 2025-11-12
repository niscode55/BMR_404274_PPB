import 'package:flutter/material.dart';
import 'package:bmr_calculator/constants.dart';

class IconCard extends StatelessWidget {
  IconCard({this.cardIcon, required this.caption});

  final IconData? cardIcon; // Ikon yang akan ditampilkan
  final String caption;     // Teks keterangan di bawah ikon

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Posisikan isi ke tengah
      children: [
        Icon(
          cardIcon,
          size: 50.0, // Ukuran ikon
        ),
        const SizedBox(height: 10.0), // Jarak antara ikon dan teks
        Text(
          caption,
          style: labelTextStyle, // Gaya teks dari constants.dart
        ),
      ],
    );
  }
}