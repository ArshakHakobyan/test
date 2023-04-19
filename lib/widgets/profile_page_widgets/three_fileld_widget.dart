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
      height: hasAmountField ? 200 : 180,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  //crossAxisAlignment: ,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: InkWell(
                        child: Icon(
                          firstIcon,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                    Text(
                      //' Finance',
                      firstTitle,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                          child: Icon(
                        Icons.arrow_forward_ios,
                        size: hasAmountField ? 14 : 16,
                        color: Colors.grey,
                      )),
                    ),
                  ],
                ),
                hasAmountField
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.13),
                        child: Row(
                          children: const [
                            Text(
                              "Amount:",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text("0"),
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          const Divider(
            height: 3,
            color: Color.fromARGB(255, 236, 235, 235),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: InkWell(
                        child: Icon(
                          //Icons.history,
                          secondIcon,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                    Text(
                      //' Payments History',
                      secondTitle,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: hasAmountField ? 14 : 16,
                            color: Colors.grey,
                          )),
                    ),
                  ],
                ),
                hasAmountField
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.13),
                        child: Row(
                          children: const [
                            Text(
                              "Amount:",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text("0"),
                          ],
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                      )
              ],
            ),
          ),
          const Divider(
            height: 3,
            color: Color.fromARGB(255, 236, 235, 235),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  //crossAxisAlignment: ,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: InkWell(
                        child: Icon(
                          thirdIcon,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                    Text(
                      //' Payment invoices',
                      thirdTitle,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                          child: Icon(
                        Icons.arrow_forward_ios,
                        size: hasAmountField ? 14 : 16,
                        color: Colors.grey,
                      )),
                    ),
                  ],
                ),
                hasAmountField
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.13),
                        child: Row(
                          children: const [
                            Text(
                              "Amount:",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text("0"),
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
