import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceDialog extends StatelessWidget {
  final Function(ImageSource) onImageSourceSelected;

  const ImageSourceDialog({
    super.key,
    required this.onImageSourceSelected,
  });

  @override
  Widget build(BuildContext context) {
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
                  onImageSourceSelected(ImageSource.camera); // Trigger callback for camera
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
                  onImageSourceSelected(ImageSource.gallery); // Trigger callback for gallery
                },
              ),
              const Text("Gallery"),
            ],
          ),
        ],
      ),
    );
  }
}
