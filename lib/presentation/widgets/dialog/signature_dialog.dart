import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';

class SignatureDialog<T> extends StatelessWidget {
  final String title;
  final SignatureController signatureController;
  final Function(T?) onSave;
  final Function onCancel;
  final bool isRequired;

  const SignatureDialog({
    super.key,
    required this.title,
    required this.signatureController,
    required this.onSave,
    required this.onCancel,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isSignatureSaved = signatureController.isNotEmpty;

    return Dialog(
      backgroundColor: AppColors.primarySoft,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Typogaphy.Medium.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: Signature(
                controller: signatureController,
                backgroundColor: AppColors.dark,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.dark,
                    ),
                    onPressed: () {
                      signatureController.clear();
                      onCancel(); // Handle cancel action
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (signatureController.isNotEmpty) {
                        final signature = await signatureController.toPngBytes();
                        onSave(signature as T?);
                        isSignatureSaved = true;
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
