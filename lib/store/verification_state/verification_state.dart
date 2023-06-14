import 'package:mobx/mobx.dart';

part 'verification_state.g.dart';

class VerificationState = _VerificationState with _$VerificationState;

abstract class _VerificationState with Store {

  @observable
  String code = '';

  @observable
  String? errorText = null;
}