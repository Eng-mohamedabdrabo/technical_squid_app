import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/widgets/custom_button.dart';
import 'package:technical_squid_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:technical_squid_app/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:technical_squid_app/features/auth/presentation/views/widgets/auth_method_selector.dart';
import 'package:technical_squid_app/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:technical_squid_app/core/utils/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        return Center(
          child: SingleChildScrollView(
            child: Container(
              width: isTablet ? 500 : double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Back Button
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconButton(
                      onPressed: () {
                        if (GoRouter.of(context).canPop()) {
                          GoRouter.of(context).pop();
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: ColorManager.primary,
                      ),
                      padding: EdgeInsets.zero,
                      alignment: AlignmentDirectional.centerStart,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Logo
                  Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          Assets.logoShape,
                          height: 80,
                          colorFilter: const ColorFilter.mode(
                            ColorManager.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),

                  AuthHeader(
                    title: S.of(context).signupAction,
                    subtitle: S.of(context).loginToContinue,
                  ),
                  const SizedBox(height: 32),

                  BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      final cubit = context.read<SignupCubit>();
                      return Column(
                        children: [
                          AuthMethodSelector(
                            isEmail: cubit.isEmailSignup,
                            onEmailTap: () {
                              if (!cubit.isEmailSignup) {
                                cubit.toggleAuthMethod();
                              }
                            },
                            onPhoneTap: () {
                              if (cubit.isEmailSignup) {
                                cubit.toggleAuthMethod();
                              }
                            },
                          ),
                          const SizedBox(height: 32),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: cubit.isEmailSignup
                                ? const _EmailSignupForm(
                                    key: ValueKey('EmailSignup'),
                                  )
                                : const _PhoneSignupForm(
                                    key: ValueKey('PhoneSignup'),
                                  ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  // Already have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).alreadyHaveAccount,
                        style: AppStyles.textStyle16Medium.copyWith(
                          color: ColorManager.textSecondary,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(
                            context,
                          ).pop(); // Go back to Login (assuming push was used)
                          // Or explicit: context.go(AppRouter.kLoginView);
                        },
                        child: Text(
                          S.of(context).loginAction,
                          style: AppStyles.textStyle16Medium.copyWith(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Extra "Go to Verification" button
                  TextButton.icon(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kVerificationView);
                    },
                    icon: const Icon(
                      Icons.verified_user_outlined,
                      size: 18,
                      color: ColorManager.textSecondary,
                    ),
                    label: Text(
                      S.of(context).verify,
                      style: AppStyles.textStyle16Medium.copyWith(
                        color: ColorManager.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EmailSignupForm extends StatelessWidget {
  const _EmailSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).fullName,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        AuthTextField(
          hintText: S.of(context).fullName,
          prefixIcon: Icons.person_outline,
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
        AuthTextField(
          hintText: S.of(context).email,
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        Text(
          S.of(context).password,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        AuthTextField(
          hintText: S.of(context).password,
          prefixIcon: Icons.lock_outline,
          obscureText: true,
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: CustomButton(
            text: S.of(context).signupAction,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kVerificationView);
            },
          ),
        ),
      ],
    );
  }
}

class _PhoneSignupForm extends StatefulWidget {
  const _PhoneSignupForm({super.key});

  @override
  State<_PhoneSignupForm> createState() => _PhoneSignupFormState();
}

class _PhoneSignupFormState extends State<_PhoneSignupForm> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    context.read<SignupCubit>().changePhoneFocus(_focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).fullName,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        AuthTextField(
          hintText: S.of(context).fullName,
          prefixIcon: Icons.person_outline,
        ),
        const SizedBox(height: 16),
        Text(
          S.of(context).phoneNumber,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        AuthTextField(
          focusNode: _focusNode,
          hintText: S.of(context).phoneNumber,
          keyboardType: TextInputType.phone,
          prefix: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Text(
              '+966',
              style: AppStyles.textStyle16Medium.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          prefixIcon: Icons.phone_android_outlined,
        ),
        const SizedBox(height: 16),
        Text(
          S.of(context).password,
          style: AppStyles.textStyle16Medium.copyWith(
            color: ColorManager.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        AuthTextField(
          hintText: S.of(context).password,
          prefixIcon: Icons.lock_outline,
          obscureText: true,
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: CustomButton(
            text: S.of(context).signupAction,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kVerificationView);
            },
          ),
        ),
      ],
    );
  }
}
