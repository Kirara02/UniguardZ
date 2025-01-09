import 'package:flutter/material.dart';

class SwitchField extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool) onChanged;
  final bool isRequired;

  const SwitchField(
      {super.key,
      required this.label,
      required this.value,
      required this.onChanged,
      this.isRequired = false});

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  if (isRequired)
                    const TextSpan(
                      text: "* ",
                      style: TextStyle(color: Colors.red),
                    ),
                  TextSpan(
                    text: label,
                    style: textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
              softWrap: true, // Allow text wrapping
            ),
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
