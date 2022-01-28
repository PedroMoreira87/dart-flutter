import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  String? image;

  ImageButton(this.image);

  @override
  Widget build(BuildContext context) {
    print(image);
    return IconButton(
      icon: Image.network(image!),
      iconSize: 50,
      onPressed: () {},
    );
  }
}
