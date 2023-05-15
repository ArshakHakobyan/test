import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telcell_copy/pageModels/add_credit_card_model.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';
import '../pageModels/credit_cards_page_model.dart';
import '../widgets/icon_images.dart';
import 'add_credit_card_page.dart';

// ignore: must_be_immutable
class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 242, 244, 1),
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
            title: BalanceVisibility()),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.63),
                      child: const Text(
                        "Cards",
                        style: TextStyle(
                            color: Color.fromRGBO(176, 190, 198, 1),
                            fontSize: 20),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<CardsPageModel>().deleteCreditCard();
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                            color: Color.fromRGBO(238, 111, 50, 1),
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              //Cards
              context.watch<CardsPageModel>().creditCardsList.isEmpty
                  ? Expanded(
                      child: Center(
                          child: Image(
                        image: IconImages().bodyImage,
                      )),
                    )
                  : Column(
                      children: [
                        Consumer<CardsPageModel>(
                          builder:
                              (BuildContext context, value, Widget? child) {
                            return SizedBox(
                              height: (kToolbarHeight +
                                      kBottomNavigationBarHeight) *
                                  1.9,
                              child: ListView.builder(
                                controller: value.scrollController,
                                itemCount: value.creditCardsList.length,
                                itemBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.91,
                                    child: value.creditCardsList[index],
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            );
                          },
                        )
                      ],
                    ),
              //for Bind Card button addaptive position
              context.watch<CardsPageModel>().creditCardsList.isEmpty
                  ? const SizedBox()
                  : const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChangeNotifierProvider(
                              create: (BuildContext context) {
                                //context.watch();
                                return AddCreditCardModel();
                              },
                              child: AddCard());
                        },
                      ),
                    );

                    Timer(const Duration(seconds: 1), () {
                      context.read<CardsPageModel>().getCreditCardData();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.33,
                      vertical: MediaQuery.of(context).size.height * 0.015,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
                  ),
                  child: const Text('Bind a Card'),
                ),
              )
            ],
          ),
        ));
  }
}
