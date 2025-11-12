import 'constants.dart';

/// Class Calculator untuk menghitung BMR (Basal Metabolic Rate)
/// BMR adalah jumlah kalori yang dibutuhkan tubuh saat istirahat
class Calculator {
  // Constructor dengan required parameters
  Calculator({
    required this.height,  // Tinggi badan dalam cm
    required this.weight,  // Berat badan dalam kg
    required this.age,     // Umur dalam tahun
    required this.gender, int? heightInches, int? heightFeet, required UnitSystem unitSystem,  // Jenis kelamin (male/female)
  });

  final int height;
  final int weight;
  final int age;
  final Gender gender;
  
  // Variable private untuk menyimpan nilai BMR
  double _bmr = 0.0;

  /// Menghitung BMR menggunakan Mifflin-St Jeor Equation
  /// Formula:
  /// Pria: BMR = (10 × berat) + (6.25 × tinggi) - (5 × umur) + 5
  /// Wanita: BMR = (10 × berat) + (6.25 × tinggi) - (5 × umur) - 161
  String calculateBMR() {
    if (gender == Gender.male) {
      // Rumus untuk pria
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      // Rumus untuk wanita
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    
    // Return nilai BMR dengan 1 desimal
    return _bmr.toStringAsFixed(1);
  }

  /// Menentukan kategori BMR berdasarkan umur dan jenis kelamin
  /// Returns: String kategori (Low, Normal, High)
  String getResult() {
    // Rata-rata BMR berdasarkan gender dan umur
    double averageBMR;
    
    if (gender == Gender.male) {
      // Rata-rata BMR pria berdasarkan umur
      if (age < 30) {
        averageBMR = 1700;
      } else if (age < 50) {
        averageBMR = 1650;
      } else {
        averageBMR = 1550;
      }
    } else {
      // Rata-rata BMR wanita berdasarkan umur
      if (age < 30) {
        averageBMR = 1400;
      } else if (age < 50) {
        averageBMR = 1350;
      } else {
        averageBMR = 1250;
      }
    }
    
    // Kategorisasi berdasarkan persentase dari rata-rata
    if (_bmr > averageBMR * 1.1) {
      return 'High';
    } else if (_bmr > averageBMR * 0.9) {
      return 'Normal';
    } else {
      return 'Low';
    }
  }

  /// Memberikan interpretasi dan saran berdasarkan hasil BMR
  /// Returns: String berisi penjelasan dan saran
  String getInterpretation() {
    String result = getResult();
    
    if (result == 'High') {
      return 'Your BMR is higher than average. This means your body burns more calories at rest. Make sure to eat enough to support your metabolism.';
    } else if (result == 'Normal') {
      return 'Your BMR is within normal range. Maintain a balanced diet and regular exercise to keep your metabolism healthy.';
    } else {
      return 'Your BMR is lower than average. Consider strength training to build muscle mass, which can help increase your metabolic rate.';
    }
  }

  /// Menghitung kebutuhan kalori berdasarkan activity level
  /// Parameter: activityLevel (1.2 - 1.9)
  /// Returns: String kebutuhan kalori harian dengan 0 desimal
  String getCalorieNeeds(double activityLevel) {
    double calorieNeeds = _bmr * activityLevel;
    return calorieNeeds.toStringAsFixed(0);
  }

  /// Mendapatkan deskripsi activity level
  /// Returns: Map dengan semua activity level dan kebutuhan kalorinya
  Map<String, String> getAllActivityLevels() {
    return {
      'Sedentary (little or no exercise)': getCalorieNeeds(1.2),
      'Lightly active (exercise 1-3 days/week)': getCalorieNeeds(1.375),
      'Moderately active (exercise 3-5 days/week)': getCalorieNeeds(1.55),
      'Very active (exercise 6-7 days/week)': getCalorieNeeds(1.725),
      'Extra active (very hard exercise)': getCalorieNeeds(1.9),
    };
  }
}