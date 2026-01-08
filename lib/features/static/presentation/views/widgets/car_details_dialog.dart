import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/assets.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class CarDetailsDialog extends StatelessWidget {
  final String carName;
  final String carModel;
  final String plateNumber; // e.g. "ABC 1234"
  final String color;

  const CarDetailsDialog({
    super.key,
    required this.carName,
    required this.carModel,
    this.plateNumber = 'ABC 1234', // Default/Mock for now
    this.color = 'White', // Default/Mock for now
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Header with Image
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Background Curve/Header
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorManager.primary, Color(0xFF1A1A2E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                ),
                // Close Button
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                // Car Image (Overlapping)
                Positioned(
                  top: 40,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage(Assets.service), // Placeholder/Mock
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70), // Space for the overlapping image
            // 2. Car Details Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
                children: [
                  // Name & Model
                  Text(
                    carName,
                    style: AppStyles.textStyle20SemiBold.copyWith(
                      color: ColorManager.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Model $carModel',
                    style: AppStyles.textStyle14Regular.copyWith(
                      color: ColorManager.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Info Grid (Plate & Color)
                  Row(
                    children: [
                      // Plate Number
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: ColorManager.lightBackground,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: ColorManager.border),
                          ),
                          child: Column(
                            children: [
                              Text(
                                S.of(context).plateNumber,
                                style: AppStyles.textStyle12Regular.copyWith(
                                  color: ColorManager.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                plateNumber,
                                style: AppStyles.textStyle16Medium.copyWith(
                                  color: ColorManager.textDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Color
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: ColorManager.lightBackground,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: ColorManager.border),
                          ),
                          child: Column(
                            children: [
                              Text(
                                S.of(context).carColor,
                                style: AppStyles.textStyle12Regular.copyWith(
                                  color: ColorManager.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey, // Mock color
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    color,
                                    style: AppStyles.textStyle14Regular
                                        .copyWith(color: ColorManager.textDark),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
