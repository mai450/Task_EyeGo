import 'package:flutter/material.dart';

class ImageShadow extends StatelessWidget {
  const ImageShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black26,
              Colors.black26,
            ],
          ),
        ),
      ),
    );
  }
}
