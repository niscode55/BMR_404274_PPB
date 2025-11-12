import 'package:flutter/material.dart'; 

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;        // Ikon yang ditampilkan
  final Function() onPressed; // Aksi saat tombol ditekan

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0, // Tanpa bayangan
      constraints: const BoxConstraints.tightFor(
        width: 32.0,
        height: 32.0, // Ukuran tombol
      ),
      shape: const CircleBorder(), // Bentuk lingkaran
      fillColor: const Color(0xFF4C4F5E), // Warna tombol
      onPressed: onPressed, // Event klik
      child: Icon(icon, size: 16.0), // Ikon di tengah tombol
    );
  }
}