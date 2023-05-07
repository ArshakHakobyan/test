import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';
import '../pageModels/finance_page_model.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

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
            child: Consumer<FinancePageModel>(
              builder: (BuildContext context, value, Widget? child) {
                return SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    controller: value.scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "January",
                          callback: value.handleButtonClick,
                          buttonNumber: 0,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 15),
                        BuildButton(
                          buttonName: "February",
                          buttonNumber: 1,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "March",
                          buttonNumber: 2,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "April",
                          buttonNumber: 3,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "May",
                          buttonNumber: 4,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "June",
                          buttonNumber: 5,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "July",
                          buttonNumber: 6,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "August",
                          buttonNumber: 7,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "September",
                          buttonNumber: 8,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "October",
                          buttonNumber: 9,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "November",
                          buttonNumber: 10,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                        BuildButton(
                          buttonName: "December",
                          buttonNumber: 11,
                          callback: value.handleButtonClick,
                          pressedButtonName: value.pressedButton,
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 300,
            child: Consumer<FinancePageModel>(
              builder: (BuildContext context, value1, Widget? child) {
                return PageView(
                  onPageChanged: (int value) =>
                      value1.setPressedButtonnumber(value),
                  controller: value1.pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        CircleWidget(
                            progress:
                                context.watch<FinancePageModel>().progress),
                        const SizedBox(height: 20),
                        OutFlowInflow(
                            pressedButtonNumber: context
                                .read<FinancePageModel>()
                                .outFlowInflowButtonNumber),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class OutFlowInflow extends StatelessWidget {
  OutFlowInflow({
    super.key,
    required this.pressedButtonNumber,
  });

  int pressedButtonNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              context.read<FinancePageModel>().setOutFlowInflowButtonNumber(0);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(231, 234, 234, 1),
                  border: Border(
                      bottom: BorderSide(
                    color: context
                                .watch<FinancePageModel>()
                                .outFlowInflowButtonNumber ==
                            0
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
                        color: context
                                    .watch<FinancePageModel>()
                                    .outFlowInflowButtonNumber ==
                                0
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
                      color: context
                                  .watch<FinancePageModel>()
                                  .outFlowInflowButtonNumber ==
                              0
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
              context.read<FinancePageModel>().setOutFlowInflowButtonNumber(1);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(231, 234, 234, 1),
                  border: Border(
                      bottom: BorderSide(
                    color: context
                                .watch<FinancePageModel>()
                                .outFlowInflowButtonNumber ==
                            1
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
                        color: context
                                    .watch<FinancePageModel>()
                                    .outFlowInflowButtonNumber ==
                                1
                            ? const Color.fromARGB(255, 50, 238, 66)
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
                      color: context
                                  .watch<FinancePageModel>()
                                  .outFlowInflowButtonNumber ==
                              1
                          ? const Color.fromARGB(255, 50, 238, 66)
                          : Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

// ignore: must_be_immutable
class BuildButton extends StatelessWidget {
  String buttonName;
  String pressedButtonName;
  Function callback;
  int buttonNumber;
  BuildButton(
      {super.key,
      required this.buttonName,
      required this.callback,
      required this.pressedButtonName,
      required this.buttonNumber});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 150,
      child: Material(
        color: pressedButtonName == buttonName ||
                buttonNumber ==
                    context.watch<FinancePageModel>().pressedButtonNumber
            ? const Color.fromRGBO(238, 111, 50, 1)
            : const Color.fromRGBO(
                241, 242, 244, 1), // задаем цвет фона Material
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            callback(buttonName, buttonNumber);
          },
          child: Center(
              child: Text(
            buttonName,
            style: TextStyle(
                color: pressedButtonName == buttonName ||
                        buttonNumber ==
                            context
                                .watch<FinancePageModel>()
                                .pressedButtonNumber
                    ? Colors.white
                    : const Color.fromRGBO(172, 178, 182, 1),
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
