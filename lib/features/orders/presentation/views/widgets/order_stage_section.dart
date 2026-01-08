import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';

class OrderStageSection extends StatelessWidget {
  final String title;
  const OrderStageSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ColorManager.shadow.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 24,
                decoration: BoxDecoration(
                  color: ColorManager.accent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: AppStyles.textStyle16Medium.copyWith(
                  color: ColorManager.textDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: 3, // Mock images
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: ColorManager.lightBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: ColorManager.border),
                ),
                child: Center(
                  child: Icon(
                    Icons.image_outlined,
                    color: ColorManager.textSecondary.withValues(alpha: 0.5),
                    size: 32,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
