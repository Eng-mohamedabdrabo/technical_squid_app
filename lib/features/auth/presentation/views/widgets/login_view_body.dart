import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/widgets/custom_button.dart';
import 'package:technical_squid_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:technical_squid_app/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:technical_squid_app/features/auth/presentation/views/widgets/auth_method_selector.dart';
import 'package:technical_squid_app/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:technical_squid_app/core/utils/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_squid_app/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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

                  // Header
                  AuthHeader(
                    title: S.of(context).welcomeBack,
                    subtitle: S.of(context).loginToContinue,
                  ),
                  const SizedBox(height: 32),

                  // Cubit State Listener
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      final cubit = context.read<LoginCubit>();
                      return Column(
                        children: [
                          AuthMethodSelector(
                            isEmail: cubit.isEmailLogin,
                            onEmailTap: () {
                              if (!cubit.isEmailLogin) {
                                cubit.toggleAuthMethod();
                              }
                            },
                            onPhoneTap: () {
                              if (cubit.isEmailLogin) {
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
                            child: cubit.isEmailLogin
                                ? const _EmailLoginForm(
                                    key: ValueKey('EmailForm'),
                                  )
                                : const _PhoneLoginForm(
                                    key: ValueKey('PhoneForm'),
                                  ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 32),

                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).dontHaveAccount,
                        style: AppStyles.textStyle16Medium.copyWith(
                          color: ColorManager.textSecondary,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kSignupView);
                        },
                        child: Text(
                          S.of(context).signupAction,
                          style: AppStyles.textStyle16Medium.copyWith(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EmailLoginForm extends StatelessWidget {
  const _EmailLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            text: S.of(context).loginAction,
            onPressed: () {
              context.go(AppRouter.kHomeView);
            },
          ),
        ),
      ],
    );
  }
}

class _PhoneLoginForm extends StatefulWidget {
  const _PhoneLoginForm({super.key});

  @override
  State<_PhoneLoginForm> createState() => _PhoneLoginFormState();
}

class _PhoneLoginFormState extends State<_PhoneLoginForm> {
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
    context.read<LoginCubit>().changePhoneFocus(_focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            text: S.of(context).loginAction,
            onPressed: () {
              context.go(AppRouter.kHomeView);
            },
          ),
        ),
      ],
    );
  }
}
