import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class AuthMethodSelector extends StatelessWidget {
  const AuthMethodSelector({
    super.key,
    required this.isEmail,
    required this.onEmailTap,
    required this.onPhoneTap,
  });

  final bool isEmail;
  final VoidCallback onEmailTap;
  final VoidCallback onPhoneTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white, // White background for the whole pill container
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorManager.border,
        ), // Optional border for definition
      ),
      child: Row(
        children: [
          Expanded(
            child: _SelectionButton(
              title: S.of(context).email,
              isSelected: isEmail,
              onTap: onEmailTap,
            ),
          ),
          Expanded(
            child: _SelectionButton(
              title: S.of(context).phoneNumber,
              isSelected: !isEmail,
              onTap: onPhoneTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectionButton extends StatelessWidget {
  const _SelectionButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          // Active: Primary (Purple-ish), Inactive: Transparent
          color: isSelected ? ColorManager.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: isSelected
              ? AppStyles.textStyle16Medium.copyWith(
                  color: Colors.white, // Active => Light Text on Dark BG
                  fontWeight: FontWeight.bold,
                )
              : AppStyles.textStyle16Medium.copyWith(
                  color: ColorManager
                      .textDark, // Inactive => Dark Text on Light BG
                ),
        ),
      ),
    );
  }
}
