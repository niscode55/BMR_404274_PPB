import 'package:flutter/material.dart';
import 'package:bmr_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle;   // Teks pada tombol
  final Function() onTap;     // Aksi saat tombol ditekan

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Menangani event tap
      child: Container(
        margin: const EdgeInsets.only(top: 10.0), // Jarak atas
        height: bottomContainerHeight,             // Tinggi tombol
        color: bottomContainerColor,               // Warna tombol
        child: Center(
          child: Text(
            buttonTitle,
            style: buttonTextStyle, // Gaya teks dari constants.dart
          ),
        ),
      ),
    );
  }
}