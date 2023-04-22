import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/icon_images.dart';

class Authorization extends StatefulWidget {
  final void Function() callback;
  const Authorization({super.key, required this.callback});
  @override
  State<Authorization> createState() {
    return AuthorizationState();
  }
}

class AuthorizationState extends State<Authorization> {
  String pinCode = '';
  String realPin = '5693';

  Widget digitButton(String digit) {
    return Expanded(
        child: InkResponse(
      highlightColor: Colors.grey.withOpacity(0.5),
      onTap: () {
        addDigit(digit);
      },
      child: Center(
        child: Text(
          digit,
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }

  Widget iconButton(IconData icon) {
    return Expanded(
        child: InkWell(
      onTap: () {
        if (pinCode.isNotEmpty) {
          setState(() {
            pinCode = pinCode.substring(0, pinCode.length - 1);
          });
        }
      },
      child: Center(
          child: Icon(
        icon,
        color: Colors.grey,
      )),
    ));
  }

  void addDigit(String digit) {
    if (pinCode.length < 4) {
      setState(() {
        pinCode += digit;
        if (pinCode == realPin) {
          Timer(const Duration(milliseconds: 10), () {
            setState(() {
              widget.callback();
            });
          });
        } else if (pinCode.length == 4 && pinCode != realPin) {
          //sleep(Duration(seconds: 2));
          Timer(const Duration(milliseconds: 500), () {
            setState(() {
              pinCode = "";
            });
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(240, 242, 244, 1),
        ),
        child: Column(
          children: [
            //Telcell Logo Image
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
              child: SizedBox(
                height: 40,
                child: Image(
                  image: IconImages().telcellLogoText,
                ),
              ),
            ),
            const Text(
              'Please enter a pin code',
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
            ),
            //for responsivity
            const Expanded(child: SizedBox()),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index < pinCode.length
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : const Color.fromARGB(255, 187, 186, 186)),
                  ),
                ),
              ),
            ),
            //for responsivity
            const Expanded(child: SizedBox()),
            Ink(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(240, 242, 244, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      digitButton("1"),
                      digitButton('2'),
                      digitButton('3')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      digitButton("4"),
                      digitButton('5'),
                      digitButton('6')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      digitButton("7"),
                      digitButton('8'),
                      digitButton('9')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      digitButton(" "),
                      digitButton('0'),
                      iconButton(Icons.backspace)
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.06),
              child: const Text(
                'Forgot Pin code?',
                style: TextStyle(
                    color: Color.fromRGBO(238, 111, 50, 1), fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
