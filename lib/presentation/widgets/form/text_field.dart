import 'package:flutter/material.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? value;
  final Function(String) onChanged;
  final bool isRequired;
  final int maxLines;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.value,
      required this.onChanged,
      this.isRequired = false,
      this.maxLines = 3});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryExtraSoft, width: 4),
      ),
      child: TextFormField(
        initialValue: value?.toString(),
        onChanged: (val) => onChanged(val),
        maxLines: maxLines,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          hintText: (isRequired) ? "* $label" : label,
          hintStyle: Typogaphy.Regular.copyWith(fontSize: 14),
          border: InputBorder.none,
        ),
        validator: (val) {
          if (isRequired && (val == null || val.isEmpty)) {
            return 'Field $label is required';
          }
          return null;
        },
      ),
    );
  }
}
