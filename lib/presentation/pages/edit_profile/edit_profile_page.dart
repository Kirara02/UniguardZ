import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/presentation/extensions/build_context_extension.dart';
import 'package:uniguard_z/presentation/providers/user_data/user_data_provider.dart';
import 'package:uniguard_z/presentation/widgets/text_field/ug_text_field.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  bool _isEditMode = false;

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
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData && next.value != null) {
          context.showSnackBar("Profile updated successfully!");

          setState(() {
            _isEditMode = false;
          });

          final updatedUser = next.value;
          if (updatedUser != null) {
            _nameController.text = updatedUser.name;
            _emailController.text = updatedUser.email;
          }
        } else if (next is AsyncError) {
          context.showSnackBar("Failed to update profile: ${next.error}");
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        actions: [
          // Toggle Edit Mode Button
          IconButton(
            icon: Icon(_isEditMode ? Icons.save : Icons.edit),
            onPressed: () {
              if (_isEditMode) {
                if (_formKey.currentState!.validate()) {
                  final currentUser = ref.read(userDataProvider).valueOrNull;

                  if (currentUser != null &&
                      (currentUser.name != _nameController.text || currentUser.email != _emailController.text)) {
                    // ref.read(userDataProvider.notifier).editProfile(
                    //   params: EditProfileParams(
                    //     name: _nameController.text,
                    //     phone: _phoneController.text,
                    //     email: _emailController.text,
                    //   ),
                    // );
                  } else {
                    context.showSnackBar("No changes to save.");
                  }
                }
              }

              // Toggle between edit and view mode
              setState(() {
                _isEditMode = !_isEditMode;
              });
            },
          ),
        ],
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
                  readOnly: !_isEditMode,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (_isEditMode && (value == null || value.isEmpty)) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                UGTextField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  readOnly: !_isEditMode,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (_isEditMode && (value == null || value.isEmpty)) {
                      return 'Please enter your email';
                    }
                    if (_isEditMode && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
