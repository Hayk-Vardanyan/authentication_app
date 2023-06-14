import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../providers/screen_service.dart';
import '../../repositories/auth_repository.dart';
import '../../router.dart';
import '../../store/loading_state/loading_state.dart';
import '../../store/login_state/login_state.dart';
import 'widgets/bottomButtons.dart';
import 'widgets/inputBox.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final loginState = LoginState();
  final loadingState = LoadingState();
  final phoneNumberController = TextEditingController();
  final _phoneNumberFocusNode = FocusNode();
  final bool enableButton = false;

  @override
  void initState() {
    super.initState();
    loginState.setupValidations();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    loginState.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: onDone,
          child: Column(
            children: [
              const Expanded(
                // flex: 3,
                child: Image(
                  image: AssetImage('assets/images/fruits.png'),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  color: Colors.white,
                  child: const Text(
                    'Get your groceries with nectar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                  child: Observer(
                    builder: (_) => InputBox(
                      controller: phoneNumberController,
                      errorText: loginState.numberError,
                      focusNode: _phoneNumberFocusNode,
                      onChange: _onChangedPhoneNumber,
                      onTap: changeInput,
                      onDone: onDone,
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (context) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: loginState.animatedFooterOpacity,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Or connect with social media',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BottomButton(
                          leading: Image.asset(
                            'assets/images/googleLogo.png',
                          ),
                          text: 'Continue with Google',
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const BottomButton(
                          leading: Icon(
                            Icons.facebook,
                            color: Colors.white,
                            size: 30,
                          ),
                          text: 'Continue with Facebook',
                          color: Colors.indigo,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Observer(
          builder: (context) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: loginState.animatedButtonOpacity,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: _onSignIn,
                child: const Icon(Icons.navigate_next),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _onSignIn() async {
    if (loginState.numberError == null && loginState.number.isNotEmpty) {
      final tmpToken = await AuthRepository.sendPhoneNumber(loginState.number);
      await router.popAndPush(VerificationRoute(tmpToken: tmpToken));
    }
  }

  void _onChangedPhoneNumber(String value) {
    loginState.number = value;
    // ..tapped = true;
    // ..validateNumber(value);
    // print(loginState.number);
  }

  void changeInput() {
    loginState
      ..animatedFooterOpacity = 0
      ..animatedButtonOpacity = 1;
  }

  void onDone() {
    _phoneNumberFocusNode.unfocus();
    loginState
      ..animatedFooterOpacity = 1
      ..animatedButtonOpacity = 0;
  }
}