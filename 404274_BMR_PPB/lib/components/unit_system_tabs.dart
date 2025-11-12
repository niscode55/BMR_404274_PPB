import 'package:flutter/material.dart';
import 'package:bmr_calculator/constants.dart';

/// Widget untuk memilih sistem unit (Metric, US, Other)
class UnitSystemTabs extends StatelessWidget {
  UnitSystemTabs({
    required this.selectedUnit,
    required this.onUnitChanged,
  });

  final UnitSystem selectedUnit;
  final Function(UnitSystem) onUnitChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: inactiveCardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          // Tab 1: US Units
          Expanded(
            child: _buildTab(
              title: 'US Units',
              unit: UnitSystem.us,
              isSelected: selectedUnit == UnitSystem.us,
            ),
          ),
          // Tab 2: Metric Units
          Expanded(
            child: _buildTab(
              title: 'Metric Units',
              unit: UnitSystem.metric,
              isSelected: selectedUnit == UnitSystem.metric,
            ),
          ),
          // Tab 3: Other Units
          Expanded(
            child: _buildTab(
              title: 'Other Units',
              unit: UnitSystem.other,
              isSelected: selectedUnit == UnitSystem.other,
            ),
          ),
        ],
      ),
    );
  }

  /// Helper method untuk membuat satu tab
  Widget _buildTab({
    required String title,
    required UnitSystem unit,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onUnitChanged(unit),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          // Background hijau jika selected
          color: isSelected ? const Color(0xFF4CAF50) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            style: isSelected ? activeTabTextStyle : inactiveTabTextStyle,
          ),
        ),
      ),
    );
  }
}