import 'package:flutter/material.dart';

class DetailBox extends StatelessWidget {
  const DetailBox(
      {super.key, required this.label, this.body, this.height, this.width});

  final String label;
  final String? body;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(label,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Text(
            body ?? '',
            maxLines: 4,
          )
        ],
      ),
    );
  }
}
