import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telcell_copy/pages/registratin_page.dart';
import '../pageModels/authorization_page_model.dart';
import '../widgets/icon_images.dart';

class Authorization extends StatelessWidget {
  final void Function() callback;
  const Authorization({super.key, required this.callback});
  @override
  Widget build(BuildContext context) {
    Widget digitButton(String digit) {
      return Expanded(
          child: InkResponse(
        highlightColor: Colors.grey.withOpacity(0.5),
        onTap: () {
          //addDigit(digit); //
          context.read<AuthorizationModel>().addDigit(digit, callback);
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

    Widget fingerprint() {
      return Expanded(
        child: InkResponse(
          onTap: () async {
            if (context.read<AuthorizationModel>().supportState) {
              bool authenticated =
                  await context.read<AuthorizationModel>().authenticate();
              if (authenticated) {
                // ignore: use_build_context_synchronously
                context.read<AuthorizationModel>().setPinCode('5693');
                Timer(const Duration(milliseconds: 50), () {
                  callback();
                });
                //widget.callback();
              }
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Center(
                          child: Text('You have not installed biometrics ')),
                      content: Text('.....'),
                    );
                  });
            }
          },
          child: const Icon(
            Icons.fingerprint_sharp,
            color: Color.fromRGBO(238, 111, 50, 1),
          ),
        ),
      );
    }

    Widget backspaceButton(IconData icon) {
      return Expanded(
          child: InkWell(
        onTap: () {
          String pinCode = context.read<AuthorizationModel>().pinCode;
          context
              .read<AuthorizationModel>()
              .setPinCode(pinCode.substring(0, pinCode.length - 1));
        },
        child: Center(
            child: Icon(
          icon,
          color: Colors.grey,
        )),
      ));
    }

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
            Consumer<AuthorizationModel>(
              builder: (BuildContext context, value, Widget? child) {
                return SizedBox(
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
                            color: index < value.pinCode.length
                                ? const Color.fromRGBO(238, 111, 50, 1)
                                : const Color.fromARGB(255, 187, 186, 186)),
                      ),
                    ),
                  ),
                );
              },
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
                      Consumer<AuthorizationModel>(builder:
                          (BuildContext context, value, Widget? child) {
                        return value.supportState
                            ? fingerprint()
                            : const Expanded(child: Text(' '));
                      }),
                      digitButton('0'),
                      backspaceButton(Icons.backspace)
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.06),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegistratinPage()));
                },
                child: const Text(
                  'Forgot Pin code?',
                  style: TextStyle(
                      color: Color.fromRGBO(238, 111, 50, 1), fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
