
import 'package:flutter/material.dart';

class CardMovie extends StatelessWidget {
  final String imageUrl;

  const CardMovie({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          width: 150,
          height: 220,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
