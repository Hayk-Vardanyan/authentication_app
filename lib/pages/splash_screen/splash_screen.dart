import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../mixins/after_layout_mixin.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../storage/storage_utils.dart';
import '../../store/auth/auth_state.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with AfterLayoutMixin {
  final authState = GetIt.I<AuthState>();

  @override
  Future afterFirstLayout(BuildContext context) async {
    await checkSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splashScreen.png'),
              fit: BoxFit.cover,
            ),
          ),
          // const Image(image: AssetImage('assets/images/splashScreen.png')),
        ),
      ),
    );
  }

  Future<void> checkSession() async {
    // final user = UserModel(
    //   firstName: 'Raffi',
    //   lastName: 'Martuirosyan',
    // );
    // await StorageUtils.removeUser(); await StorageUtils.removeAccessToken();
    // await StorageUtils.setUser(user);
    await Future.delayed(const Duration(seconds: 3));
    final token = await StorageUtils.getAccessToken();
    if (token == null) {
      // await router.popAndPush(const LoginRoute());
      await router.popAndPush(const StartRoute());
    } else {
      final user = await StorageUtils.getUser();
      GetIt.I<AuthState>().currentUser = user;
      await router.popAndPush(const DashboardRoute());
    }
  }
}
