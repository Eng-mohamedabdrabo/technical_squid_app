import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.onMenuPressed,
    this.showMenuIcon = true,
  });

  final VoidCallback onMenuPressed;
  final bool showMenuIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Side Menu Icon
          if (showMenuIcon)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: SizedBox(
                width: 44,
                height: 44,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: ColorManager.primary,
                  ),
                  onPressed: onMenuPressed,
                ),
              ),
            )
          else
            const SizedBox(width: 44),

          // Center: Page Title
          Text(
            S.of(context).homeTitle,
            style: AppStyles.textStyle24Bold.copyWith(
              color: ColorManager.primary,
            ),
          ),

          // Right: Cart Icon
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SizedBox(
              width: 44,
              height: 44,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorManager.primary,
                ),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kCartView);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
