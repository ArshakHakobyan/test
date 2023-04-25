import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ThreeFileldWidget extends StatelessWidget {
  bool hasAmountField = false;
  IconData firstIcon;
  IconData secondIcon;
  IconData thirdIcon;
  String firstTitle;
  String secondTitle;
  String thirdTitle;
  ThreeFileldWidget({
    super.key,
    required this.hasAmountField,
    required this.firstIcon,
    required this.secondIcon,
    required this.thirdIcon,
    required this.firstTitle,
    required this.secondTitle,
    required this.thirdTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.9,
      height: hasAmountField ? 200 : 195,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          ListTile(
            horizontalTitleGap: 0,
            dense: true,
            onTap: () {},
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
                : const SizedBox(),
            title: Text(firstTitle, style: const TextStyle(fontSize: 17)),
          ),
          const Divider(height: 1),
          ListTile(
            horizontalTitleGap: 0,
            dense: true,
            onTap: () {},
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
                : const SizedBox(),
            title: Text(secondTitle, style: const TextStyle(fontSize: 17)),
          ),
          const Divider(height: 1),
          ListTile(
            horizontalTitleGap: 0,
            dense: true,
            onTap: () {},
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
                : const SizedBox(),
            title: Text(thirdTitle, style: const TextStyle(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}
