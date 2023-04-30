import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
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
            padding: const EdgeInsets.only(top: 15.0, bottom: 10),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 120,
                      child: Material(
                        color: const Color.fromRGBO(
                            238, 111, 50, 1), // задаем цвет фона Material
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: const Center(
                              child: Text(
                            "September",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
