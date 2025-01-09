import 'package:flutter/material.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.tertiary, width: 4),
      ),
      child: TextFormField(
        initialValue: value?.toString(),
        onChanged: (val) => onChanged(val),
        maxLines: maxLines,
        textInputAction: TextInputAction.next,
        style: textTheme.labelMedium!.copyWith(
          color: colorScheme.onPrimary,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          hintText: (isRequired) ? "* $label" : label,
          hintStyle: textTheme.labelMedium!.copyWith(
            color: colorScheme.onPrimary,
          ),
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
