import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniguard_z/presentation/misc/screen.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';
import 'package:uniguard_z/presentation/providers/user_data/user_data_provider.dart';
import 'package:uniguard_z/presentation/widgets/common/custom_view.dart';
import 'package:uniguard_z/presentation/widgets/text_field/ug_text_field.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = ref.read(userDataProvider).valueOrNull?.name ?? "";
    _emailController.text = ref.read(userDataProvider).valueOrNull?.email ?? "";
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomView(
        header: Container(
          height: AppScreens.height * 0.1,
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => ref.read(routerProvider).pop(),
                icon: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Settings",
                style: Typogaphy.Medium.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              )
            ],
          ),
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
                    label: 'Name',
                    hintText: 'Enter your name',
                    controller: _nameController,
                    readOnly: true,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 20),
                  UGTextField(
                    label: 'Email',
                    hintText: 'Enter your email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    readOnly: true,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
