import 'package:flutter/material.dart';
import 'package:wedding_planner_india/core/theme/app_colors.dart';

class RangeFilterChips extends StatelessWidget {
  const RangeFilterChips({
    super.key,
    required this.selectedKm,
    required this.onChanged,
  });

  final double selectedKm;
  final ValueChanged<double> onChanged;

  static const ranges = [1.0, 5.0, 8.0];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.radar, size: 20, color: AppColors.primary),
        const SizedBox(width: 8),
        const Text('Range:'),
        const SizedBox(width: 8),
        ...ranges.map((km) {
          final selected = selectedKm == km;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text('${km.toInt()} km'),
              selected: selected,
              onSelected: (_) => onChanged(km),
            ),
          );
        }),
      ],
    );
  }
}
