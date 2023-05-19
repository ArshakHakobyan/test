import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:telcell_copy/widgets/balance_visibility.dart';
import 'package:telcell_copy/widgets/icon_images.dart';
import '../page_models/payments_hystory_page_model.dart';

// ignore: must_be_immutable
class PaymentsHistoryPage extends StatelessWidget {
  List<Widget> buttonToWidget = [
    const TelcellWallet(),
    const Terminal(),
    const Accounts()
  ];

  PaymentsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BalanceVisibility(
          isRouted: true,
        ),
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
      ),
      body: Column(
        children: [
          //Buttons Bar "Telcell Wallet, Terminal, Accounts"
          Ink(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                //Telcell Wallet button
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context
                          .read<PaymentsHistoryPageModel>()
                          .animateTo(page: 0);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: context
                                    .watch<PaymentsHistoryPageModel>()
                                    .pressedButtonNumber ==
                                0
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : const Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ))),
                      child: Center(
                        child: Text(
                          "Telcell Wallet",
                          style: TextStyle(
                            color: context
                                        .watch<PaymentsHistoryPageModel>()
                                        .pressedButtonNumber ==
                                    0
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 15,
                            fontWeight: context
                                        .watch<PaymentsHistoryPageModel>()
                                        .pressedButtonNumber ==
                                    0
                                ? FontWeight.w500
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //Terminal button
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context
                          .read<PaymentsHistoryPageModel>()
                          .animateTo(page: 1);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: context
                                    .watch<PaymentsHistoryPageModel>()
                                    .pressedButtonNumber ==
                                1
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : const Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ))),
                      child: Center(
                        child: Text(
                          "Terminal",
                          style: TextStyle(
                            color: context
                                        .watch<PaymentsHistoryPageModel>()
                                        .pressedButtonNumber ==
                                    1
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 15,
                            fontWeight: context
                                        .watch<PaymentsHistoryPageModel>()
                                        .pressedButtonNumber ==
                                    1
                                ? FontWeight.w500
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //Accounts button
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context
                          .read<PaymentsHistoryPageModel>()
                          .animateTo(page: 2);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: context
                                    .watch<PaymentsHistoryPageModel>()
                                    .pressedButtonNumber ==
                                2
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : const Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ))),
                      child: Center(
                        child: Text(
                          "Accounts",
                          style: TextStyle(
                            color: context
                                        .watch<PaymentsHistoryPageModel>()
                                        .pressedButtonNumber ==
                                    2
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 15,
                            fontWeight: context
                                        .watch<PaymentsHistoryPageModel>()
                                        .pressedButtonNumber ==
                                    2
                                ? FontWeight.w500
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller:
                  context.watch<PaymentsHistoryPageModel>().pageController,
              onPageChanged: (int index) {
                context
                    .read<PaymentsHistoryPageModel>()
                    .pageNumber(pageNum: index);
              },
              scrollDirection: Axis.horizontal,
              children: [
                buttonToWidget[0],
                buttonToWidget[1],
                buttonToWidget[2],
              ],
            ),
          )
          //buttonToWidget[pressedButtonNumber],
        ],
      ),
    );
  }
}

