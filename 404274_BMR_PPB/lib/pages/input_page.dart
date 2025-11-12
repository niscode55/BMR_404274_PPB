import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmr_calculator/components/custom_card.dart';
import 'package:bmr_calculator/components/icon_card.dart';
import 'package:bmr_calculator/components/unit_system_tabs.dart';
import 'package:bmr_calculator/constants.dart';
import 'result_page.dart';
import 'package:bmr_calculator/components/bottom_button.dart';
import 'package:bmr_calculator/components/round_icon_button.dart';
import 'package:bmr_calculator/calculator.dart';

/// Halaman Input untuk BMR Calculator
/// User input: Unit System, Gender, Height, Weight, Age
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // State variables untuk menyimpan input user
  Gender selectedGender = Gender.male;          // Default: male
  UnitSystem selectedUnit = UnitSystem.metric;  // Default: metric
  
  // Metric units
  int heightCm = 170;
  int weightKg = 60;
  
  // US units
  int heightFeet = 5;
  int heightInches = 7;
  double weightLbs = 132;
  
  // Other units
  double heightMeters = 1.70;
  
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMR CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Unit System Tabs (US, Metric, Other)
          UnitSystemTabs(
            selectedUnit: selectedUnit,
            onUnitChanged: (UnitSystem newUnit) {
              setState(() {
                selectedUnit = newUnit;
              });
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ROW 1: Gender Selection (Male/Female)
                  SizedBox(
                    height: 180,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomCard(
                            color: selectedGender == Gender.male
                                ? activeCardColor
                                : inactiveCardColor,
                            cardChild: IconCard(
                              cardIcon: FontAwesomeIcons.mars,
                              caption: 'MALE',
                            ),
                            onPress: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomCard(
                            color: selectedGender == Gender.female
                                ? activeCardColor
                                : inactiveCardColor,
                            cardChild: IconCard(
                              cardIcon: FontAwesomeIcons.venus,
                              caption: 'FEMALE',
                            ),
                            onPress: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ROW 2: Height Input
                  SizedBox(
                    height: 180,
                    child: CustomCard(
                      color: activeCardColor,
                      cardChild: _buildHeightInput(),
                    ),
                  ),

                  // ROW 3: Weight and Age
                  SizedBox(
                    height: 180,
                    child: Row(
                      children: [
                        // Weight Card
                        Expanded(
                          child: CustomCard(
                            color: activeCardColor,
                            cardChild: _buildWeightInput(),
                          ),
                        ),
                        // Age Card
                        Expanded(
                          child: CustomCard(
                            color: activeCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('AGE', style: labelTextStyle),
                                Text(age.toString(), style: numberTextStyle),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          if (age > 15) age--;
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 10.0),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          if (age < 80) age++;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Button: Calculate
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: _handleCalculate,
          ),
        ],
      ),
    );
  }

  /// Build height input berdasarkan unit system
  Widget _buildHeightInput() {
    switch (selectedUnit) {
      case UnitSystem.metric:
        return _buildMetricHeight();
      case UnitSystem.us:
        return _buildUSHeight();
      case UnitSystem.other:
        return _buildOtherHeight();
    }
  }

  /// Height input untuk Metric (cm dengan slider)
  Widget _buildMetricHeight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('HEIGHT', style: labelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(heightCm.toString(), style: numberTextStyle),
            const Text(' cm', style: labelTextStyle),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: const Color(0xFF8D8E98),
            thumbColor: const Color(0xFFEB1555),
            overlayColor: const Color(0x29EB1555),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
          ),
          child: Slider(
            value: heightCm.toDouble(),
            min: 120.0,
            max: 220.0,
            onChanged: (double value) {
              setState(() {
                heightCm = value.round();
              });
            },
          ),
        ),
      ],
    );
  }

  /// Height input untuk US (feet + inches)
  Widget _buildUSHeight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('HEIGHT', style: labelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            // Feet
            Column(
              children: [
                Text(heightFeet.toString(), style: numberTextStyle),
                const Text('ft', style: labelTextStyle),
              ],
            ),
            const SizedBox(width: 20),
            // Inches
            Column(
              children: [
                Text(heightInches.toString(), style: numberTextStyle),
                const Text('in', style: labelTextStyle),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Feet buttons
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  if (heightFeet > 4) heightFeet--;
                });
              },
            ),
            const SizedBox(width: 10),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () {
                setState(() {
                  if (heightFeet < 7) heightFeet++;
                });
              },
            ),
            const SizedBox(width: 30),
            // Inches buttons
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  if (heightInches > 0) heightInches--;
                });
              },
            ),
            const SizedBox(width: 10),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () {
                setState(() {
                  if (heightInches < 11) heightInches++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  /// Height input untuk Other (meters dengan slider)
  Widget _buildOtherHeight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('HEIGHT', style: labelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(heightMeters.toStringAsFixed(2), style: numberTextStyle),
            const Text(' m', style: labelTextStyle),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: const Color(0xFF8D8E98),
            thumbColor: const Color(0xFFEB1555),
            overlayColor: const Color(0x29EB1555),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
          ),
          child: Slider(
            value: heightMeters,
            min: 1.2,
            max: 2.2,
            divisions: 100,
            onChanged: (double value) {
              setState(() {
                heightMeters = value;
              });
            },
          ),
        ),
      ],
    );
  }

  /// Build weight input berdasarkan unit system
  Widget _buildWeightInput() {
    switch (selectedUnit) {
      case UnitSystem.metric:
        return _buildMetricWeight();
      case UnitSystem.us:
        return _buildUSWeight();
      case UnitSystem.other:
        return _buildMetricWeight(); // Same as metric
    }
  }

  /// Weight input untuk Metric (kg)
  Widget _buildMetricWeight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('WEIGHT', style: labelTextStyle),
        Text(weightKg.toString(), style: numberTextStyle),
        const Text('kg', style: labelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  if (weightKg > 30) weightKg--;
                });
              },
            ),
            const SizedBox(width: 10.0),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () {
                setState(() {
                  weightKg++;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  /// Weight input untuk US (lbs)
  Widget _buildUSWeight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('WEIGHT', style: labelTextStyle),
        Text(weightLbs.toStringAsFixed(0), style: numberTextStyle),
        const Text('lbs', style: labelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  if (weightLbs > 66) weightLbs--;
                });
              },
            ),
            const SizedBox(width: 10.0),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () {
                setState(() {
                  weightLbs++;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  /// Handle calculate dengan unit system yang berbeda
  void _handleCalculate() {
    int heightValue = 0;
    int weightValue = 0;
    int? feet;
    int? inches;

    // Konversi berdasarkan unit system
    switch (selectedUnit) {
      case UnitSystem.metric:
        heightValue = heightCm;
        weightValue = weightKg;
        break;
      case UnitSystem.us:
        heightValue = 0;
        weightValue = weightLbs.round();
        feet = heightFeet;
        inches = heightInches;
        break;
      case UnitSystem.other:
        heightValue = (heightMeters * 100).round(); // Convert meters to cm
        weightValue = weightKg;
        break;
    }

    // Membuat instance Calculator
    Calculator cal = Calculator(
      height: heightValue,
      weight: weightValue,
      age: age,
      gender: selectedGender,
      unitSystem: selectedUnit,
      heightFeet: feet,
      heightInches: inches,
    );

    // Menghitung BMR dan mendapatkan hasil
    String bmr = cal.calculateBMR();
    String result = cal.getResult();
    String information = cal.getInterpretation();
    Map<String, String> activityLevels = cal.getAllActivityLevels();

    // Navigasi ke halaman hasil
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          result: result,
          bmr: bmr,
          information: information,
          activityLevels: activityLevels,
          unitSystem: selectedUnit,
        ),
      ),
    );
  }
}