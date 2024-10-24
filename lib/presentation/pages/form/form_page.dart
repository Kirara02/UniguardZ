import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/domain/entities/branch.dart';
import 'package:uniguard_z/domain/entities/form_field.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';

class FormPage extends ConsumerStatefulWidget {
  final Branch branch;
  const FormPage({super.key, required this.branch});

  @override
  ConsumerState createState() => _FormPageState();
}

class _FormPageState extends ConsumerState<FormPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final Map<int, dynamic> formValues = {}; // Map to store field values dynamically

  final Map<int, SignatureController> _signatureControllers = {}; // Map for signature controllers

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller untuk setiap field signature
    for (var field in widget.branch.formFields) {
      if (field.fieldTypeId == 5) {
        // Cek jika field adalah signature
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
        title: Text(widget.branch.name),
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
              children: widget.branch.formFields.map((field) {
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
  Widget _buildFormField(UFormField field) {
    switch (field.fieldTypeId) {
      case 6: // PickList (Dropdown)
        return _buildPickListField(field);
      case 1: // TextField (Input Text)
        return _buildTextField(field);
      case 5: // TextField (Input Signature Picture)
        return _buildSignatureField(field);
      case 4: // TextField (Input Photo)
        return _buildPhotoField(field);
      case 3: // Checkbox (True/False)
        return _buildSwitchField(field);
      default:
        return const SizedBox.shrink(); // If no valid fieldTypeId, return empty
    }
  }

  // Dropdown for PickList fields
  Widget _buildPickListField(UFormField field) {
    // Check if formPickList exists and is not empty
    final pickList = field.formPickList?.isNotEmpty == true ? field.formPickList!.first : null;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.primaryExtraSoft, width: 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (field.isRequire) const Text("* "),
              Text(field.name, style: Typogaphy.Medium),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(color: AppColors.dark),
            child: DropdownSearch<int>(
              popupProps: const PopupProps.menu(
                showSearchBox: false,
                constraints: BoxConstraints(),
                showSelectedItems: true,
                fit: FlexFit.loose,
              ),
              items: pickList!.formPickListOptions.map((option) => option.id).toList(),
              itemAsString: (int? id) => pickList.formPickListOptions.firstWhere((option) => option.id == id).name,
              compareFn: (int? item, int? selectedItem) => item == selectedItem,
              onChanged: (value) {
                setState(() {
                  formValues[field.id] = value;
                });
              },
              selectedItem: formValues[field.id],
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  fillColor: AppColors.dark,
                  hintText: "Select",
                  hintStyle: Typogaphy.Regular.copyWith(fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
              validator: (value) {
                if (field.isRequire && value == null) {
                  return 'Field ${field.name} is required';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  // TextField for input text
  Widget _buildTextField(UFormField field) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.primaryExtraSoft, width: 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: formValues[field.id],
            onChanged: (value) {
              setState(() {
                formValues[field.id] = value;
              });
            },
            maxLines: 3,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              hintText: (field.isRequire) ? "* ${field.name}" : field.name,
              hintStyle: Typogaphy.Regular.copyWith(fontSize: 14),
              border: InputBorder.none,
            ),
            validator: (value) {
              if (field.isRequire && (value == null || value.isEmpty)) {
                return 'Field ${field.name} is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  // Signature field using the 'signature' package
  Widget _buildSignatureField(UFormField field) {
    // Dapatkan controller berdasarkan field.id
    final signatureController = _signatureControllers[field.id]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primarySoft,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.primaryExtraSoft, width: 4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (field.isRequire) const Text("* "),
                  Text(field.name, style: Typogaphy.Medium),
                ],
              ),
              InkWell(
                onTap: () {
                  _showSignatureDialog(field, signatureController);
                },
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

  // Photo field (mockup as text)
  Widget _buildPhotoField(UFormField field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primarySoft,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.primaryExtraSoft, width: 4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (field.isRequire) const Text("* "),
                  Text(field.name, style: Typogaphy.Medium),
                ],
              ),
              InkWell(
                onTap: () {
                  _showImageSourceDialog(field);
                },
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
        if (formValues[field.id] != null) Text('Photo: ${formValues[field.id]}'),
      ],
    );
  }

  // Checkbox for true/false input
  Widget _buildSwitchField(UFormField field) {
    formValues[field.id] ??= false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.primarySoft,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.primaryExtraSoft, width: 4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (field.isRequire) const Text("* "),
                  Text(field.name, style: Typogaphy.Medium),
                ],
              ),
              Switch.adaptive(
                value: formValues[field.id] ?? false,
                onChanged: (value) {
                  setState(() {
                    formValues[field.id] = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Fungsi untuk mengambil foto
  Future<void> _pickImage(UFormField field, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        formValues[field.id] = pickedFile.path; // Simpan path dari foto yang dipilih
      });
    }
  }

  // Menambahkan validasi saat submit
  void _showFormValues() {
    if (_key.currentState?.validate() ?? false) {
      // Validasi tambahan untuk foto
      for (var field in widget.branch.formFields) {
        if (field.fieldTypeId == 4 && field.isRequire && formValues[field.id] == null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Field ${field.name} is required'),
          ));
          return;
        }
      }

      // Validasi untuk signature
      for (var field in widget.branch.formFields) {
        if (field.fieldTypeId == 5 && field.isRequire && formValues[field.id] == null) {
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
  void _showSignatureDialog(UFormField field, SignatureController signatureController) {
    bool _isSignatureSaved = signatureController.isNotEmpty;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Signature Dialog",
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      },
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation1, animation2, child) {
        final curvedAnimation = CurvedAnimation(parent: animation1, curve: Curves.easeInOut);

        return ScaleTransition(
          scale: curvedAnimation,
          child: Dialog(
            backgroundColor: AppColors.primarySoft,
            insetPadding: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Signature",
                    style: Typogaphy.SemiBold,
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
                            setState(() {
                              formValues[field.id] = null;
                            });
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
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
                              setState(() {
                                formValues[field.id] = signature;
                                _isSignatureSaved = true;
                              });
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
          ),
        );
      },
    ).then((value) {
      if (!_isSignatureSaved && signatureController.isEmpty) {
        setState(() {
          formValues[field.id] = null;
          signatureController.clear();
        });
      }
    });
  }

  void _showImageSourceDialog(UFormField field) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.photo_camera, size: 40),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _pickImage(field, ImageSource.camera); // Mengambil foto dari kamera
                    },
                  ),
                  const Text("Camera"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.photo_library, size: 40),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _pickImage(field, ImageSource.gallery);
                    },
                  ),
                  const Text("Gallery"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
