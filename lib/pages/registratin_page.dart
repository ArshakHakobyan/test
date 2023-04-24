import 'dart:async';

import 'package:flutter/material.dart';
import 'package:telcell_copy/pages/about_terms_of_offer_page.dart';

class RegistratinPage extends StatefulWidget {
  const RegistratinPage({super.key});
  @override
  State<RegistratinPage> createState() {
    return RegistratinPageState();
  }
}

class RegistratinPageState extends State<RegistratinPage> {
  bool isFormFieldHintVisible = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(240, 242, 244, 1),
        child: Column(
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.31,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
                right: MediaQuery.of(context).size.width * 0.08,
              ),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 14),
                            child: Text(
                              'Your phone number',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        onTap: () => isFormFieldHintVisible = false,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (!RegExp(r'^\d{8}$').hasMatch(value)) {
                            return 'Phone number must start with +374 and \n including exactly 12 digits';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefix: const Text(
                            '+374',
                            style: TextStyle(
                              color: Color.fromARGB(255, 6, 6, 6),
                              fontSize: 16,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.smartphone_sharp,
                            color: Colors.grey,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 16.0),
                          hintText:
                              isFormFieldHintVisible ? '+374 XX  XX XX XX' : "",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 65, 64, 64)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 232, 231, 231),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                            // Add a shadow when the text field is focused
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromRGBO(238, 111, 50, 1))),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  Timer(const Duration(milliseconds: 50), () {
                                    Navigator.of(context).pop();
                                  });
                                }
                              },
                              child: const Text("Confirm"),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'An sms with confirmation code will be send to this number',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )),
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const AboutTermsOfOffer();
                  }));
                },
                child: const Text(
                  'Learn about terms of offer.',
                  style: TextStyle(
                      color: Color.fromRGBO(238, 111, 50, 1), fontSize: 12),
                )),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 14, left: 5, right: 5),
              child: Text(
                'By entering to telcell Wallet you accept its rules.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
