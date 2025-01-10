import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniguard_z/presentation/extensions/build_context_extension.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';
import 'package:uniguard_z/presentation/widgets/button/custom_button.dart';
import 'package:uniguard_z/presentation/widgets/text_field/ug_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.colorScheme.surface,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/uniguard_icon.png",
                              width: 60,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "UNIGUARD",
                              style: context.textTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      UGTextField(
                        controller: _emailController,
                        label: AppLocalizations.of(context)!.email,
                        hintText: "user@mail.com",
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // const emailPattern =
                          //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                          // final regExp = RegExp(emailPattern);
                          // if (!regExp.hasMatch(value)) {
                          //   return 'Please enter a valid email address';
                          // }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        fullwidth: true,
                        title: AppLocalizations.of(context)!.submit,
                        onPressed: () async {
                          context.hideKeyboard();
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),
                      const Divider(height: 50),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 28,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(routerProvider).pop();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  AppLocalizations.of(context)!.forgot_password,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
