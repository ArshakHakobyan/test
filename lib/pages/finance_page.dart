import 'dart:async';

import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        title: BalanceVisibility(isRouted: true),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 25),
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
                  width: 180,
                  height: 180,
                  child: CircularProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(200, 204, 206, 1)),
                    strokeWidth: 20.0,
                    value: progress,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              const Center(
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Center(child: Text('data')),
                ),
              )
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
