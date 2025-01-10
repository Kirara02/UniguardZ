import 'package:flutter/material.dart';
import 'package:uniguard_z/presentation/extensions/build_context_extension.dart';
import 'package:uniguard_z/presentation/misc/screen.dart';

class CustomView extends StatelessWidget {
  final Widget header;
  final Widget body;
  const CustomView({super.key, required this.header, required this.body});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Container(
      height: AppScreens.height,
      decoration: BoxDecoration(
        color: colorScheme.primary,
      ),
      child: Column(
        children: [
          header,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: body,
            ),
          )
        ],
      ),
    );
  }
}
