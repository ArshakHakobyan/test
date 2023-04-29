import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';
import 'package:telcell_copy/widgets/icon_images.dart';
import '../widgets/db.dart';

class PaymentsHistoryPage extends StatefulWidget {
  const PaymentsHistoryPage({super.key});
  @override
  State<PaymentsHistoryPage> createState() {
    return PaymentsHistoryPageState();
  }
}

class PaymentsHistoryPageState extends State<PaymentsHistoryPage> {
  int pressedButtonNumber = 0;
  List<Widget> buttonToWidget = [
    const TelcellWallet(),
    const Terminal(),
    const Accounts()
  ];
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
                      setState(() {
                        //sets first buttons number
                        pressedButtonNumber = 0;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: pressedButtonNumber == 0
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : const Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ))),
                      child: Center(
                        child: Text(
                          "Telcell Wallet",
                          style: TextStyle(
                            color: pressedButtonNumber == 0
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 15,
                            fontWeight: pressedButtonNumber == 0
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
                      setState(() {
                        pressedButtonNumber = 1;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: pressedButtonNumber == 1
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : const Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ))),
                      child: Center(
                        child: Text(
                          "Terminal",
                          style: TextStyle(
                            color: pressedButtonNumber == 1
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 15,
                            fontWeight: pressedButtonNumber == 1
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
                      setState(() {
                        pressedButtonNumber = 2;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: pressedButtonNumber == 2
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : const Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ))),
                      child: Center(
                        child: Text(
                          "Accounts",
                          style: TextStyle(
                            color: pressedButtonNumber == 2
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 15,
                            fontWeight: pressedButtonNumber == 2
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
          buttonToWidget[pressedButtonNumber],
        ],
      ),
    );
  }
}

class TelcellWallet extends StatefulWidget {
  const TelcellWallet({super.key});
  @override
  State<TelcellWallet> createState() {
    return TelcellWalletState();
  }
}

class TelcellWalletState extends State<TelcellWallet> {
  List<Map> mapsOfPayments = [];
  void getDataFromDatabase() async {
    final List<Map> cards =
        await DatabaseHelper.instance.readDataFromDatabase(walletDb: true);
    for (Map item in cards) {
      mapsOfPayments.add(item);
    }
    setState(() {});
  }

  double getTotalAmount({required List<Map> mapsOfPayments}) {
    double total = 0;
    for (int i = 0; i < mapsOfPayments.length; i++) {
      total += double.parse(mapsOfPayments[i]['amount']);
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
                            getTotalAmount(mapsOfPayments: mapsOfPayments)
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

class Terminal extends StatefulWidget {
  const Terminal({super.key});

  @override
  State<Terminal> createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  List<Map> mapsOfPayments = [];
  void getDataFromDatabase() async {
    final List<Map> cards =
        await DatabaseHelper.instance.readDataFromDatabase(terminalDb: true);
    for (Map item in cards) {
      mapsOfPayments.add(item);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromRGBO(240, 242, 244, 1),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                BuildFromDbdata(
                  mapsOfPayments: mapsOfPayments,
                  image: IconImages().terminalImage,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  List<Map> mapsOfPayments = [];

  void getDataFromDatabase() async {
    final List<Map> cards =
        await DatabaseHelper.instance.readDataFromDatabase(walletDb: true);
    for (Map item in cards) {
      mapsOfPayments.add(item);
    }
    setState(() {});
  }

  double getTotalAmount({required List<Map> mapsOfPayments}) {
    double total = 0;
    for (int i = 0; i < mapsOfPayments.length; i++) {
      total += double.parse(mapsOfPayments[i]['amount']);
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
                            getTotalAmount(mapsOfPayments: mapsOfPayments)
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
      ),
    );
  }
}
