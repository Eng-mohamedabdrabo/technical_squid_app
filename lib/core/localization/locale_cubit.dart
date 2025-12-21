import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:technical_squid_app/core/localization/locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  static const String _languageKey = 'app_language';

  LocaleCubit() : super(const LocaleState(Locale('en'))) {
    _loadSavedLanguage();
  }

  Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);

    emit(LocaleState(Locale(languageCode)));
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString(_languageKey);

    if (savedLanguage != null) {
      emit(LocaleState(Locale(savedLanguage)));
    }
  }

  /// Helpers (اختياري)
  bool get isArabic => state.locale.languageCode == 'ar';
  bool get isEnglish => state.locale.languageCode == 'en';
}
