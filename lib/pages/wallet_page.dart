import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telcell_copy/pages/my_account_page.dart';
import 'package:telcell_copy/pages/replenish_page.dart';

import 'package:telcell_copy/widgets/balance_visibility.dart';
import 'package:telcell_copy/widgets/advertising_image_progress_bar.dart';
import 'search_page.dart';
import 'package:telcell_copy/widgets/wallet_page_widgets/advertising_container.dart';
import 'package:telcell_copy/widgets/wallet_page_widgets/icon_button.dart';
import 'notifications_page.dart';
import 'package:telcell_copy/widgets/icon_images.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  late DateTime now;

  void toNotifications({String? choosePage}) {
    if (choosePage == 'searchPage') {
      Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => const SearchPage()));
    } else {
      Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => const Notifications()));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    String formateDate =
        "${DateFormat.yMMMMEEEEd().format(now)} ${DateFormat.Hm().format(now)}"; //interpolation use???

    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 242, 244, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
          leading: IconButton(
            onPressed: toNotifications,
            icon: const Icon(Icons.notifications),
            iconSize: 30,
          ),
          actions: [
            IconButton(
              onPressed: () {
                toNotifications(choosePage: 'searchPage');
              },
              icon: const Icon(Icons.search_outlined),
              iconSize: 30,
              padding: const EdgeInsets.only(right: 10),
            )
          ],
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.109),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(238, 111, 50, 1),
                        Color.fromRGBO(238, 130, 50, 0.6),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    //height: 230,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          formateDate,
                          style: const TextStyle(
                              color: Color.fromRGBO(248, 192, 162, 1),
                              fontSize: 13),
                        ),
                        BalanceVisibility(),

                        //unlocked ballance row

                        const SizedBox(height: 5),
                        const Text(
                          'Current balance',
                          style: TextStyle(
                              color: Color.fromRGBO(248, 192, 162, 1),
                              fontSize: 13),
                        ),

                        ButtonTheme(
                          minWidth: 0,
                          height: 0,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const ReplenishPage();
                              }));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(246, 246, 247, 0.3),
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 251, 253, 255),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all<Size>(Size.zero),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 2),
                              ),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            child: const Text('Replenish'),
                          ),
                        )
                        //Eye Row //Eye Row
                      ],
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width, //for scroll view
                  bottom: 0,
                  //
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    //old version of advertising scroll view need Update!!!
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        AdvertisingContainer(
                            routeToWidget: MyAccountPage(
                              toggleForPageChoose: 'My Account',
                            ),
                            image: Image(
                              image: IconImages().advertisingImage,
                            )),
                        const SizedBox(width: 10),
                        AdvertisingContainer(
                            routeToWidget: ProgressBarAdvertising(
                              advertisingImage: Image(
                                image: IconImages().progressBarImage2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            image: Image(
                              image: IconImages().advertisingImage12,
                            )),
                        const SizedBox(width: 10),
                        AdvertisingContainer(
                            routeToWidget: ProgressBarAdvertising(
                              advertisingImage: Image(
                                image: IconImages().progressBarImage1,
                                fit: BoxFit.cover,
                              ),
                            ),
                            image: Image(
                              image: IconImages().advertisingImage11,
                            )),
                        const SizedBox(width: 10),
                        AdvertisingContainer(
                            routeToWidget: ProgressBarAdvertising(
                              advertisingImage: Image(
                                image: IconImages().progressBarImage3,
                                fit: BoxFit.cover,
                              ),
                            ),
                            image: Image(
                              image: IconImages().advertisingImage2,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        AdvertisingContainer(
                            image: Image(
                          image: IconImages().advertisingImage3,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        AdvertisingContainer(
                            image: Image(
                          image: IconImages().advertisingImage4,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        AdvertisingContainer(
                            image: Image(
                          image: IconImages().advertisingImage5,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        AdvertisingContainer(
                            image: Image(
                          image: IconImages().advertisingImage6,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        AdvertisingContainer(
                            image: Image(
                          image: IconImages().advertisingImage7,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        AdvertisingContainer(
                            image: Image(
                          image: IconImages().advertisingImage8,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        AdvertisingContainer(
                            image: Image(
                          image: IconImages().advertisingImage9,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        AdvertisingContainer(
                            image: Image(
                          image: IconImages().advertisingImage10,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        AdvertisingContainer(
                            image: Image(
                          image: IconImages().advertisingImage1,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 3),
            const Text(
              'Wallet',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  runSpacing: 10,
                  spacing: 15,
                  children: [
                    SmallIconButton(
                        routeToWidget: const ReplenishPage(),
                        image: Image(
                          image: IconImages().iconImage,
                        )),
                    SmallIconButton(
                        image: Image(
                      image: IconImages().iconImage1,
                    )),
                    SmallIconButton(
                        image: Image(
                      image: IconImages().iconImage2,
                    )),
                    SmallIconButton(
                        image: Image(
                      image: IconImages().iconImage3,
                    )),
                    SmallIconButton(
                        image: Image(
                      image: IconImages().iconImage4,
                    )),
                    SmallIconButton(
                        image: Image(
                      image: IconImages().iconImage5,
                    )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
