import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class CustomCartProgressBar extends StatelessWidget {
  final int currentStep;

  const CustomCartProgressBar({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStep(context, 0, S.of(context).step1),
          _buildLine(0),
          _buildStep(context, 1, S.of(context).step2),
          _buildLine(1),
          _buildStep(context, 2, S.of(context).step3),
          _buildLine(2),
          _buildStep(context, 3, S.of(context).step4),
        ],
      ),
    );
  }

  Widget _buildStep(BuildContext context, int stepIndex, String title) {
    final isActive = currentStep >= stepIndex;
    final isCurrent = currentStep == stepIndex;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isActive
                ? const LinearGradient(
                    colors: [
                      ColorManager.accent,
                      Color(0xFFF2D59B),
                    ], // Golden from ColorManager
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: isActive ? null : Colors.grey[300],
            boxShadow: isCurrent
                ? [
                    BoxShadow(
                      color: ColorManager.accent.withValues(alpha: 0.4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: isActive
                ? const Icon(Icons.check, color: Colors.white, size: 24)
                : Text(
                    '${stepIndex + 1}',
                    style: AppStyles.textStyle16Medium.copyWith(
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppStyles.textStyle12Regular.copyWith(
            color: isActive ? ColorManager.primary : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildLine(int index) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 20),
        color: currentStep > index ? ColorManager.primary : Colors.grey[300],
      ),
    );
  }
}
