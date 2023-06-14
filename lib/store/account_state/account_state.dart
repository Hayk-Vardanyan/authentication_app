import 'package:mobx/mobx.dart';

part 'account_state.g.dart';

class AccountState = _AccountState with _$AccountState;

abstract class _AccountState with Store {
  @observable
  int pageIndex = 4;
}