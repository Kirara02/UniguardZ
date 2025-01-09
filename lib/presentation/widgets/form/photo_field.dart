import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/widgets/dialog/source_image_dialog.dart';

class PhotoField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final VoidCallback onTap;
  final bool isRequired;

  const PhotoField({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primarySoft,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primaryExtraSoft, width: 4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (isRequired) const Text("* "),
                  Text(label, style: Typogaphy.Medium),
                ],
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
        if (value != null) Text('Photo: $value'),
      ],
    );
  }
}

class PhotoField2 extends StatefulWidget {
  final String label;
  final String? value;
  final Function(String?) onImagePicked;
  final bool isRequired;

  const PhotoField2({
    super.key,
    required this.label,
    this.value,
    required this.onImagePicked,
    this.isRequired = false,
  });

  @override
  State<PhotoField2> createState() => _PhotoField2State();
}

class _PhotoField2State extends State<PhotoField2> {
  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null && mounted) {
      // Crop the image
      final croppedFile = await _cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        // Compress the image
        final compressedFile = await _compressImage(croppedFile);
        if (compressedFile != null) {
          widget.onImagePicked(compressedFile.path);
        } else {
          widget.onImagePicked(null); // Compression failed
        }
      } else {
        widget.onImagePicked(null); // Cropping canceled
      }
    } else if (mounted) {
      widget.onImagePicked(null); // No image picked
    }
  }

  Future<CroppedFile?> _cropImage(File imageFile) async {
    return await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      maxWidth: 800,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
          // toolbarTitle: 'Crop Image',
          toolbarColor: AppColors.primarySoft,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          hideBottomControls: true,
        ),
        IOSUiSettings(
            // title: 'Crop Image',
            ),
      ],
    );
  }

  Future<File?> _compressImage(CroppedFile croppedFile) async {
    final result = await FlutterImageCompress.compressWithFile(
      croppedFile.path,
      minWidth: 800,
      minHeight: 600,
      quality: 75,
      rotate: 0,
      format: CompressFormat.jpeg,
    );

    if (result != null) {
      return File(croppedFile.path)..writeAsBytesSync(result);
    }
    return null;
  }

  void _showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ImageSourceDialog(
          onImageSourceSelected: (ImageSource source) {
            _pickImage(context, source); // Pilih gambar berdasarkan sumber
          },
        );
      },
    );
  }

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
                      if (widget.isRequired)
                        const TextSpan(
                          text: "* ",
                          style: TextStyle(color: Colors.red),
                        ),
                      TextSpan(
                        text: widget.label,
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
                onTap: () => _showImageSourceDialog(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: AppColors.primaryExtraSoft),
                  child: Icon(
                    Icons.camera_alt,
                    size: 28,
                    color: AppColors.secondarySoft,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.value != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Selected Photo: ${widget.value}',
              style: textTheme.labelMedium!.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
          ),
      ],
    );
  }
}
