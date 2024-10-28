import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/presentation/widgets/button/custom_button.dart';
import 'package:uniguard_z/presentation/widgets/text_field/ug_text_field.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypePasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _retypePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen(
    //   userChangePasswordProvider,
    //       (previous, next) {
    //     if (next is AsyncData && next.value != null) {
    //       context.showSnackBar("Profile updated successfully!");
    //
    //       _oldPasswordController.clear();
    //       _newPasswordController.clear();
    //       _retypePasswordController.clear();
    //
    //       ref.read(routerProvider).pop();
    //     } else if (next is AsyncError) {
    //       context.showSnackBar("${next.error}");
    //     }
    //   },
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UGTextField(
                  label: 'Old Password',
                  hintText: '******',
                  controller: _oldPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter old password';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).nextFocus(); // Move to next field
                  },
                ),
                const SizedBox(height: 20),
                UGTextField(
                  label: 'New Password',
                  hintText: '******',
                  controller: _newPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).nextFocus(); // Move to next field
                  },
                ),
                const SizedBox(height: 20),
                UGTextField(
                  label: 'Retype Password',
                  hintText: '******',
                  controller: _retypePasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter retype password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).unfocus(); // Move to next field
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  title: "Confirm",
                  fullwidth: true,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ref.read(userChangePasswordProvider.notifier).changePassword(
                      //     params: ChangePasswordParams(
                      //         currentPassword: _oldPasswordController.text,
                      //         newPassword: _newPasswordController.text));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
