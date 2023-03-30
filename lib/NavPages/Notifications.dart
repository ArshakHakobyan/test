import 'package:flutter/material.dart';

class Notifivations extends StatefulWidget {
  const Notifivations({key}) : super(key: key);
  @override
  State createState() => NotifivationsState();
}

class NotifivationsState extends State<Notifivations> {
  bool isVisible = true;
  void toggle() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
            title: Column(
              children: [
                Visibility(
                  visible: isVisible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(),
                      ),
                      Stack(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 5, right: 15),
                            child: Text(
                              '0.00',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontFamily:
                                      AutofillHints.addressCityAndState),
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
                          flex: 5,
                          child: IconButton(
                            iconSize: 28,
                            onPressed: () {
                              toggle();
                            },
                            icon: const Icon(Icons.remove_red_eye),
                            padding: const EdgeInsets.only(right: 100),
                            color: Colors.white,
                          ) //flex: 1,
                          ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isVisible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(flex: 3, child: SizedBox()),
                      const Text(
                        '• • • • •',
                        style: TextStyle(
                            height: 1,
                            fontSize: 45,
                            color: Colors.white,
                            fontFamily: AutofillHints.addressCityAndState),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () {
                          toggle();
                        },
                        icon: const Icon(Icons.lock_open_rounded),
                        padding: const EdgeInsets.only(),
                        color: Colors.white,
                      ),
                      const Expanded(flex: 3, child: SizedBox()),
                    ],
                  ),
                ),
              ],
            )),
        body: const Center(
            child: Text(
          'The List Of Notifications is Empty',
          style: TextStyle(
            color: Color.fromRGBO(176, 190, 198, 1),
            fontSize: 17,
          ),
        )));
  }
}
