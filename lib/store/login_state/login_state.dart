import 'package:easy_localization/easy_localization.dart';
import 'package:mobx/mobx.dart';

part 'login_state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState with Store {
  _LoginState() {
    setupValidations();
  }

  final validNumbers = <String>['091', '093', '095', '099', '033', '096', '043'];

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String number = '';

  @observable
  String? emailError = '';

  @observable
  String? numberError;

  @observable
  String? passwordError = '';

  @observable
  double animatedButtonOpacity = 0;

  @observable
  double animatedFooterOpacity = 1;

  List<ReactionDisposer>? _disposers;

  void setupValidations() {
    if (_disposers != null) {
      return;
    }
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => number, validateNumber),

      // reaction((_) => tapped, changeTapped),
    ];
  }

  void dispose() {
    if (_disposers == null) {
      return;
    }
    for (final d in _disposers!) {
      d();
    }
  }

  @action
  void validateEmail(_) {
    if (email.isEmpty) {
      emailError = 'localValidationError.phone';
    } else {
      emailError = null;
    }
  }

  @action
  void validatePassword(_) {
    if (password.isEmpty) {
      passwordError = 'localValidationError.phone';
    } else {
      passwordError = null;
    }
  }

  @action
  void validateNumber(_) {
    if (number.isEmpty) {
      numberError = 'error.phoneNumber'.tr();
    } else if (number.length != 9) {
      numberError = 'error.phoneNumber'.tr();
    } else if (!validNumbers.contains(number.substring(0, 3))) {
      numberError = 'error.phoneNumber'.tr();
    } else {
      numberError = null;
    }
  }

}
