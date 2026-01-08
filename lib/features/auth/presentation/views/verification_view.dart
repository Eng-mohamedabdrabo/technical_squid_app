import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/widgets/custom_button.dart';
import 'package:technical_squid_app/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground, // DESIGN REQUIREMENT
      body: SafeArea(
        child: LayoutBuilder(
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
                      AuthHeader(
                        title: S.of(context).verify,
                        subtitle: '${S.of(context).enterCodeSentTo} +966...',
                      ),
                      const SizedBox(height: 48),

                      // Code Input (Simple 4-digit row)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => _CodeDigitField(autofocus: index == 0),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Resend Code
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            S.of(context).resendCode,
                            style: AppStyles.textStyle16Medium.copyWith(
                              color: ColorManager.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Confirm Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          text: S.of(context).confirm,
                          onPressed: () {
                            // Navigate Home on success (Clear stack)
                            context.go(AppRouter.kHomeView);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CodeDigitField extends StatelessWidget {
  final bool autofocus;
  const _CodeDigitField({this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorManager.border),
      ),
      child: Center(
        child: TextField(
          autofocus: autofocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: AppStyles.textStyle24Bold.copyWith(
            color: ColorManager.textDark,
          ), // Ensure DARK text
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
