import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../NavPages/search_page.dart';
import 'widgets_containers/first_page_container.dart';
import 'widgets_containers/first_page_container2.dart';
import 'package:telcell_copy/NavPages/Notifications.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  bool isVisible = true;
  late DateTime now;
  void visibilityTogle() {
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
          MaterialPageRoute<void>(builder: (context) => const Notifivations()));
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
    String formatedDate = DateFormat.yMMMMEEEEd().format(now) +
        " " +
        DateFormat.Hm().format(now); //interpolation use???
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
                          formatedDate,
                          style: const TextStyle(
                              color: Color.fromRGBO(248, 192, 162, 1),
                              fontSize: 13),
                        ),
                        //unlocked ballance row
                        Visibility(
                          visible: isVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              Stack(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, right: 15),
                                    child: Text(
                                      '0.00',
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.white,
                                          fontFamily: AutofillHints
                                              .addressCityAndState),
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Text(
                                        "Դ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      )),
                                ],
                              ),
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    iconSize: 30,
                                    onPressed: () {
                                      visibilityTogle();
                                    },
                                    icon: const Icon(Icons.remove_red_eye),
                                    padding: const EdgeInsets.only(right: 100),
                                    color: Colors.white,
                                  ) //flex: 1,
                                  ),
                            ],
                          ),
                        ),
                        //locket balance row
                        Visibility(
                          visible: !isVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(flex: 5, child: SizedBox()),
                              const Text(
                                '• • • • •',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 50,
                                    color: Colors.white,
                                    fontFamily:
                                        AutofillHints.addressCityAndState),
                              ),
                              IconButton(
                                iconSize: 30,
                                onPressed: () {
                                  visibilityTogle();
                                },
                                icon: const Icon(Icons.lock_open_rounded),
                                padding: const EdgeInsets.only(),
                                color: Colors.white,
                              ),
                              const Expanded(flex: 3, child: SizedBox()),
                            ],
                          ),
                        ),
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
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338186952_2367795656721570_7770813194166009074_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=0bfNWP0NPJkAX9br4tN&_nc_ht=scontent.fevn13-1.fna&oh=00_AfDvplIO5YWOYTx1gPfcLlJAuhoNGHMFqQZ8qdUEBxzwQw&oe=64298CD1')),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338009804_5916000465164490_8524974263632999560_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=rWCzusgszSkAX900YCM&_nc_ht=scontent.fevn13-1.fna&oh=00_AfArDWOKQtJ-nPG705dQX68m-i8dlqSdxSx_WyLduzdG1Q&oe=6429584A')),
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338180922_125914490341401_6278735069520947985_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=pDPGM6nbBSEAX92pqz2&_nc_ht=scontent.fevn13-1.fna&oh=00_AfCNaLlTxF0XmITLusWEbpmbmFb9PCAt9FfbYGu8Ms8qkA&oe=6429F3BC')),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338019924_580052980733807_322066686786572135_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=Pv9hVqlX4TEAX8r_JbV&_nc_ht=scontent.fevn13-1.fna&oh=00_AfCGzwjQRGIoGoLpHDdhAacphQaiPxJU2u-8ruSlDlpvIg&oe=6428B55F')),
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338171271_142631118495069_3445456717025655469_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=o3KxKjMyTEkAX_IcN2h&_nc_ht=scontent.fevn13-1.fna&oh=00_AfAOizDQMUdasi_e40AYVV9NFIBcV67CSGTqhQ1alyP7cg&oe=64295A5E')),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338123650_633527848627027_7701397217161574243_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=p3-iZUcVB4MAX_NBIbU&_nc_ht=scontent.fevn13-1.fna&oh=00_AfDBSExPTenHEwaQCMj8P3NeWs5Yc03vbXXDS63iZhQUnA&oe=64285D63')),
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338172959_771213257828376_3014061086704463755_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=gYLF5qIfWyEAX9-mN7e&_nc_ht=scontent.fevn13-1.fna&oh=00_AfBF_mNUczGC3Dpl_zV8ZYLCEmxmWHgbkxE-HlLhN-sWvw&oe=642A25D0')),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338017275_782066253572791_8041666804647603494_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=o3jqyoPv8poAX8uIXjG&_nc_ht=scontent.fevn13-1.fna&oh=00_AfAkf3euwAh9mZHFVd_KntIlZfkDbTRo4vZUcmJV7R9uyg&oe=64285B75')),
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338020229_225336490071711_1305497327023997589_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=dEBaFI8aH_kAX9cWlM5&_nc_ht=scontent.fevn13-1.fna&oh=00_AfCYsvtRJiC4mWE-L5mfD5GJL20yO_modx3n7I4RXSVX6Q&oe=64294953')),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338031090_1280975612489866_3352271684247662916_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=2jjdKzsqhuAAX-FT7jM&_nc_ht=scontent.fevn13-1.fna&oh=00_AfDDFGlQkdWnkKEb1KAb6jNMNlOe_-Z_VYXS1c6B7vw7OA&oe=64294099')),
                        const SizedBox(width: 12),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338893633_628048502498972_8553201265917140730_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=TFadlJVXmOUAX_39h43&_nc_ht=scontent.fevn13-1.fna&oh=00_AfAQxKb1z1VXIJKgpLR1bTUpPj7WGFnB9R2CaRB1WzvRhA&oe=642883E6')),
                        const SizedBox(width: 10),
                        FirstPageContainer(
                            image: Image.network(
                                'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338025314_880960529654845_3862056811162520704_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=7_dT4aMW8kAAX8aUb5B&_nc_ht=scontent.fevn13-1.fna&oh=00_AfDZNUk4raGr_a7upC4D5sQtnGbyCpBiuT5tkv-d5Jzf6Q&oe=64287597')),
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
                      'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338011409_943334440007529_9057646493261176486_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=0debeb&_nc_ohc=KrLHgKRGa84AX-AUg-O&_nc_ht=scontent.fevn13-1.fna&oh=00_AfBxQyuDgugrpiweDqL9GwDNkq7sOQm1DrvGBJw2VPC3pw&oe=6428EE9C'),
                ),
                const SizedBox(width: 10),
                WalletContainer(
                  image: Image.network(
                      'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338131990_225912339975774_8047313616458864533_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=rR5TFM_yA8cAX87d4bE&_nc_ht=scontent.fevn13-1.fna&oh=00_AfAZUIwObeaAxGTq--bKRk_khWBPjXVIhk3eTRuIm5mRaA&oe=64295DF5'),
                ),
                const SizedBox(width: 10),
                WalletContainer(
                  image: Image.network(
                      'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338023726_483357130551989_493298908120773558_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=0debeb&_nc_ohc=ak_fyrbG6nYAX_yEiFf&_nc_ht=scontent.fevn13-1.fna&oh=00_AfA0GvPXA73oFse8dw9T3O9eHkQpuc1b_Jvx1rS1q16Dcg&oe=64293368'),
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
                      'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338173559_1174197959965252_2534156521105122554_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=-lxO_I8UiPEAX8UKO-e&_nc_ht=scontent.fevn13-1.fna&oh=00_AfD_HzvpkFbohHKOHlg_HUB2QLdsKAvdG-FS9FJ8U-XugA&oe=64290D14'),
                ),
                const SizedBox(width: 10),
                WalletContainer(
                  image: Image.network(
                      'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338137475_593953222443956_5043607066557195444_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=0debeb&_nc_ohc=oct0eA79zU8AX-XEy1F&_nc_ht=scontent.fevn13-1.fna&oh=00_AfBxKzc4hR3zSoSSw51qMXa4orzBxxm3anwSoKpwfhGkFw&oe=64288E8A'),
                ),
                const SizedBox(width: 10),
                WalletContainer(
                  image: Image.network(
                      'https://scontent.fevn13-1.fna.fbcdn.net/v/t39.30808-6/338167189_703305334826265_2127497664976307124_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=0debeb&_nc_ohc=O44KVw_HtToAX8LmE8I&_nc_ht=scontent.fevn13-1.fna&oh=00_AfCdbw0xgaC563jXUamVHsNmvT_Q7jvaCW-GWhYuKhMLXw&oe=6428DB4D'),
                ),
              ],
            ),
          ],
        ));
  }
}
