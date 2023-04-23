import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';

class RegistratinPage extends StatefulWidget {
  const RegistratinPage({super.key});
  @override
  State<RegistratinPage> createState() {
    return RegistratinPageState();
  }
}

class RegistratinPageState extends State<RegistratinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BalanceVisibility(),
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
