import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';

import '../widgets/therm_page_row_widget.dart';

class AboutTermsOfOffer extends StatelessWidget {
  const AboutTermsOfOffer({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  BalanceVisibility(),
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(240, 242, 244, 1),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 18, left: 10),
                  child: Text(
                    'Offer',
                    style: TextStyle(
                        color: Color.fromARGB(255, 170, 169, 169),
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.068,
                right: MediaQuery.of(context).size.width * 0.068,
                top: MediaQuery.of(context).size.height * 0.07,
                bottom: MediaQuery.of(context).size.height * 0.06,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'PUBLIC AGREEMENT ON PROVISION ON SERVICES WITH\n\n                              ELECTRONIC FUNDS',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const ThermsPageRowWidget(
              text: '1. General Provision',
            ),
            const ThermsPageRowWidget(
              text: '2. Main cocepts',
            ),
            const ThermsPageRowWidget(
              text: '3. Provision of an account and terms of its use',
            ),
            const ThermsPageRowWidget(
              text:
                  '4. Replenishment of the Account, repayment, conversion, transfer from the Account, the value of the electronic money, expiration date, performance of transactions on the Account and closing of the account',
            ),
            const ThermsPageRowWidget(
              text: '5. User Identification',
            ),
            const ThermsPageRowWidget(
              text: '6 Rights and obligations of the Parties',
            ),
            const ThermsPageRowWidget(
              text: '7. Conclusion (acceptance) and duration of the Agreement',
            ),
            const ThermsPageRowWidget(
              text: '8. Confidentiality',
            ),
            const ThermsPageRowWidget(
              text: '9. Responsibility and impact of superior force',
            ),
            const ThermsPageRowWidget(
              text: '10. other provisions',
            ),
            const ThermsPageRowWidget(
              text: '11. Issuers detauils',
            ),
            const ThermsPageRowWidget(
              text: '12. Procedure of complains handling',
            ),
            const ThermsPageRowWidget(
              text: '13. Repeat',
            ),
            const ThermsPageRowWidget(
              text: '1. General Provision',
            ),
            const ThermsPageRowWidget(
              text: '2. Main cocepts',
            ),
            const ThermsPageRowWidget(
              text: '3. Provision of an account and terms of its use',
            ),
            const ThermsPageRowWidget(
              text:
                  '4. Replenishment of the Account, repayment, conversion, transfer from the Account, the value of the electronic money, expiration date, performance of transactions on the Account and closing of the account',
            ),
            const ThermsPageRowWidget(
              text: '5. User Identification',
            ),
            const ThermsPageRowWidget(
              text: '6 Rights and obligations of the Parties',
            ),
            const ThermsPageRowWidget(
              text: '7. Conclusion (acceptance) and duration of the Agreement',
            ),
            const ThermsPageRowWidget(
              text: '8. Confidentiality',
            ),
            const ThermsPageRowWidget(
              text: '9. Responsibility and impact of superior force',
            ),
            const ThermsPageRowWidget(
              text: '10. other provisions',
            ),
            const ThermsPageRowWidget(
              text: '11. Issuers detauils',
            ),
            const ThermsPageRowWidget(
              text: '12. Procedure of complains handling',
            ),
            const ThermsPageRowWidget(
              text: '13. Repeat',
            ),
          ],
        )),
      ),
    );
  }
}
