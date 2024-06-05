import 'package:flutter/material.dart';
import 'package:twitter_onboarding_flow/constants/sizes.dart';

class ColorButton extends StatelessWidget {
  final Color color;
  final String text;

  const ColorButton({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: Sizes.size20,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
