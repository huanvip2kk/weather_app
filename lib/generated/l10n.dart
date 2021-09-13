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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Continue with FaceBook`
  String get continueWithFaceBook {
    return Intl.message(
      'Continue with FaceBook',
      name: 'continueWithFaceBook',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Email`
  String get continueWithEmail {
    return Intl.message(
      'Continue with Email',
      name: 'continueWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Skip for now`
  String get skipForNow {
    return Intl.message(
      'Skip for now',
      name: 'skipForNow',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account`
  String get dontHaveAnAccount {
    return Intl.message(
      'Dont have an account',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signUp {
    return Intl.message(
      'Signup',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Select your login method`
  String get selectYourLoginMethod {
    return Intl.message(
      'Select your login method',
      name: 'selectYourLoginMethod',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Choose your language`
  String get chooseYourLanguages {
    return Intl.message(
      'Choose your language',
      name: 'chooseYourLanguages',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password must longer than 6 character`
  String get passwordMustLongerThan6Character {
    return Intl.message(
      'Password must longer than 6 character',
      name: 'passwordMustLongerThan6Character',
      desc: '',
      args: [],
    );
  }

  /// `Name must longer than 4 character`
  String get nameMustLongerThan4Character {
    return Intl.message(
      'Name must longer than 4 character',
      name: 'nameMustLongerThan4Character',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get createYourAccount {
    return Intl.message(
      'Create your account',
      name: 'createYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get photo {
    return Intl.message(
      'Photo',
      name: 'photo',
      desc: '',
      args: [],
    );
  }

  /// `Login success`
  String get loginSuccess {
    return Intl.message(
      'Login success',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Signup success, please verify the email`
  String get signupSuccess {
    return Intl.message(
      'Signup success, please verify the email',
      name: 'signupSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Login fail`
  String get loginFail {
    return Intl.message(
      'Login fail',
      name: 'loginFail',
      desc: '',
      args: [],
    );
  }

  /// `Signup fail: {error}`
  String signupFail(Object error) {
    return Intl.message(
      'Signup fail: $error',
      name: 'signupFail',
      desc: '',
      args: [error],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get wrongPassword {
    return Intl.message(
      'Wrong password',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Network error`
  String get networkError {
    return Intl.message(
      'Network error',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `Wind`
  String get wind {
    return Intl.message(
      'Wind',
      name: 'wind',
      desc: '',
      args: [],
    );
  }

  /// `Pressure`
  String get pressure {
    return Intl.message(
      'Pressure',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Hello {userName}`
  String hello(Object userName) {
    return Intl.message(
      'Hello $userName',
      name: 'hello',
      desc: '',
      args: [userName],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Email already in use`
  String get emailAlreadyInUse {
    return Intl.message(
      'Email already in use',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Choosed {text}`
  String choosed(Object text) {
    return Intl.message(
      'Choosed $text',
      name: 'choosed',
      desc: '',
      args: [text],
    );
  }

  /// `Tiếng Việt`
  String get tiengViet {
    return Intl.message(
      'Tiếng Việt',
      name: 'tiengViet',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Change profile`
  String get changeProfile {
    return Intl.message(
      'Change profile',
      name: 'changeProfile',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message(
      'User name',
      name: 'userName',
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

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cannot empty`
  String get cannotEmpty {
    return Intl.message(
      'Cannot empty',
      name: 'cannotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `You are not login?`
  String get youAreNotLogin {
    return Intl.message(
      'You are not login?',
      name: 'youAreNotLogin',
      desc: '',
      args: [],
    );
  }

  /// `Login now`
  String get loginNow {
    return Intl.message(
      'Login now',
      name: 'loginNow',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get reload {
    return Intl.message(
      'Reload',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `Success, please check your email`
  String get success {
    return Intl.message(
      'Success, please check your email',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `You must enter something`
  String get characterRequire {
    return Intl.message(
      'You must enter something',
      name: 'characterRequire',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Choose units`
  String get chooseUnits {
    return Intl.message(
      'Choose units',
      name: 'chooseUnits',
      desc: '',
      args: [],
    );
  }

  /// `Login with your email`
  String get loginQuote {
    return Intl.message(
      'Login with your email',
      name: 'loginQuote',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get signupQuote {
    return Intl.message(
      'Create your account',
      name: 'signupQuote',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Temp`
  String get temp {
    return Intl.message(
      'Temp',
      name: 'temp',
      desc: '',
      args: [],
    );
  }

  /// `Weather analysis`
  String get weatherAnalysis {
    return Intl.message(
      'Weather analysis',
      name: 'weatherAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Retype password`
  String get rePassword {
    return Intl.message(
      'Retype password',
      name: 'rePassword',
      desc: '',
      args: [],
    );
  }

  /// `Not match`
  String get notMatch {
    return Intl.message(
      'Not match',
      name: 'notMatch',
      desc: '',
      args: [],
    );
  }

  /// `User not verify email`
  String get userNotVerify {
    return Intl.message(
      'User not verify email',
      name: 'userNotVerify',
      desc: '',
      args: [],
    );
  }

  /// `Favorites list`
  String get favoritesList {
    return Intl.message(
      'Favorites list',
      name: 'favoritesList',
      desc: '',
      args: [],
    );
  }

  /// `Delete all`
  String get deleteAll {
    return Intl.message(
      'Delete all',
      name: 'deleteAll',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message(
      'No data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Add news`
  String get addNews {
    return Intl.message(
      'Add news',
      name: 'addNews',
      desc: '',
      args: [],
    );
  }

  /// `Account management`
  String get accountManagement {
    return Intl.message(
      'Account management',
      name: 'accountManagement',
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

  /// `No image selected`
  String get noImageSelected {
    return Intl.message(
      'No image selected',
      name: 'noImageSelected',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Brief`
  String get brief {
    return Intl.message(
      'Brief',
      name: 'brief',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get content {
    return Intl.message(
      'Content',
      name: 'content',
      desc: '',
      args: [],
    );
  }

  /// `Choose thumbnail`
  String get chooseThumbnail {
    return Intl.message(
      'Choose thumbnail',
      name: 'chooseThumbnail',
      desc: '',
      args: [],
    );
  }

  /// `Choose images`
  String get chooseImages {
    return Intl.message(
      'Choose images',
      name: 'chooseImages',
      desc: '',
      args: [],
    );
  }

  /// `Update news`
  String get updateNews {
    return Intl.message(
      'Update news',
      name: 'updateNews',
      desc: '',
      args: [],
    );
  }

  /// `News management`
  String get newsManagement {
    return Intl.message(
      'News management',
      name: 'newsManagement',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
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

  /// `Permission`
  String get permission {
    return Intl.message(
      'Permission',
      name: 'permission',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Activated`
  String get activated {
    return Intl.message(
      'Activated',
      name: 'activated',
      desc: '',
      args: [],
    );
  }

  /// `Deactivated`
  String get deActivated {
    return Intl.message(
      'Deactivated',
      name: 'deActivated',
      desc: '',
      args: [],
    );
  }

  /// `Change permission`
  String get changePermission {
    return Intl.message(
      'Change permission',
      name: 'changePermission',
      desc: '',
      args: [],
    );
  }

  /// `User not active`
  String get userNotActive {
    return Intl.message(
      'User not active',
      name: 'userNotActive',
      desc: '',
      args: [],
    );
  }

  /// `Add user`
  String get addUser {
    return Intl.message(
      'Add user',
      name: 'addUser',
      desc: '',
      args: [],
    );
  }

  /// `Metric`
  String get metric {
    return Intl.message(
      'Metric',
      name: 'metric',
      desc: '',
      args: [],
    );
  }

  /// `Imperial`
  String get imperial {
    return Intl.message(
      'Imperial',
      name: 'imperial',
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
      Locale.fromSubtags(languageCode: 'vi'),
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
