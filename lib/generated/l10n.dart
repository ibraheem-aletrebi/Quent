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

  /// `English`
  String get En {
    return Intl.message('English', name: 'En', desc: '', args: []);
  }

  /// `Arabic`
  String get Ar {
    return Intl.message('Arabic', name: 'Ar', desc: '', args: []);
  }

  /// `Rent your car easily`
  String get onboarding_one_title {
    return Intl.message(
      'Rent your car easily',
      name: 'onboarding_one_title',
      desc: '',
      args: [],
    );
  }

  /// `Choose the car that suits you in minutes without any hassle`
  String get onboarding_one_body {
    return Intl.message(
      'Choose the car that suits you in minutes without any hassle',
      name: 'onboarding_one_body',
      desc: '',
      args: [],
    );
  }

  /// `Cars near you`
  String get onboarding_two_title {
    return Intl.message(
      'Cars near you',
      name: 'onboarding_two_title',
      desc: '',
      args: [],
    );
  }

  /// `Find nearby available cars and book instantly`
  String get onboarding_two_body {
    return Intl.message(
      'Find nearby available cars and book instantly',
      name: 'onboarding_two_body',
      desc: '',
      args: [],
    );
  }

  /// `Pay easily and securely`
  String get onboarding_three_title {
    return Intl.message(
      'Pay easily and securely',
      name: 'onboarding_three_title',
      desc: '',
      args: [],
    );
  }

  /// `Multiple secure payment methods for your peace of mind`
  String get onboarding_three_body {
    return Intl.message(
      'Multiple secure payment methods for your peace of mind',
      name: 'onboarding_three_body',
      desc: '',
      args: [],
    );
  }

  /// `Pick up and start your journey`
  String get onboarding_four_title {
    return Intl.message(
      'Pick up and start your journey',
      name: 'onboarding_four_title',
      desc: '',
      args: [],
    );
  }

  /// `Pick up your car and enjoy the ride`
  String get onboarding_four_body {
    return Intl.message(
      'Pick up your car and enjoy the ride',
      name: 'onboarding_four_body',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Get Started`
  String get get_started {
    return Intl.message(
      'Let’s Get Started',
      name: 'get_started',
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
