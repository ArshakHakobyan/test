import 'package:flutter/material.dart';
import 'package:telcell_copy/pages/my_account_page.dart';
import '../widgets/balance_visibility.dart';
import 'package:telcell_copy/pages/credit_cards_page.dart';

enum Statuses { guest, expert, guru }

class RaisePage extends StatefulWidget {
  const RaisePage({key}) : super(key: key);
  @override
  State createState() => NotificationsState();
}

class NotificationsState extends State<RaisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
            title:  BalanceVisibility()),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(241, 242, 244, 1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                  child: Row(
                    children: const [
                      Text(
                        'Personification',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                WalletStatus(
                  selected: true,
                  status: Statuses.guest,
                ),
                WalletStatus(
                  selected: false,
                  status: Statuses.expert,
                ),
                WalletStatus(
                  selected: false,
                  status: Statuses.guru,
                ),
              ],
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class WalletStatus extends StatefulWidget {
  String title = 'Guest';
  IconData titleIcon = Icons.person;
  final Statuses status;
  final bool selected;
  WalletStatus({
    super.key,
    required this.selected,
    required this.status,
  });

  @override
  State<WalletStatus> createState() => _WalletStatusState();
}

class _WalletStatusState extends State<WalletStatus> {
  final String guestText =
      'The GUEST status allows you to get acquainted with the various sections of wallet, 450+ services and useful features.Tellcell Wallet is with you 24/7.To make transactions, raise your status and become an EXPERT by attaching a passport and bank card. And if you also open a bank account right from the wallet, you wil become a Guru and enjoy all the benefits';
  final String expertText =
      'The Expert status allows you to fully use 450+ services of the wallet, make payments and transfers, get loans online, buy tickets,exchange collected BONuses with gifts and much more. By attaching a passport and bank card to the wallet,you will take an adventage of the montioned features. And if you also open a bank account right from the wallet, you will become a GURU and enjoy all the adventages. Telcell wallet is with you 24/7';
  final String guruText =
      'The Guru status allows you to use all features of Telcell eallet with 100%, as well as replanish the wallet with Tellcell terminals anytime.you can make paymants and transfers, get loans online, buy tickets , exchangecollected BONuses with gifts and much more.Attach your passport, bank card and open a bank account right from the wallet and enjoy all the benefits. Telcell wallet is with you 24/7';

  void raiseButtonHandle() {
    if (widget.title == 'Expert') {
      Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => const CardsPage()));
    } else {
      Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) =>  MyAccountPage()));
    }
  }

  String statusChecker() {
    switch (widget.status) {
      case Statuses.guest:
        setState(() {
          widget.title = "Guest";
          widget.titleIcon = Icons.person;
        });
        return guestText;
      case Statuses.expert:
        setState(() {
          widget.title = "Expert";
          widget.titleIcon = Icons.person_2;
        });
        return expertText;
      case Statuses.guru:
        setState(() {
          widget.title = "Guru";
          widget.titleIcon = Icons.person_3;
        });
        return guruText;
    }
  }

  @override
  void initState() {
    super.initState();
    statusChecker();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width * 0.90,
      height: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.titleIcon,
                  color: const Color.fromRGBO(238, 111, 50, 1),
                  size: 35,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          widget.selected
              ? const Text(
                  'Current status of wallet',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )
              : const SizedBox(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.88,
            height: 35,
            child: const Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: Text(statusChecker()),
          ),
          const Expanded(child: SizedBox()),
          widget.selected
              ? const SizedBox(
                  height: 1,
                )
              : Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(102, 187, 106, 1))),
                    onPressed: raiseButtonHandle,
                    child: const Text('Raise Status'),
                  ),
                ),
        ],
      ),
    );
  }
}
