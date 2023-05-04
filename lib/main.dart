import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telcell_copy/pageModels/home_page_model.dart';
import 'package:telcell_copy/pages/add_credit_card_page.dart';
import 'pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (context) => ChangeNotifierProvider(
              create: (context) => HomeScreenModel(),
              child: HomeScreen(),
            ),
        '/credit_cards_page/bindbtn': (context) => const AddCard(),
      },
      initialRoute: '/',
      //home: HomeScreen(),
    );
  }
}
