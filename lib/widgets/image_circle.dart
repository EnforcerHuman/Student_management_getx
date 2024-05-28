import 'dart:io';
import 'package:flutter/material.dart';

class ImageCircle extends StatelessWidget {
  final Function onImagePicked;
  final File? imagepath;
  const ImageCircle(
      {super.key, required this.onImagePicked, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: imagepath != null ? FileImage(imagepath!) : null,
          child: imagepath == null ? Icon(Icons.add_a_photo) : null,
          radius: 60,
          backgroundColor: Colors.red,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.transparent,
                width: 2,
              ),
            ),
            child: IconButton(
              onPressed: () {
                onImagePicked();
              },
              icon: const Icon(Icons.add),
              iconSize: 20,
              color: Colors.red,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}
