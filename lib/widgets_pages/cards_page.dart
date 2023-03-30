import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        title: const Text('"Cards Page"'),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Text('Cards Page'),
      ),
    );
  }
}
