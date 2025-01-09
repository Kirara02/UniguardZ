import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uniguard_z/domain/entities/activity.dart';
import 'package:uniguard_z/presentation/widgets/dialog/source_image_dialog.dart';
import 'package:uniguard_z/presentation/widgets/form/photo_field.dart';
import 'package:uniguard_z/presentation/widgets/form/text_field.dart';

class ActivityPage extends ConsumerStatefulWidget {
  final Activity activity;
  const ActivityPage({super.key, required this.activity});

  @override
  ConsumerState<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends ConsumerState<ActivityPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? commentValue;
  String? photoPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.activity.name),
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
              children: [
                if (widget.activity.comments == "1")
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: CustomTextField(
                      label: "Comments",
                      value: commentValue,
                      maxLines: 1,
                      onChanged: (value) {
                        setState(() {
                          commentValue = value;
                        });
                      },
                    ),
                  ),
                if (widget.activity.isPhoto == true)
                  // PhotoField<String>(
                  //   label: "Photo",
                  //   value: photoPath,
                  //   onTap: () {
                  //     _showImageSourceDialog();
                  //   },
                  // ),
                  PhotoField2(
                    label: "Photo",
                    value: photoPath,
                    onImagePicked: (imagePath) {
                      setState(() {
                        photoPath = imagePath;
                      });
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  void _showFormValues() {
    if (_key.currentState?.validate() ?? false) {
      // Jika semua validasi lulus, tampilkan nilai
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Form Values'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Comments: $commentValue"),
                  Text("Photo path: $photoPath"),
                ],
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

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        photoPath = pickedFile.path;
      });
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ImageSourceDialog(
          onImageSourceSelected: (ImageSource source) {
            _pickImage(source);
          },
        );
      },
    );
  }
}
