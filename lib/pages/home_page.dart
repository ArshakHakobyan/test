import 'package:flutter/material.dart';

import 'authorization_page.dart';
import 'credit_cards_page.dart';
//import 'crypto_value_page.dart';
import 'profile_page.dart';
import 'qr_code_page.dart';
import 'wallet_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);
  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  bool isAuthorized = false;
  int curIndex = 0;
  void toggle() {
    setState(() {
      isAuthorized = true;
    });
  }

  List<Widget> pages = <Widget>[
    const WalletPage(),
    const CardsPage(),
    const QrCodePage(),
    //const CryptoPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return isAuthorized
        ? Scaffold(
            body: pages[curIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: curIndex,
              backgroundColor: Colors.white,
              selectedItemColor:
                  const Color.fromRGBO(238, 111, 50, 1), //main color
              unselectedItemColor: const Color.fromRGBO(176, 190, 198, 1),
              type: BottomNavigationBarType.fixed,
              onTap: (indexOfNavBtn) {
                setState(() {
                  curIndex = indexOfNavBtn;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet_rounded),
                    label: 'Wallet'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.payment), label: 'Cards'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code_rounded), label: 'QR code'),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.currency_bitcoin), label: 'BON'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_3_outlined), label: 'Profile'),
              ],
            ),
          )
        : Authorization(
            callback: toggle,
          );
  }
}
