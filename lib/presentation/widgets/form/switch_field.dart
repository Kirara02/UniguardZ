import 'package:flutter/material.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';

class SwitchField extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool) onChanged;
  final bool isRequired;

  const SwitchField(
      {super.key, required this.label, required this.value, required this.onChanged, this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryExtraSoft, width: 4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isRequired) const Text("* "),
              Text(label, style: Typogaphy.Medium),
            ],
          ),
          Switch(
            value: value,
            onChanged: (val) => onChanged(val),
          ),
        ],
      ),
    );
  }
}
