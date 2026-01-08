import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // BackButton removed to be placed in parent view
        // const SizedBox(height: 24), // Adjust spacing as needed in parent
        const SizedBox(height: 24),
        Text(
          title,
          style: AppStyles.textStyle24Bold.copyWith(
            color: ColorManager.primary,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager
                .textSecondary, // Changed from textLight (White) to textSecondary (Dark Grey)
          ),
        ),
      ],
    );
  }
}
