import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';

class StaticHeader extends StatelessWidget {
  const StaticHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              context.pop();
            } else {
              context.go(AppRouter.kHomeView);
            }
          },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.arrow_back, color: ColorManager.primary),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: AppStyles.textStyle24Bold.copyWith(
            color: ColorManager.primary,
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
