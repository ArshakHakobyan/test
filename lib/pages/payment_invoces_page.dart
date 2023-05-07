import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';

class PaymentInvocies extends StatefulWidget {
  const PaymentInvocies({super.key});

  @override
  State<PaymentInvocies> createState() => _PaymentInvociesState();
}

class _PaymentInvociesState extends State<PaymentInvocies> {
  String selectedButton = ' My Qr Code';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        title: BalanceVisibility(
          isRouted: true,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: selectedButton == 'My Qr Code'
                      ? const Color.fromRGBO(238, 111, 50, 1)
                      : Colors.white,
                  width: 3,
                ))),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedButton = 'My Qr Code';
                      });
                    },
                    child: Center(
                      child: Text("My Qr Code",
                          style: selectedButton == 'My Qr Code'
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
                  color: selectedButton == 'Scan Qr Code'
                      ? const Color.fromRGBO(238, 111, 50, 1)
                      : Colors.white,
                  width: 3,
                ))),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedButton = 'Scan Qr Code';
                    });
                  },
                  child: Center(
                    child: Text("Scan Qr Code",
                        style: selectedButton == 'Scan Qr Code'
                            ? const TextStyle(color: Colors.black)
                            : const TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
