import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/features/cart/data/models/cart_item_model.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class Step3Review extends StatelessWidget {
  const Step3Review({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            ...state.items.map((item) => _buildReviewItem(context, item)),
          ],
        );
      },
    );
  }

  Widget _buildReviewItem(BuildContext context, CartItemModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorManager.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: AppStyles.textStyle16Medium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${S.of(context).quantity}: ${item.quantity}',
                style: AppStyles.textStyle12Regular.copyWith(
                  color: ColorManager.textSecondary,
                ),
              ),
            ],
          ),
          Text(
            '${item.totalPrice} ${S.of(context).sar}',
            style: AppStyles.textStyle14Regular.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
    );
  }
}
