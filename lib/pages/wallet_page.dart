import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'search_page.dart';
import '../widgets_containers/first_page_container.dart';
import '../widgets_containers/first_page_container2.dart';
import 'notifications.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  bool isVisible = true;
  late DateTime now;
  void visibilityToggle() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void toNotifications({String? choosePage}) {
    final navigator = Navigator.of(context);
    if (choosePage == 'searchPage') {
      navigator.push(
          MaterialPageRoute<void>(builder: (context) => const SearchPage()));
      setState(() {});
    } else {
      navigator.push(
          MaterialPageRoute<void>(builder: (context) => const Notifications()));
      setState(() {});
    }
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
    //DateFormat.y

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
              onPressed: () {},
              icon: const Icon(Icons.home_outlined),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                toNotifications(choosePage: 'searchPage');
              },
              icon: const Icon(Icons.search_outlined),
              iconSize: 30,
            )
          ],
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 85),
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
                    height: 230,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          formateDate,
                          style: const TextStyle(
                              color: Color.fromRGBO(248, 192, 162, 1),
                              fontSize: 13),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            isVisible
                                ? ShowMoneyField(onPressed: visibilityToggle)
                                : HiddenMoneyField(onPressed: visibilityToggle),
                          ],
                        ),

                        //unlocked ballance row

                        const SizedBox(height: 5),
                        const Text(
                          'Current balance',
                          style: TextStyle(
                              color: Color.fromRGBO(248, 192, 162, 1),
                              fontSize: 13),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                            height: 18,
                            width: 82,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      const Color.fromRGBO(246, 246, 247, 0.3)),
                                  foregroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 251, 253, 255)),
                                  shape: const MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))))),
                              child: const Text(
                                'Replenish',
                                style: TextStyle(fontSize: 11),
                              ),
                            )),
                        //Eye Row //Eye Row
                      ],
                    ),
                  ),
                ),
                Positioned(
                  width: 380, //for scroll view
                  bottom: 0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                          'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled.png?raw=true',
                        )),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled1.png?raw=true')),
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                                'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled2.png?raw=true')),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled3.png?raw=true')),
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                          'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled4.png?raw=true',
                        )),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled5.png?raw=true')),
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                                'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled6.png?raw=true')),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled7.png?raw=true')),
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                                'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled8.png?raw=true')),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled9.png?raw=true')),
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                                'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled10.png?raw=true')),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://github.com/ArshakHakobyan/Pics/blob/main/Untitled11.png?raw=true')),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Wallet',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(width: 15),
                WalletContainer(
                  image: Image.network(
                      'https://github.com/ArshakHakobyan/Pics/blob/main/Arrow1.png?raw=true'),
                ),
                const SizedBox(width: 10),
                WalletContainer(
                  image: Image.network(
                      'https://github.com/ArshakHakobyan/Pics/blob/main/arrow2.png?raw=true'),
                ),
                const SizedBox(width: 10),
                WalletContainer(
                  image: Image.network(
                      'https://github.com/ArshakHakobyan/Pics/blob/main/arrow3.png?raw=true'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(width: 15),
                WalletContainer(
                  image: Image.network(
                      'https://github.com/ArshakHakobyan/Pics/blob/main/arrow4.png?raw=true'),
                ),
                const SizedBox(width: 10),
                WalletContainer(
                  image: Image.network(
                      'https://github.com/ArshakHakobyan/Pics/blob/main/arrow5.png?raw=true'),
                ),
                const SizedBox(width: 10),
                WalletContainer(
                  image: Image.network(
                      'https://github.com/ArshakHakobyan/Pics/blob/main/arrow6.png?raw=true'),
                ),
              ],
            ),
          ],
        ));
  }
}
