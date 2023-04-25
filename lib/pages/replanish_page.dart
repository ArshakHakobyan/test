import 'package:flutter/material.dart';

import '../widgets/balance_visibility.dart';
import '../widgets/icon_images.dart';
import '../widgets/wallet_page_widgets/advertising_container.dart';
import '../widgets/wallet_page_widgets/small_icon_button.dart';

class ReplanishPage extends StatefulWidget {
  const ReplanishPage({super.key});
  @override
  State<ReplanishPage> createState() {
    return ReplanishPageState();
  }
}

class ReplanishPageState extends State<ReplanishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BalanceVisibility(),
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5, left: 15),
            child: Row(
              children: const [
                Text(
                  'Telcell Wallet replenishment',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 193, 189, 189)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 15),
                scrollDirection: Axis.horizontal,
                itemCount: IconImages().advertisingImages.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Row(
                    children: [
                      AdvertisingContainer(
                        image: Image(
                          image: IconImages().advertisingImages[index],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          //For flex
          const Expanded(flex: 1, child: SizedBox()),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Wrap(
              runAlignment: WrapAlignment.center,
              runSpacing: 15,
              spacing: 15,
              direction: Axis.horizontal,
              children: List.generate(
                  IconImages().replanishmentPageImages.length,
                  (index) => SmallIconButton(
                      image: Image(
                          image: IconImages().replanishmentPageImages[index]))),
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