class TelcellWallet extends StatelessWidget {
  const TelcellWallet({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> mapsOfPayments =
        Provider.of<PaymentsHistoryPageModel>(context).mapsOfPaymentsForWallet;
    return Container(
      color: const Color.fromRGBO(240, 242, 244, 1),
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              // Total This month container
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.085,
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        DateTime mySelectedDay = DateTime.now();

                        return AlertDialog(
                          contentPadding:
                              const EdgeInsets.only(left: 10, right: 10),
                          title: const Center(
                              child: Text(
                            "Calendar",
                            style: TextStyle(
                                color: Color.fromRGBO(238, 111, 50, 1)),
                          )),
                          content: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return SizedBox(
                                height: 340,
                                width: 340,
                                child: TableCalendar(
                                  calendarStyle: const CalendarStyle(
                                    weekendTextStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  headerStyle: const HeaderStyle(
                                      formatButtonVisible: false,
                                      titleCentered: true),
                                  rowHeight: 42,
                                  firstDay: DateTime.utc(2021, 10, 16),
                                  lastDay: DateTime.utc(2030, 3, 14),
                                  focusedDay: DateTime.now(),
                                  currentDay: mySelectedDay,
                                  availableCalendarFormats: const {
                                    CalendarFormat.month: 'Month',
                                  },
                                  selectedDayPredicate: (day) {
                                    return isSameDay(mySelectedDay, day);
                                  },
                                  onDaySelected: (selectedDay, focusedDay) {
                                    setState(() {
                                      mySelectedDay = selectedDay;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  horizontalTitleGap: -5,
                  leading: const Icon(
                    Icons.calendar_month,
                    color: Color.fromRGBO(238, 111, 50, 1),
                    size: 26,
                  ),
                  title: const Text(
                    'Total this month',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          context
                              .read<PaymentsHistoryPageModel>()
                              .getTotalAmount(mapsOfPayments: mapsOfPayments)
                              .toString(),
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        '0.0 AMD',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              // Current day

              BuildFromDbdata(
                mapsOfPayments: mapsOfPayments,
                image: IconImages().tImage,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Terminal extends StatelessWidget {
  const Terminal({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> mapsOfPaymentsTerminal =
        Provider.of<PaymentsHistoryPageModel>(context)
            .mapsOfPaymentsForTerminal;

    return Container(
      color: const Color.fromRGBO(240, 242, 244, 1),
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              BuildFromDbdata(
                mapsOfPayments: mapsOfPaymentsTerminal,
                image: IconImages().terminalImage,
              )
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Accounts extends StatelessWidget {
  const Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> mapsOfPayments =
        Provider.of<PaymentsHistoryPageModel>(context).mapsOfPaymentsForWallet;
    return Container(
      color: const Color.fromRGBO(240, 242, 244, 1),
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Column(
            children: [
              // Total This month container
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.085,
                color: Colors.white,
                child: ListTile(
                  onTap: () {},
                  horizontalTitleGap: -5,
                  leading: const Icon(
                    Icons.calendar_month,
                    color: Color.fromRGBO(238, 111, 50, 1),
                    size: 26,
                  ),
                  title: const Text(
                    'Total this month',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          context
                              .read<PaymentsHistoryPageModel>()
                              .getTotalAmount(mapsOfPayments: mapsOfPayments)
                              .toString(),
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        '0.0 AMD',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: const Text(
                  'There are no payments',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BuildFromDbdata extends StatelessWidget {
  final List<Map> mapsOfPayments;
  final ImageProvider<Object> image;
  const BuildFromDbdata({
    super.key,
    required this.mapsOfPayments,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(mapsOfPayments.length, (index) {
        final bool sameDay = index > 0 &&
            mapsOfPayments[index]['day'] == mapsOfPayments[index - 1]['day'];

        return Column(
          children: [
            if (!sameDay) // esli data ne povtoriaetsia, sozdaem data v etoi stroke
              Padding(
                padding: const EdgeInsets.only(left: 6, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      mapsOfPayments[index]['day'],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 84, 84, 84)),
                    ),
                  ],
                ),
              ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.95,
              height: 67,
              child: ListTile(
                horizontalTitleGap: 0,
                //leading Icon
                leading: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 27,
                      child: Image(image: image),
                    ),
                  ],
                ),
                title: Text(
                  mapsOfPayments[index]['what_service'],
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  mapsOfPayments[index]['phone_number'],
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 3),
                      child: Text(
                        mapsOfPayments[index]['amount'] + " AMD",
                        style: const TextStyle(
                            color: Color.fromRGBO(239, 83, 80, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Repeat',
                        style: TextStyle(
                            color: Color.fromRGBO(239, 83, 80, 1),
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
