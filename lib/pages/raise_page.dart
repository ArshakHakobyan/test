import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telcell_copy/pageModels/raise_page_model.dart';
import 'package:telcell_copy/pages/my_account_page.dart';
import '../widgets/balance_visibility.dart';
import 'package:telcell_copy/pages/credit_cards_page.dart';

enum Statuses { guest, expert, guru }

class RaisePage extends StatelessWidget {
  const RaisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
            title: BalanceVisibility(
              isRouted: true,
            )),
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
class WalletStatus extends StatelessWidget {
  WalletStatus({super.key, required this.selected, required this.status});
  bool selected;
  Statuses status;

  final String guestText = 'The GUEST ';
  final String expertText = 'The Expert ';
  final String guruText = 'The Guru ';

  @override
  Widget build(BuildContext context) {
    context.read<RaisePageModel>().statusChecker(status: status);
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
                  context.watch<RaisePageModel>().titleIcon,
                  color: const Color.fromRGBO(238, 111, 50, 1),
                  size: 35,
                ),
                Text(
                  context.watch<RaisePageModel>().title,
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          selected
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
            child: Text(
              context.watch<RaisePageModel>().guestText,
            ),
          ),
          const Expanded(child: SizedBox()),
          selected
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
                    onPressed: () {
                      if (context.read<RaisePageModel>().title == "Expert") {
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => CardsPage()));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => MyAccountPage()));
                      }
                    },
                    child: const Text('Raise Status'),
                  ),
                ),
        ],
      ),
    );
  }
}
