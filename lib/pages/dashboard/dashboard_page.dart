import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../store/account_state/account_state.dart';
import '../../store/auth/auth_state.dart';
import 'dashboard_widgets/headLine.dart';
import 'dashboard_widgets/itemLine.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  AccountState accountState = AccountState();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                Observer(
                  builder: (context) {
                    final user = GetIt.I<AuthState>().currentUser;
                    return HeadLine(
                      fullName: user?.fullName,
                      email: user?.email,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const ItemLine(
                  icon: Icon(
                    Icons.shopping_bag_rounded,
                  ),
                  text: 'Orders',
                  topWidth: 1,
                ),
                const ItemLine(
                  icon: Icon(Icons.insert_drive_file),
                  text: 'My Details',
                ),
                const ItemLine(
                  icon: Icon(Icons.gps_fixed),
                  text: 'Delivery Address',
                ),
                const ItemLine(
                  icon: Icon(Icons.payment),
                  text: 'Payment Methods',
                ),
                const ItemLine(
                  icon: Icon(Icons.account_circle_sharp),
                  text: 'Promo Cord',
                ),
                const ItemLine(
                  icon: Icon(Icons.notification_important_rounded),
                  text: 'Notifications',
                ),
                const ItemLine(
                  icon: Icon(Icons.help_outline),
                  text: 'Help',
                ),
                const ItemLine(
                  icon: Icon(Icons.security_update_warning_outlined),
                  text: 'About',
                  bottomWidth: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    GetIt.I<AuthState>().logout();
                    router.popAndPush(const StartRoute());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black12,
                  ),
                  child: const Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Observer(
          builder: (context) {
            return BottomNavigationBar(
              onTap: (value) {
                accountState.pageIndex = value;
              },
              showUnselectedLabels: true,
              selectedItemColor: Colors.green[900],
              currentIndex: accountState.pageIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_repair_service_rounded,
                  ),
                  label: 'Shop',
                  backgroundColor: Colors.grey,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Explore',
                  backgroundColor: Colors.grey,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart_sharp,
                  ),
                  label: 'Cart',
                  backgroundColor: Colors.grey,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: 'Favorite',
                  backgroundColor: Colors.grey,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_sharp,
                  ),
                  label: 'Account',
                  backgroundColor: Colors.grey,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
