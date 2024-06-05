import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding_flow/constants/gaps.dart';
import 'package:twitter_onboarding_flow/constants/sizes.dart';

class SnsButton extends StatelessWidget {
  final String brand;
  final IconData brandIcon;

  const SnsButton({
    super.key,
    required this.brand,
    required this.brandIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            brandIcon,
            size: Sizes.size28,
          ),
          Gaps.h12,
          Text(
            "Continue with $brand",
            style: const TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
