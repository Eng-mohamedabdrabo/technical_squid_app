import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:technical_squid_app/features/home/presentation/views/widgets/brand_item.dart';
import 'package:technical_squid_app/features/home/presentation/views/widgets/service_item.dart';
import 'package:technical_squid_app/features/home/presentation/views/widgets/service_details_bottom_sheet.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1) Select Car Brand (Horizontal List)
                Text(
                  S.of(context).selectCarBrand,
                  style: AppStyles.textStyle20SemiBold.copyWith(
                    color: ColorManager.textDark,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final brands = [
                            'Toyota',
                            'BMW',
                            'Mercedes',
                            'Honda',
                            'Ford',
                          ]; // Mock
                          return Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: BrandItem(
                              isSelected:
                                  context.read<HomeCubit>().activeIndex ==
                                  index, // reusing activeIndex for Brand for now
                              name: brands[index],
                              onTap: () {
                                context.read<HomeCubit>().changeModelIndex(
                                  index,
                                );
                                context.read<HomeCubit>().changeBrand(
                                  brands[index],
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // 2) Select Car Model (Horizontal List - below Brand)
                Text(
                  S.of(context).selectCarModel,
                  style: AppStyles.textStyle20SemiBold.copyWith(
                    color: ColorManager.textDark,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      // Mock models based on selection? For now just static list
                      final models = [
                        'Camry',
                        'Corolla',
                        'Yaris',
                        'Land Cruiser',
                        'Avalon',
                      ];
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: BrandItem(
                              isSelected:
                                  context.read<HomeCubit>().selectedModel ==
                                  models[index], // New state check
                              name: models[index],
                              onTap: () {
                                context.read<HomeCubit>().changeModel(
                                  models[index],
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // 3) Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(
                          alpha: 0.05,
                        ), // Corrected from .withValues(alpha: 0.05)
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: S.of(context).searchPlaceholder,
                      hintStyle: const TextStyle(
                        color: ColorManager.textSecondary,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: ColorManager.primary,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 4) Dropdowns Row (Year & Service Type)
                Row(
                  children: [
                    // Year Dropdown
                    Expanded(
                      child: _CustomDropdown(
                        hint: S.of(context).modelYear,
                        items: const ['2020', '2021', '2022', '2023', '2024'],
                        onChanged: (val) {
                          context.read<HomeCubit>().changeYear(val);
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Service Type Dropdown
                    Expanded(
                      child: _CustomDropdown(
                        hint: S.of(context).serviceType,
                        items: [
                          S.of(context).oilFilter,
                          S.of(context).brakePads,
                          S.of(context).battery,
                        ],
                        onChanged: (val) {
                          context.read<HomeCubit>().changeServiceType(val);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 5) Our Services Title
                Text(
                  S.of(context).ourServices,
                  style: AppStyles.textStyle20SemiBold.copyWith(
                    color: ColorManager.textDark,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),

        // Service Grid
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75, // Taller aspect ratio to prevent overflow
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => ServiceDetailsBottomSheet(
                      serviceName: '${S.of(context).addService} ${index + 1}',
                      price: '${(index + 1) * 100}',
                    ),
                  );
                },
                child: ServiceItem(
                  serviceName:
                      '${S.of(context).addService} ${index + 1}', // Mock name
                  price: '${(index + 1) * 100}',
                ),
              );
            }, childCount: 6),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}

class _CustomDropdown extends StatefulWidget {
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _CustomDropdown({
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  State<_CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<_CustomDropdown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      offset: const Offset(0, 8), // Small gap
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      onSelected: (String? value) {
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged(value);
      },
      itemBuilder: (BuildContext context) {
        return widget.items.map((String value) {
          return PopupMenuItem<String>(
            value: value,
            child: Text(value, style: AppStyles.textStyle14Medium),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorManager.border.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                _selectedValue ?? widget.hint,
                style: _selectedValue == null
                    ? AppStyles.textStyle14Regular.copyWith(
                        color: ColorManager.textSecondary,
                      )
                    : AppStyles.textStyle14Medium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: ColorManager.primary),
          ],
        ),
      ),
    );
  }
}
