import 'package:auto_route/auto_route.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../providers/screen_service.dart';
import '../../repositories/auth_repository.dart';
import '../../router.dart';
import '../../storage/storage_utils.dart';
import '../../store/auth/auth_state.dart';
import '../../store/verification_state/verification_state.dart';

@RoutePage()
class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key, this.tmpToken}) : super(key: key);
  final String? tmpToken;
  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final controller = TextEditingController();
  final verificationState = VerificationState();

  @override
  void initState() {
    // TODO: implement initState
    verificationState.code = generateCode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () {
                router.popAndPush(const LoginRoute());
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.61, top: 149.19, right: 110.83),
              child: Text(
                'Enter your 4-digit code',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.61),
              child: Text(
                'Code',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Observer(
                builder: (context) {
                  return TextField(
                    onChanged: (value) {
                      verificationState.errorText =
                          isIdentical(value) ? null : 'Incorrect';
                    },
                    cursorHeight: 27,
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      errorText: verificationState.errorText,
                      fillColor: Colors.transparent,
                      hintText: ' - - - -',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    controller: controller,
                  );
                },
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 24.61,
                ),
                Flexible(
                  child: Opacity(
                    opacity: 0.3,
                    child: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24.61,
                ),
              ],
            ),
            const SizedBox(
              height: 65,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      verificationState
                        ..code = generateCode()
                        ..errorText = 'Incorrect';
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 24.61),
                      child: const Text(
                        'Resend code',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Observer(
                  builder: (context) {
                    return Expanded(
                      child: Text(
                        verificationState.code,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (verificationState.errorText == null) {
              final model = await AuthRepository.sendVerificationCode(
                  verificationState.code, widget.tmpToken!);
              GetIt.I<AuthState>().currentUser = model.user;
              // print(GetIt.I<AuthState>().currentUser?.fullName);
              GetIt.I<AuthState>().accessToken = model.token.token;
              await StorageUtils.setAccessToken(model.token.token!);
              await StorageUtils.setUser(model.user);

              await router.popAndPush(const DashboardRoute());
            }
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.navigate_next_outlined),
        ),
      ),
    );
  }

  String generateCode() {
    var generatedCode = '';
    for (var i = 0; i < 4; ++i) {
      generatedCode += Random().nextInt(9).toString();
    }
    return generatedCode;
  }

  bool isIdentical(String input) => input == verificationState.code;
}
