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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
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
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Eisenhower Matrix`
  String get app_name {
    return Intl.message(
      'Eisenhower Matrix',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Boost your productivity`
  String get tagline {
    return Intl.message(
      'Boost your productivity',
      name: 'tagline',
      desc: '',
      args: [],
    );
  }

  /// `Write the task`
  String get write_task {
    return Intl.message(
      'Write the task',
      name: 'write_task',
      desc: '',
      args: [],
    );
  }

  /// `Choose group for your task`
  String get choose_group {
    return Intl.message(
      'Choose group for your task',
      name: 'choose_group',
      desc: '',
      args: [],
    );
  }

  /// `Your Task..`
  String get hint {
    return Intl.message(
      'Your Task..',
      name: 'hint',
      desc: '',
      args: [],
    );
  }

  /// `Task can't be empty`
  String get task_is_empty {
    return Intl.message(
      'Task can\'t be empty',
      name: 'task_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Is this task {text}?`
  String is_this_task(Object text) {
    return Intl.message(
      'Is this task $text?',
      name: 'is_this_task',
      desc: '',
      args: [text],
    );
  }

  /// `urgent`
  String get urgent {
    return Intl.message(
      'urgent',
      name: 'urgent',
      desc: '',
      args: [],
    );
  }

  /// `important`
  String get important {
    return Intl.message(
      'important',
      name: 'important',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Done Tasks`
  String get done_tasks {
    return Intl.message(
      'Done Tasks',
      name: 'done_tasks',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `not`
  String get not {
    return Intl.message(
      'not',
      name: 'not',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get accept {
    return Intl.message(
      'Are you sure?',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Tag as `
  String get tag_as_done {
    return Intl.message(
      'Tag as ',
      name: 'tag_as_done',
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