// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Technical Squid`
  String get splashTitle {
    return Intl.message(
      'Technical Squid',
      name: 'splashTitle',
      desc: '',
      args: [],
    );
  }

  /// `Premium Car Care`
  String get onboardingTitle1 {
    return Intl.message(
      'Premium Car Care',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Keep your vehicle in top condition with our expert maintenance services.`
  String get onboardingSubTitle1 {
    return Intl.message(
      'Keep your vehicle in top condition with our expert maintenance services.',
      name: 'onboardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Smart Tracking`
  String get onboardingTitle2 {
    return Intl.message(
      'Smart Tracking',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Track your car's health and maintenance history in real-time.`
  String get onboardingSubTitle2 {
    return Intl.message(
      'Track your car\'s health and maintenance history in real-time.',
      name: 'onboardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Expert Support`
  String get onboardingTitle3 {
    return Intl.message(
      'Expert Support',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `24/7 access to professional mechanics and support staff.`
  String get onboardingSubTitle3 {
    return Intl.message(
      '24/7 access to professional mechanics and support staff.',
      name: 'onboardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
