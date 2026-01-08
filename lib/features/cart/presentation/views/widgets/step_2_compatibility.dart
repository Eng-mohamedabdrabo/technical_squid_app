import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/utils/assets.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class Step2Compatibility extends StatelessWidget {
  const Step2Compatibility({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final isCompatible = state.isCompatible;
        final color = isCompatible ? Colors.green : Colors.red;
        final bgColor = isCompatible
            ? Colors.green.withValues(alpha: 0.1)
            : Colors.red.withValues(alpha: 0.1);

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: color.withValues(alpha: 0.5),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Car Image / Icon
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(Assets.service), // Placeholder
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Toyota Camry 2022',
                            style: AppStyles.textStyle16Medium.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.textDark,
                            ),
                          ),
                          Text(
                            isCompatible
                                ? S.of(context).compatible
                                : S.of(context).notCompatible,
                            style: AppStyles.textStyle14Regular.copyWith(
                              color: color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),

                      // Status Icon
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isCompatible ? Icons.check : Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // Mock change car logic
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: ColorManager.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        S.of(context).changeCar,
                        style: const TextStyle(color: ColorManager.primary),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Simulation Toggle (Hidden in prod? User asked for logic handle it "my way")
            // I'll leave it here for the user to check both states
            TextButton(
              onPressed: () => context.read<CartCubit>().toggleCompatibility(),
              child: const Text('Simulate Compatibility Toggle (Dev Only)'),
            ),
          ],
        );
      },
    );
  }
}
