import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:telcell_copy/page_models/home_page_model.dart';
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
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(0, 0, 0, 0),
        ),
      )),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (context) => ChangeNotifierProvider(
              create: (context) => HomeScreenModel(),
              child: HomeScreen(),
            ),
        '/credit_cards_page/bindbtn': (context) => AddCard(),
      },
      initialRoute: '/',
      //home: HomeScreen(),
    );
  }
}
