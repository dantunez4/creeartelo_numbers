import 'package:flutter/material.dart';

class TypeImage extends StatelessWidget {
  final String image;
  const TypeImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Image(
      image: AssetImage(image),
      width: double.infinity,
      height: size.height * 0.33,
      fit: BoxFit.cover,
    );
  }
}
