import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.hight,
      this.width,
      required this.label,
      this.textColor,
      required this.function,
      this.widget,
      this.borderRadius,
      this.buttonColor});
  final double? hight;
  final double? width;
  final double? borderRadius;
  final String label;
  final Color? textColor;
  final Color? buttonColor;

  final VoidCallback function;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        height: hight ?? 30,
        width: width ?? 50,
        decoration: BoxDecoration(
            color: buttonColor ?? Colors.amber,
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        child: widget ??
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
      ),
    );
  }
}
