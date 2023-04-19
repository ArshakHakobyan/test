import 'package:flutter/material.dart';

import '../widgets/profile_page_widgets/profile_page_accaunt_container.dart';
import '../widgets/profile_page_widgets/profile_page_avatar.dart';
import '../widgets/profile_page_widgets/three_fileld_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      // Body Container
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(240, 242, 244, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First Container
              const Avatar(),
              OneFileldWidget(),
              ThreeFileldWidget(
                hasAmountField: false,
                firstIcon: Icons.auto_stories,
                secondIcon: Icons.history,
                thirdIcon: Icons.cases_rounded,
                firstTitle: ' Finance',
                secondTitle: ' Payments History',
                thirdTitle: ' Payment invoices',
              ),
              ThreeFileldWidget(
                hasAmountField: true,
                firstIcon: Icons.credit_card,
                secondIcon: Icons.card_membership_sharp,
                thirdIcon: Icons.card_giftcard_rounded,
                firstTitle: ' Bank cards',
                secondTitle: ' Bonus cards',
                thirdTitle: ' Gift cards',
              ),
              ThreeFileldWidget(
                hasAmountField: false,
                firstIcon: Icons.location_on,
                secondIcon: Icons.handshake,
                thirdIcon: Icons.percent_sharp,
                firstTitle: ' Terminals and branches',
                secondTitle: ' Partners and promotions',
                thirdTitle: ' Tickets and coupons',
              ),
              OneFileldWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
