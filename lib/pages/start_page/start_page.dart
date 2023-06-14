import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../providers/screen_service.dart';
import '../../router.dart';

@RoutePage()
class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/startPage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: ElevatedButton(
                    onPressed: () {
                      router.popAndPush(const LoginRoute());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: const Text('Get started'),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 70),
      //   child: ElevatedButton(
      //     onPressed: () {
      //       router.popAndPush(const LoginRoute());
      //     },
      //     style: ElevatedButton.styleFrom(
      //       primary: Colors.green,
      //     ),
      //     child: const Text('Get started'),
      //   ),
      // ),
    );
  }
}
