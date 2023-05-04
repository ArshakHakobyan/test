import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telcell_copy/pages/payments_history_page.dart';
import '../pageModels/payments_hystory_page_model.dart';
import '../widgets/profile_page_widgets/account_field_widget.dart';
import 'package:telcell_copy/widgets/profile_page_widgets/avatar_widget.dart';
import '../widgets/profile_page_widgets/cards_and_fines_field.dart';
import '../widgets/profile_page_widgets/contact_us_widget.dart';
import '../widgets/profile_page_widgets/exit_widget.dart';
import '../widgets/profile_page_widgets/property_tax_widget.dart';
import '../widgets/profile_page_widgets/settings_widget.dart';
import '../widgets/profile_page_widgets/three_fileld_widget.dart';
import 'finance_page.dart';

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
              const OneFileldWidget(),
              ThreeFileldWidget(
                hasAmountField: false,
                firstIcon: Icons.auto_stories,
                secondIcon: Icons.history,
                thirdIcon: Icons.cases_rounded,
                firstTitle: ' Finance',
                secondTitle: ' Payments History',
                thirdTitle: ' Payment invoices',
                firstFieldroute: const FinancePage(),
                secondFieldroute: ChangeNotifierProvider(
                  create: (context) {
                    return PaymentsHistoryPageModel();
                  },
                  child: PaymentsHistoryPage(),
                ),
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
              const CarsAndFines(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Divider(
                  height: 1,
                ),
              ),
              const PropertyTax(),
              const Settings(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Divider(
                  height: 1,
                ),
              ),
              const ContactUs(),
              const Exit()
            ],
          ),
        ),
      ),
    );
  }
}
