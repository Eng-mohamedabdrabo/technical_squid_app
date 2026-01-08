import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
    required this.name,
    required this.isSelected,
    this.onTap,
  });

  final String name;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.primary : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? ColorManager.primary : ColorManager.border,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: ColorManager.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        transform: Matrix4.identity()
          ..setEntry(0, 0, isSelected ? 1.05 : 1.0)
          ..setEntry(1, 1, isSelected ? 1.05 : 1.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.directions_car, // Placeholder icon
              color: isSelected ? Colors.white : ColorManager.textDark,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: AppStyles.textStyle16Medium.copyWith(
                color: isSelected ? Colors.white : ColorManager.textDark,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
