// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(text) => "Choosed ${text}";

  static String m1(userName) => "Hello ${userName}";

  static String m2(error) => "Signup fail: ${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "accountManagement":
            MessageLookupByLibrary.simpleMessage("Account management"),
        "activated": MessageLookupByLibrary.simpleMessage("Activated"),
        "active": MessageLookupByLibrary.simpleMessage("Active"),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addNews": MessageLookupByLibrary.simpleMessage("Add news"),
        "addUser": MessageLookupByLibrary.simpleMessage("Add user"),
        "admin": MessageLookupByLibrary.simpleMessage("Admin"),
        "areYouSure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
        "brief": MessageLookupByLibrary.simpleMessage("Brief"),
        "camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cannotEmpty": MessageLookupByLibrary.simpleMessage("Cannot empty"),
        "changePermission":
            MessageLookupByLibrary.simpleMessage("Change permission"),
        "changeProfile": MessageLookupByLibrary.simpleMessage("Change profile"),
        "characterRequire":
            MessageLookupByLibrary.simpleMessage("You must enter something"),
        "chooseImages": MessageLookupByLibrary.simpleMessage("Choose images"),
        "chooseThumbnail":
            MessageLookupByLibrary.simpleMessage("Choose thumbnail"),
        "chooseUnits": MessageLookupByLibrary.simpleMessage("Choose units"),
        "chooseYourLanguages":
            MessageLookupByLibrary.simpleMessage("Choose your language"),
        "choosed": m0,
        "content": MessageLookupByLibrary.simpleMessage("Content"),
        "continueWithEmail":
            MessageLookupByLibrary.simpleMessage("Continue with Email"),
        "continueWithFaceBook":
            MessageLookupByLibrary.simpleMessage("Continue with FaceBook"),
        "continueWithGoogle":
            MessageLookupByLibrary.simpleMessage("Continue with Google"),
        "createYourAccount":
            MessageLookupByLibrary.simpleMessage("Create your account"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "deActivated": MessageLookupByLibrary.simpleMessage("Deactivated"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAll": MessageLookupByLibrary.simpleMessage("Delete all"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Dont have an account"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAlreadyInUse":
            MessageLookupByLibrary.simpleMessage("Email already in use"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "favoritesList": MessageLookupByLibrary.simpleMessage("Favorites list"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "hello": m1,
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "humidity": MessageLookupByLibrary.simpleMessage("Humidity"),
        "imperial": MessageLookupByLibrary.simpleMessage("Imperial"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "invalidPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Invalid phone number"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginFail": MessageLookupByLibrary.simpleMessage("Login fail"),
        "loginNow": MessageLookupByLibrary.simpleMessage("Login now"),
        "loginQuote":
            MessageLookupByLibrary.simpleMessage("Login with your email"),
        "loginSuccess": MessageLookupByLibrary.simpleMessage("Login success"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "metric": MessageLookupByLibrary.simpleMessage("Metric"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nameMustLongerThan4Character": MessageLookupByLibrary.simpleMessage(
            "Name must longer than 4 character"),
        "networkError": MessageLookupByLibrary.simpleMessage("Network error"),
        "news": MessageLookupByLibrary.simpleMessage("News"),
        "newsManagement":
            MessageLookupByLibrary.simpleMessage("News management"),
        "noData": MessageLookupByLibrary.simpleMessage("No data"),
        "noImageSelected":
            MessageLookupByLibrary.simpleMessage("No image selected"),
        "notMatch": MessageLookupByLibrary.simpleMessage("Not match"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordMustLongerThan6Character":
            MessageLookupByLibrary.simpleMessage(
                "Password must longer than 6 character"),
        "permission": MessageLookupByLibrary.simpleMessage("Permission"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
        "photo": MessageLookupByLibrary.simpleMessage("Photo"),
        "pressure": MessageLookupByLibrary.simpleMessage("Pressure"),
        "rePassword": MessageLookupByLibrary.simpleMessage("Retype password"),
        "reload": MessageLookupByLibrary.simpleMessage("Reload"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "selectYourLoginMethod":
            MessageLookupByLibrary.simpleMessage("Select your login method"),
        "setting": MessageLookupByLibrary.simpleMessage("Settings"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sign out"),
        "signUp": MessageLookupByLibrary.simpleMessage("Signup"),
        "signupFail": m2,
        "signupQuote":
            MessageLookupByLibrary.simpleMessage("Create your account"),
        "signupSuccess": MessageLookupByLibrary.simpleMessage(
            "Signup success, please verify the email"),
        "skipForNow": MessageLookupByLibrary.simpleMessage("Skip for now"),
        "success": MessageLookupByLibrary.simpleMessage(
            "Success, please check your email"),
        "temp": MessageLookupByLibrary.simpleMessage("Temp"),
        "tiengViet": MessageLookupByLibrary.simpleMessage("Tiếng Việt"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "updateNews": MessageLookupByLibrary.simpleMessage("Update news"),
        "user": MessageLookupByLibrary.simpleMessage("User"),
        "userName": MessageLookupByLibrary.simpleMessage("User name"),
        "userNotActive":
            MessageLookupByLibrary.simpleMessage("User not active"),
        "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
        "userNotVerify":
            MessageLookupByLibrary.simpleMessage("User not verify email"),
        "weatherAnalysis":
            MessageLookupByLibrary.simpleMessage("Weather analysis"),
        "wind": MessageLookupByLibrary.simpleMessage("Wind"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage("Wrong password"),
        "youAreNotLogin":
            MessageLookupByLibrary.simpleMessage("You are not login?")
      };
}
