import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';
import 'package:telcell_copy/widgets/icon_images.dart';

import '../widgets/wallet_page_widgets/small_icon_button.dart';

// ignore: must_be_immutable
class MyAccountPage extends StatefulWidget {
  String? toggleForPageChoose;
  MyAccountPage({super.key, this.toggleForPageChoose});

  @override
  State<MyAccountPage> createState() => MyAccountPageState();
}

class MyAccountPageState extends State<MyAccountPage> {
  String selectedButton = 'Banks';
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.toggleForPageChoose != null) {
        selectedButton = "My Accounts";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BalanceVisibility(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Ink(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: selectedButton == 'Banks'
                          ? const Color.fromRGBO(238, 111, 50, 1)
                          : Colors.white,
                      width: 3,
                    ))),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedButton = 'Banks';
                          });
                        },
                        child: Center(
                          child: Text("Banks",
                              style: selectedButton == 'Banks'
                                  ? const TextStyle(color: Colors.black)
                                  : const TextStyle(color: Colors.grey)),
                        )),
                  ),
                ),
                Expanded(
                  child: Ink(
                    height: 42,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: selectedButton == 'My Accounts'
                          ? const Color.fromRGBO(238, 111, 50, 1)
                          : Colors.white,
                      width: 3,
                    ))),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedButton = 'My Accounts';
                        });
                      },
                      child: Center(
                        child: Text("My Accounts",
                            style: selectedButton == 'My Accounts'
                                ? const TextStyle(color: Colors.black)
                                : const TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
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
                    child: SmallIconButton(
                        image: Image(
                      image: IconImages().bankImage1,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmallIconButton(
                        image: Image(
                      image: IconImages().bankImage2,
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
