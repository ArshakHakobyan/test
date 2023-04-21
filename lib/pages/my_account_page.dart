import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';
import 'package:telcell_copy/widgets/icon_images.dart';

import '../widgets/wallet_page_widgets/wallet_button.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => MyAccountPageState();
}

class MyAccountPageState extends State<MyAccountPage> {
  String selectedButton = 'Banks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        title: const BalanceVisibility(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: selectedButton == 'Banks'
                          ? const Color.fromRGBO(238, 111, 50, 1)
                          : Colors.white,
                      width: 3,
                    ))),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedButton = 'Banks';
                          });
                        },
                        style: ButtonStyle(
                          visualDensity: VisualDensity.compact,
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        child: Text("Banks",
                            style: selectedButton == 'Banks'
                                ? const TextStyle(color: Colors.black)
                                : const TextStyle(color: Colors.grey))),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: selectedButton == 'My Account'
                          ? const Color.fromRGBO(238, 111, 50, 1)
                          : Colors.white,
                      width: 3,
                    ))),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 'My Account';
                        });
                      },
                      style: const ButtonStyle(
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Text("My Account",
                          style: selectedButton == 'My Account'
                              ? const TextStyle(color: Colors.black)
                              : const TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: selectedButton == 'Banks' ? const Banks() : const Myaccounts(),
    );
  }
}

class Banks extends StatelessWidget {
  const Banks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      color: const Color.fromRGBO(241, 242, 244, 1),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WalletContainer(
                        image: Image(
                      image: IconImages().iconImage,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WalletContainer(
                        image: Image(
                      image: IconImages().iconImage,
                    )),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class Myaccounts extends StatelessWidget {
  const Myaccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      color: const Color.fromRGBO(241, 242, 244, 1),
    );
  }
}
