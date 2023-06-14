// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginState on _LoginState, Store {
  late final _$emailAtom = Atom(name: '_LoginState.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginState.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$numberAtom = Atom(name: '_LoginState.number', context: context);

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$emailErrorAtom =
      Atom(name: '_LoginState.emailError', context: context);

  @override
  String? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$numberErrorAtom =
      Atom(name: '_LoginState.numberError', context: context);

  @override
  String? get numberError {
    _$numberErrorAtom.reportRead();
    return super.numberError;
  }

  @override
  set numberError(String? value) {
    _$numberErrorAtom.reportWrite(value, super.numberError, () {
      super.numberError = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_LoginState.passwordError', context: context);

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$animatedButtonOpacityAtom =
      Atom(name: '_LoginState.animatedButtonOpacity', context: context);

  @override
  double get animatedButtonOpacity {
    _$animatedButtonOpacityAtom.reportRead();
    return super.animatedButtonOpacity;
  }

  @override
  set animatedButtonOpacity(double value) {
    _$animatedButtonOpacityAtom.reportWrite(value, super.animatedButtonOpacity,
        () {
      super.animatedButtonOpacity = value;
    });
  }

  late final _$animatedFooterOpacityAtom =
      Atom(name: '_LoginState.animatedFooterOpacity', context: context);

  @override
  double get animatedFooterOpacity {
    _$animatedFooterOpacityAtom.reportRead();
    return super.animatedFooterOpacity;
  }

  @override
  set animatedFooterOpacity(double value) {
    _$animatedFooterOpacityAtom.reportWrite(value, super.animatedFooterOpacity,
        () {
      super.animatedFooterOpacity = value;
    });
  }

  late final _$_LoginStateActionController =
      ActionController(name: '_LoginState', context: context);

  @override
  void validateEmail(dynamic _) {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.validateEmail');
    try {
      return super.validateEmail(_);
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(dynamic _) {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.validatePassword');
    try {
      return super.validatePassword(_);
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNumber(dynamic _) {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.validateNumber');
    try {
      return super.validateNumber(_);
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
number: ${number},
emailError: ${emailError},
numberError: ${numberError},
passwordError: ${passwordError},
animatedButtonOpacity: ${animatedButtonOpacity},
animatedFooterOpacity: ${animatedFooterOpacity}
    ''';
  }
}
