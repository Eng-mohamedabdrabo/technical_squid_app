import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:technical_squid_app/features/home/presentation/views/home_view.dart';

class Step4Payment extends StatelessWidget {
  const Step4Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.isOrderConfirmed) {
          Future.delayed(const Duration(seconds: 5), () {
            if (context.mounted) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ), // Assuming HomeView is imported or needs import
                (route) => false,
              );
            }
          });
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticOut,
            builder: (context, double value, child) {
              return Transform.scale(
                scale: value,
                child: Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 80,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        S.of(context).orderConfirmed,
                        style: AppStyles.textStyle24Bold.copyWith(
                          color: ColorManager.textDark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return Column(
          children: [
            // Payment Methods
            _buildMethodOption(
              context,
              PaymentMethod.cash,
              S.of(context).cashOnDelivery,
              Icons.money,
              state.paymentMethod == PaymentMethod.cash,
            ),
            const SizedBox(height: 12),
            _buildMethodOption(
              context,
              PaymentMethod.visa,
              S.of(context).visa,
              Icons.credit_card,
              state.paymentMethod == PaymentMethod.visa,
              enabled: false,
              subtitle: S.of(context).comingSoon,
            ),

            const SizedBox(height: 30),

            // User Data Preview
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorManager.lightBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mohamed Ahmed', style: AppStyles.textStyle16Medium),
                  SizedBox(height: 4),
                  Text(
                    'mohamed@example.com',
                    style: AppStyles.textStyle14Regular,
                  ),
                  SizedBox(height: 4),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      '+966 50 123 4567',
                      style: AppStyles.textStyle14Regular,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  Widget _buildMethodOption(
    BuildContext context,
    PaymentMethod method,
    String title,
    IconData icon,
    bool isSelected, {
    bool enabled = true,
    String? subtitle,
  }) {
    return GestureDetector(
      onTap: enabled
          ? () {
              context.read<CartCubit>().setPaymentMethod(method);
            }
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? ColorManager.primary
                : Colors.grey.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: ColorManager.primary.withValues(alpha: 0.1),
                    blurRadius: 8,
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: enabled
                  ? (isSelected ? ColorManager.primary : Colors.grey)
                  : Colors.grey.withValues(alpha: 0.5),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.textStyle16Medium.copyWith(
                    color: enabled ? ColorManager.textDark : Colors.grey,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: AppStyles.textStyle10Regular.copyWith(
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle, color: ColorManager.primary),
          ],
        ),
      ),
    );
  }
}
