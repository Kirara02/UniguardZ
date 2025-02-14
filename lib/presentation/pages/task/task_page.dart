import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/domain/entities/task.dart';
import 'package:uniguard_z/domain/entities/task_field.dart';
import 'package:uniguard_z/presentation/widgets/dialog/signature_dialog.dart';
import 'package:uniguard_z/presentation/widgets/dialog/source_image_dialog.dart';
import 'package:uniguard_z/presentation/widgets/form/photo_field.dart';
import 'package:uniguard_z/presentation/widgets/form/signature_field.dart';
import 'package:uniguard_z/presentation/widgets/form/switch_field.dart';
import 'package:uniguard_z/presentation/widgets/form/text_field.dart';

class TaskPage extends ConsumerStatefulWidget {
  final Task task;
  const TaskPage({super.key, required this.task});

  @override
  ConsumerState<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends ConsumerState<TaskPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final Map<int, dynamic> formValues = {};

  final Map<int, SignatureController> _signatureControllers = {};

  @override
  void initState() {
    super.initState();
    for (var field in widget.task.taskFields) {
      if (field.fieldTypeId == 5) {
        _signatureControllers[field.id] = SignatureController(
          penStrokeWidth: 5,
          penColor: Colors.lightGreen,
          exportBackgroundColor: Colors.white,
        );
      }
    }
  }

  @override
  void dispose() {
    // Dispose semua controller signature
    for (var controller in _signatureControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task.name),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ElevatedButton(
            onPressed: _showFormValues,
            child: const Text("Submit"),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.task.taskFields.map((field) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _buildFormField(field),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  // Widget to build form field based on fieldTypeId
  Widget _buildFormField(TaskField field) {
    switch (field.fieldTypeId) {
      case 1: // TextField (Input Text)
        return _buildTextField(field);
      case 5: // TextField (Input Signature Picture)
        return _buildSignatureField(field);
      case 4: // TextField (Input Photo)
        return _buildPhotoField(field);
      case 3: // Checkbox (True/False)
        return _buildSwitchField(field);
      default:
        return const SizedBox.shrink();
    }
  }

  // TextField for input text
  Widget _buildTextField(TaskField field) {
    return CustomTextField(
      label: field.name,
      value: formValues[field.id],
      onChanged: (value) {
        setState(() {
          formValues[field.id] = value;
        });
      },
    );
  }

  // Signature field using the 'signature' package
  Widget _buildSignatureField(TaskField field) {
    final signatureController = _signatureControllers[field.id]!;

    return SignatureField(
      label: field.name,
      signatureController: signatureController,
      onTap: () {
        _showSignatureDialog(field, signatureController);
      },
    );
  }

  // Photo field (mockup as text)
  Widget _buildPhotoField(TaskField field) {
    // return PhotoField<String>(
    //   label: field.name,
    //   value: formValues[field.id],
    //   onTap: () {
    //     _showImageSourceDialog(field);
    //   },
    // );
    return PhotoField2(
      label: field.name,
      value: formValues[field.id],
      onImagePicked: (imagePath) {
        setState(() {
          formValues[field.id] = imagePath;
        });
      },
    );
  }

  // Checkbox for true/false input
  Widget _buildSwitchField(TaskField field) {
    formValues[field.id] ??= false;
    return SwitchField(
      label: field.name,
      value: formValues[field.id],
      onChanged: (value) {
        setState(() {
          formValues[field.id] = value;
        });
      },
    );
  }

  // Fungsi untuk mengambil foto
  Future<void> _pickImage(TaskField field, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        formValues[field.id] =
            pickedFile.path; // Simpan path dari foto yang dipilih
      });
    }
  }

  // Menambahkan validasi saat submit
  void _showFormValues() {
    if (_key.currentState?.validate() ?? false) {
      // Validasi tambahan untuk foto
      for (var field in widget.task.taskFields) {
        if (field.fieldTypeId == 4 && formValues[field.id] == null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Field ${field.name} is required'),
          ));
          return;
        }
      }

      // Validasi untuk signature
      for (var field in widget.task.taskFields) {
        if (field.fieldTypeId == 5 && formValues[field.id] == null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Field ${field.name} is required'),
          ));
          return;
        }
      }

      // Jika semua validasi lulus, tampilkan nilai
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Form Values'),
            content: SingleChildScrollView(
              child: ListBody(
                children: formValues.entries.map((entry) {
                  return Text('Field ID: ${entry.key}, Value: ${entry.value}');
                }).toList(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Method to show signature dialog
  void _showSignatureDialog(
      TaskField field, SignatureController signatureController) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Signature Dialog",
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      },
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation1, animation2, child) {
        final curvedAnimation =
            CurvedAnimation(parent: animation1, curve: Curves.easeInOut);

        return ScaleTransition(
          scale: curvedAnimation,
          child: SignatureDialog<Uint8List>(
            title: "Signature",
            signatureController: signatureController,
            onSave: (signature) {
              if (signature != null) {
                setState(() {
                  formValues[field.id] = signature;
                });
              }
            },
            onCancel: () {
              setState(() {
                formValues[field.id] = null;
              });
            },
          ),
        );
      },
    ).then((value) {
      if (signatureController.isEmpty) {
        setState(() {
          formValues[field.id] = null;
          signatureController.clear();
        });
      }
    });
  }

  void _showImageSourceDialog(TaskField field) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ImageSourceDialog(
          onImageSourceSelected: (ImageSource source) {
            _pickImage(field, source);
          },
        );
      },
    );
  }
}
