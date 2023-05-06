import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telcell_copy/pageModels/home_page_model.dart';

import '../pageModels/authorization_page_model.dart';
import 'authorization_page.dart';
import 'credit_cards_page.dart';
//import 'crypto_value_page.dart';
import 'profile_page.dart';
import 'qr_code_page.dart';
import 'wallet_page.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  List<Widget> pages = <Widget>[
    const WalletPage(),
    const CardsPage(),
    const QrCodePage(),
    //const CryptoPage(),
    const ProfilePage(),
  ];

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return context.watch<HomeScreenModel>().isAuthorized
        ? Scaffold(
            body: pages[context.watch<HomeScreenModel>().curIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: context.watch<HomeScreenModel>().curIndex,
              backgroundColor: Colors.white,
              selectedItemColor:
                  const Color.fromRGBO(238, 111, 50, 1), //main color
              unselectedItemColor: const Color.fromRGBO(176, 190, 198, 1),
              type: BottomNavigationBarType.fixed,
              onTap: (indexOfNavBtn) {
                context
                    .read<HomeScreenModel>()
                    .setCurrentIndex(newIndex: indexOfNavBtn);
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
        : ChangeNotifierProvider(
            create: (BuildContext context) {
              return AuthorizationModel();
            },
            child: Authorization(
              callback: context.read<HomeScreenModel>().toggle,
            ),
          );
  }
}
