import 'dart:async';

import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  int pressedButtonNumber = 0;
  double progress = 0;
  Timer? timer;

  String pressedButton = "January";
  void handleButtonClick(String buttonName) {
    setState(() {
      pressedButton = buttonName;
    });
  }

  void startProgress() {
    timer = Timer.periodic(const Duration(milliseconds: 5), (timer) {
      if (progress > 1) {
        timer.cancel();
      }
      setState(() {
        progress += 0.0048;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startProgress();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        title: BalanceVisibility(isRouted: true),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 30),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "January",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 15),
                    BuildButton(
                      buttonName: "February",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "March",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "April",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "May",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "June",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "July",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "August",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "September",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "October",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "November",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                    BuildButton(
                      buttonName: "December",
                      callback: handleButtonClick,
                      pressedButtonName: pressedButton,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 170,
                  height: 170,
                  child: CircularProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(200, 204, 206, 1)),
                    strokeWidth: 20.0,
                    value: progress,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '0',
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        'Դ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(141, 144, 145, 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      pressedButtonNumber = 0;
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(231, 234, 234, 1),
                        border: Border(
                            bottom: BorderSide(
                          color: pressedButtonNumber == 0
                              ? const Color.fromRGBO(238, 111, 50, 1)
                              : const Color.fromARGB(255, 255, 255, 255),
                          width: 2.0,
                        ))),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Outflow",
                            style: TextStyle(
                              color: pressedButtonNumber == 0
                                  ? const Color.fromRGBO(238, 111, 50, 1)
                                  : Colors.grey,
                              fontSize: 18,
                              fontWeight: pressedButtonNumber == 0
                                  ? FontWeight.w500
                                  : FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.arrow_downward,
                            color: pressedButtonNumber == 0
                                ? const Color.fromRGBO(238, 111, 50, 1)
                                : Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Terminal button
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      pressedButtonNumber = 1;
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(231, 234, 234, 1),
                        border: Border(
                            bottom: BorderSide(
                          color: pressedButtonNumber == 1
                              ? const Color.fromRGBO(238, 111, 50, 1)
                              : const Color.fromARGB(255, 255, 255, 255),
                          width: 2.0,
                        ))),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Inflow",
                            style: TextStyle(
                              color: pressedButtonNumber == 1
                                  ? const Color.fromRGBO(238, 111, 50, 1)
                                  : Colors.grey,
                              fontSize: 18,
                              fontWeight: pressedButtonNumber == 1
                                  ? FontWeight.w500
                                  : FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.arrow_downward,
                            color: pressedButtonNumber == 1
                                ? const Color.fromRGBO(238, 111, 50, 1)
                                : Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BuildButton extends StatelessWidget {
  String buttonName;
  String pressedButtonName;
  Function callback;
  BuildButton(
      {super.key,
      required this.buttonName,
      required this.callback,
      required this.pressedButtonName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 150,
      child: Material(
        color: pressedButtonName == buttonName
            ? const Color.fromRGBO(238, 111, 50, 1)
            : const Color.fromRGBO(
                241, 242, 244, 1), // задаем цвет фона Material
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            callback(buttonName);
          },
          child: Center(
              child: Text(
            buttonName,
            style: TextStyle(
                color: pressedButtonName == buttonName
                    ? Colors.white
                    : const Color.fromRGBO(172, 178, 182, 1),
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
