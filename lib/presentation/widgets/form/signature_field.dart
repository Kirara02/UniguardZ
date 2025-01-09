import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';

class SignatureField extends StatelessWidget {
  final String label;
  final SignatureController signatureController;
  final VoidCallback onTap;
  final bool isRequired;

  const SignatureField(
      {super.key,
      required this.label,
      required this.signatureController,
      required this.onTap,
      this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
      ],
    );
  }
}
