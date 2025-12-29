import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/localization/locale_cubit.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';

class CustomLanguageSelector extends StatelessWidget {
  const CustomLanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: ColorManager.lightBackground,
        border: Border.all(color: ColorManager.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: Localizations.localeOf(context).languageCode,
          icon: const Icon(
            Icons.language,
            color: ColorManager.primary,
            size: 20,
          ),
          isDense: true,
          dropdownColor: ColorManager.lightBackground,
          items: const [
            DropdownMenuItem(
              value: 'ar',
              child: Text(
                'عربي',
                style: TextStyle(color: ColorManager.textDark),
              ),
            ),
            DropdownMenuItem(
              value: 'en',
              child: Text(
                'English',
                style: TextStyle(color: ColorManager.textDark),
              ),
            ),
            DropdownMenuItem(
              value: 'zh',
              child: Text('中文', style: TextStyle(color: ColorManager.textDark)),
            ),
          ],
          onChanged: (String? newValue) {
            if (newValue != null) {
              context.read<LocaleCubit>().changeLanguage(newValue);
            }
          },
        ),
      ),
    );
  }
}
