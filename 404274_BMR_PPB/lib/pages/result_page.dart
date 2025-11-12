import 'package:flutter/material.dart';
import 'package:bmr_calculator/components/custom_card.dart';
import 'package:bmr_calculator/constants.dart';
import 'package:bmr_calculator/components/bottom_button.dart';

/// Halaman Result untuk menampilkan hasil perhitungan BMR
/// Menampilkan: Nilai BMR, Kategori, Interpretasi, dan Kebutuhan Kalori
class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.result,         // Kategori: Low, Normal, High
    required this.bmr,             // Nilai BMR dalam string
    required this.information,     // Interpretasi dan saran
    required this.activityLevels, required UnitSystem unitSystem,  // BARU: Map activity level dan kalori
  });

  final String result;
  final String bmr;
  final String information;
  final Map<String, String> activityLevels; // Untuk BMR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMR CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header "Your Result"
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Main Result Card - Menampilkan BMR dan interpretasi
          Expanded(
            flex: 5,
            child: CustomCard(
              color: activeCardColor,
              cardChild: SingleChildScrollView( // Agar bisa scroll jika konten panjang
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    
                    // Menampilkan kategori hasil (Low, Normal, High)
                    Text(
                      result,
                      style: resultTextStyle,
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // Menampilkan nilai BMR dalam angka besar
                    Text(
                      bmr,
                      style: bmrTextStyle,
                    ),
                    
                    // Label "calories/day"
                    const Text(
                      'calories/day',
                      style: labelTextStyle,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Divider untuk memisahkan section
                    const Divider(
                      color: Color(0xFF8D8E98),
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // Interpretasi dan saran
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        information,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // BARU: Section Activity Levels
                    const Divider(
                      color: Color(0xFF8D8E98),
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // Header untuk activity levels
                    const Text(
                      'Daily Calorie Needs',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEB1555),
                      ),
                    ),
                    
                    const SizedBox(height: 10),
                    
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Based on your activity level:',
                        style: interpretationTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Menampilkan semua activity levels dan kebutuhan kalorinya
                    // Loop through map activityLevels
                    ...activityLevels.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Nama activity level
                            Expanded(
                              flex: 2,
                              child: Text(
                                entry.key,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF8D8E98),
                                ),
                              ),
                            ),
                            // Kebutuhan kalori
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${entry.value} cal',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Button untuk kembali ke halaman input
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              // Navigator.pop() untuk kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}