import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';
import 'package:technical_squid_app/features/static/presentation/manager/subscription_cubit/subscription_cubit.dart';
import 'package:technical_squid_app/features/static/presentation/views/widgets/static_header.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class CompanySubscriptionView extends StatefulWidget {
  const CompanySubscriptionView({super.key});

  @override
  State<CompanySubscriptionView> createState() =>
      _CompanySubscriptionViewState();
}

class _CompanySubscriptionViewState extends State<CompanySubscriptionView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubscriptionCubit(),
      child: Scaffold(
        backgroundColor: ColorManager.lightBackground,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isTablet = constraints.maxWidth > 600;
              return Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: isTablet ? 800 : double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Builder(
                      builder: (context) {
                        final cubit = context.read<SubscriptionCubit>();

                        return Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              StaticHeader(
                                title: S.of(context).companySubscriptionTitle,
                              ),
                              const SizedBox(height: 32),
                              _StaticTextField(
                                label: S.of(context).companyName,
                                icon: Icons.business,
                              ),
                              const SizedBox(height: 16),
                              _StaticTextField(
                                label: S.of(context).responsiblePerson,
                                icon: Icons.person_outline,
                              ),
                              const SizedBox(height: 16),

                              // Phone Field with Focus sensing
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).phoneNumber,
                                    style: AppStyles.textStyle16Medium.copyWith(
                                      color: ColorManager.textDark,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    style: const TextStyle(
                                      color: ColorManager.textDark,
                                      fontSize: 16,
                                    ),
                                    cursorColor: ColorManager.primary,
                                    decoration: InputDecoration(
                                      hintText: S.of(context).phoneNumber,
                                      hintStyle: const TextStyle(
                                        color: ColorManager.textSecondary,
                                      ),
                                      prefix: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          '+966',
                                          style: AppStyles.textStyle16Medium
                                              .copyWith(
                                                color:
                                                    ColorManager.textSecondary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.phone_android,
                                        color: ColorManager.primary,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 16,
                                          ),
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
                                ],
                              ),

                              const SizedBox(height: 16),
                              Text(
                                S.of(context).email,
                                style: AppStyles.textStyle16Medium.copyWith(
                                  color: ColorManager.textDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  color: ColorManager.textDark,
                                  fontSize: 16,
                                ),
                                cursorColor: ColorManager.primary,
                                decoration: InputDecoration(
                                  hintText: 'Enter email address',
                                  hintStyle: const TextStyle(
                                    color: ColorManager.textSecondary,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: ColorManager.primary,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
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

                              const SizedBox(height: 16),
                              BlocBuilder<SubscriptionCubit, SubscriptionState>(
                                builder: (context, state) {
                                  return _CompanySizeDropdown(
                                    value: cubit.selectedSize,
                                    onChanged: (val) {
                                      cubit.changeCompanySize(val);
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              _StaticTextField(
                                label: S.of(context).additionalMessage,
                                icon: Icons.message_outlined,
                                maxLines: 4,
                              ),
                              const SizedBox(height: 32),
                              SizedBox(
                                width: double.infinity,
                                height: 54,
                                child: CustomButton(
                                  text: S.of(context).submitRequest,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Handle submission
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text('Request Sent!'),
                                          backgroundColor: ColorManager.primary,
                                        ),
                                      );
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      } else {
                                        context.go(AppRouter.kHomeView);
                                      }
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StaticTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final int maxLines;

  const _StaticTextField({
    required this.label,
    required this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.textDark,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: maxLines,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.textDark,
          ),
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(color: ColorManager.textSecondary),
            prefixIcon: Icon(icon, color: ColorManager.primary),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorManager.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorManager.border),
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
      ],
    );
  }
}

class _CompanySizeDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const _CompanySizeDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).companySize,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.textDark,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          key: ValueKey(value),
          initialValue: value,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.textDark,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(
              Icons.business_center_outlined,
              color: ColorManager.primary,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorManager.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorManager.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: ColorManager.primary,
                width: 1.5,
              ),
            ),
          ),
          items: [
            DropdownMenuItem(value: 'Small', child: Text(S.of(context).small)),
            DropdownMenuItem(
              value: 'Medium',
              child: Text(S.of(context).medium),
            ),
            DropdownMenuItem(value: 'Large', child: Text(S.of(context).large)),
          ],
          onChanged: onChanged,
          hint: Text(
            S.of(context).companySize,
            style: const TextStyle(color: ColorManager.textSecondary),
          ),
        ),
      ],
    );
  }
}
