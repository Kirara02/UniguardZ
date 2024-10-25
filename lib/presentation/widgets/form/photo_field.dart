import 'package:flutter/material.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';

class PhotoField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final VoidCallback onTap;
  final bool isRequired;

  const PhotoField({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
              InkWell(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.primaryExtraSoft),
                  child: Icon(
                    Icons.input,
                    size: 28,
                    color: AppColors.secondarySoft,
                  ),
                ),
              )
            ],
          ),
        ),
        if (value != null) Text('Photo: $value'),
      ],
    );
  }
}
