import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/widgets/custom_button.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:technical_squid_app/features/home/presentation/manager/service_details_cubit/service_details_cubit.dart';

class ServiceDetailsBottomSheet extends StatelessWidget {
  final String serviceName;
  final String price;

  const ServiceDetailsBottomSheet({
    super.key,
    required this.serviceName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceDetailsCubit(basePrice: price),
      child: DraggableScrollableSheet(
        initialChildSize: 0.7, // Start at 70% height
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                // 1) Dark Header
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  decoration: const BoxDecoration(
                    color: ColorManager.primary, // Dark background
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Handle bar
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      BlocBuilder<ServiceDetailsCubit, ServiceDetailsState>(
                        builder: (context, state) {
                          int totalPrice = 0;
                          if (state is ServiceDetailsPartsUpdated) {
                            totalPrice = state.totalPrice;
                          } else {
                            // Initial state
                            totalPrice = int.tryParse(price) ?? 0;
                          }

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  serviceName,
                                  style: AppStyles.textStyle20SemiBold.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorManager.accent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '$totalPrice ${S.of(context).sar}',
                                  style: AppStyles.textStyle18SemiBold.copyWith(
                                    color: ColorManager.textDark,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // 2) Scrollable Content
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(24.0),
                    children: [
                      // Spare Parts Section
                      Text(
                        S.of(context).spareParts,
                        style: AppStyles.textStyle18SemiBold.copyWith(
                          color: ColorManager.textDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        S.of(context).sparePartsDesc,
                        style: AppStyles.textStyle14Regular.copyWith(
                          color: ColorManager.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Dynamic Checkbox List
                      BlocBuilder<ServiceDetailsCubit, ServiceDetailsState>(
                        builder: (context, state) {
                          final cubit = context.read<ServiceDetailsCubit>();
                          return Column(
                            children: List.generate(cubit.spareParts.length, (
                              index,
                            ) {
                              final part = cubit.spareParts[index];
                              String name = '';
                              if (part['key'] == 'battery') {
                                name = S.of(context).battery;
                              }
                              if (part['key'] == 'oilFilter') {
                                name = S.of(context).oilFilter;
                              }
                              if (part['key'] == 'brakePads') {
                                name = S.of(context).brakePads;
                              }

                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: ColorManager.lightBackground,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: part['selected']
                                        ? ColorManager.primary
                                        : ColorManager.border,
                                  ),
                                ),
                                child: CheckboxListTile(
                                  value: part['selected'],
                                  activeColor: ColorManager.primary,
                                  title: Text(
                                    name,
                                    style: AppStyles.textStyle16Medium.copyWith(
                                      color: ColorManager.textDark,
                                      fontWeight: part['selected']
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  secondary: Text(
                                    '${part['price']} ${S.of(context).sar}',
                                    style: AppStyles.textStyle14Regular
                                        .copyWith(
                                          color: ColorManager.accent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  onChanged: (val) {
                                    cubit.togglePartSelection(
                                      index,
                                      val ?? false,
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 4,
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      const SizedBox(height: 24),

                      // Problem Description Section
                      Text(
                        S.of(context).problemDescription,
                        style: AppStyles.textStyle18SemiBold.copyWith(
                          color: ColorManager.textDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        maxLines: 4,
                        style: AppStyles.textStyle16Medium.copyWith(
                          color: ColorManager.textDark,
                        ),
                        decoration: InputDecoration(
                          hintText: S.of(context).problemDescriptionHint,
                          hintStyle: const TextStyle(
                            color: ColorManager.textSecondary,
                          ),
                          filled: true,
                          fillColor: ColorManager.lightBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: ColorManager.border,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: ColorManager.border,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: ColorManager.primary,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Add Button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child:
                            BlocBuilder<
                              ServiceDetailsCubit,
                              ServiceDetailsState
                            >(
                              builder: (context, state) {
                                return CustomButton(
                                  text: S.of(context).addService,
                                  onPressed: () {
                                    int total = 0;
                                    if (state is ServiceDetailsPartsUpdated) {
                                      total = state.totalPrice;
                                    } else {
                                      total = int.tryParse(price) ?? 0;
                                    }

                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${S.of(context).addService}: $serviceName (Total: $total)',
                                        ),
                                        backgroundColor: ColorManager.primary,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
