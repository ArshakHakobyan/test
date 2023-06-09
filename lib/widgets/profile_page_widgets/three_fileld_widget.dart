import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ThreeFileldWidget extends StatelessWidget {
  Widget? firstFieldroute;
  Widget? secondFieldroute;
  Widget? thirdFieldroute;
  bool hasAmountField = false;
  IconData firstIcon;
  IconData secondIcon;
  IconData thirdIcon;
  String firstTitle;
  String secondTitle;
  String thirdTitle;
  ThreeFileldWidget(
      {super.key,
      required this.hasAmountField,
      required this.firstIcon,
      required this.secondIcon,
      required this.thirdIcon,
      required this.firstTitle,
      required this.secondTitle,
      required this.thirdTitle,
      this.firstFieldroute,
      this.secondFieldroute,
      this.thirdFieldroute});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.9,
      height: hasAmountField ? 200 : 175,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          ListTile(
            dense: hasAmountField ? true : false,
            horizontalTitleGap: 0,
            onTap: () {
              if (firstFieldroute != null) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return firstFieldroute!;
                }));
              }
            },
            trailing: const Icon(Icons.arrow_forward_ios),
            leading: Icon(firstIcon),
            subtitle: hasAmountField
                ? Row(
                    children: const [
                      Text(
                        "  Amount:",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("0"),
                    ],
                  )
                : null,
            title: Text(firstTitle, style: const TextStyle(fontSize: 17)),
          ),
          const Divider(height: 1),
          ListTile(
            dense: hasAmountField ? true : false,
            horizontalTitleGap: 0,
            onTap: () {
              if (secondFieldroute != null) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return secondFieldroute!;
                }));
              }
            },
            trailing: const Icon(Icons.arrow_forward_ios),
            leading: Icon(secondIcon),
            subtitle: hasAmountField
                ? Row(
                    children: const [
                      Text(
                        "  Amount:",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("0"),
                    ],
                  )
                : null,
            title: Text(secondTitle, style: const TextStyle(fontSize: 17)),
          ),
          const Divider(height: 1),
          ListTile(
            dense: hasAmountField ? true : false,
            horizontalTitleGap: 0,
            onTap: () {
              if (thirdFieldroute != null) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return thirdFieldroute!;
                }));
              }
            },
            trailing: const Icon(Icons.arrow_forward_ios),
            leading: Icon(thirdIcon),
            subtitle: hasAmountField
                ? Row(
                    children: const [
                      Text(
                        "  Amount:",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("0"),
                    ],
                  )
                : null,
            title: Text(thirdTitle, style: const TextStyle(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}
