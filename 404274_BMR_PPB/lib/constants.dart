import 'package:flutter/material.dart';

// Warna untuk card yang aktif (dipilih)
const activeCardColor = Color(0xFF1D1E33);

// Warna untuk card yang tidak aktif
const inactiveCardColor = Color(0xFF111328);

// Tinggi container button di bagian bawah
const bottomContainerHeight = 80.0;

// Warna untuk button di bagian bawah
const bottomContainerColor = Color(0xFFEB1555);

// Enum untuk jenis kelamin
// Digunakan untuk membedakan perhitungan BMR antara pria dan wanita
enum Gender {
  male,   // Pria
  female, // Wanita
}

// Enum untuk sistem unit pengukuran
enum UnitSystem {
  metric,    // kg, cm
  us,        // lbs, feet/inches
  other,     // custom units
}

// Style untuk text label (seperti "HEIGHT", "WEIGHT", "AGE")
const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

// Style untuk angka besar (nilai height, weight, age)
const numberTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w900,
);

// Style untuk text di button
const buttonTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

// Style untuk text hasil (Normal, Overweight, dll)
const resultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

// Style untuk angka BMR besar di result page
const bmrTextStyle = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);

// Style untuk text informasi/interpretasi
const interpretationTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

// Style untuk activity level text
const activityTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

// Style untuk tab unit system
const activeTabTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const inactiveTabTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  color: Color(0xFF8D8E98),
);