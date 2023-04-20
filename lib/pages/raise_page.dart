import 'package:flutter/material.dart';
import '../widgets/balance_visibility.dart';

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
            title: const BalanceVisibility()),
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
                const WalletStatus(
                  selected: true,
                ),
              ],
            ),
          ),
        ));
  }
}

class WalletStatus extends StatelessWidget {
  final bool selected;
  const WalletStatus({
    super.key,
    required this.selected,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.91,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }
}
