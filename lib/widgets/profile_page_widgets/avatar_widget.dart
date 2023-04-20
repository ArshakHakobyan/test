import 'package:flutter/material.dart';
import 'package:telcell_copy/pages/raise_page.dart';
import 'package:telcell_copy/widgets/icon_images.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      padding: const EdgeInsets.all(10),
      height: 205,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //This Row contains Avatar Icon Stack, and column with 3 Rows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Avatar picture Stack
              Stack(
                children: [
                  // Rounded Container
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 226, 226, 226),
                          width: 1,
                        )),
                    child: const Icon(
                      Icons.person,
                      size: 16,
                      color: Color.fromARGB(255, 214, 213, 213),
                    ),
                  ),
                  Positioned(
                      right: 3,
                      bottom: 3,
                      //Rounded Container for edit button
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(238, 111, 50, 1),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color.fromARGB(255, 226, 226, 226),
                              width: 1,
                            )),
                        height: 20,
                        width: 20,
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 14,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ))
                ],
              ),
              //This Column contains 3 Rows
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status ,Guest Row
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: const [
                        Text(
                          'Status:  ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Guest ',
                          style: TextStyle(
                              color: Color.fromRGBO(238, 111, 50, 1),
                              fontSize: 16),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.star,
                            color: Color.fromRGBO(238, 111, 50, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Id, Number Row
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: const [
                        Text(
                          'Id number:   ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '999999',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          child: Icon(
                            Icons.copy_all_rounded,
                            size: 14,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Phone, Number Row
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: const [
                        InkWell(
                          child: Icon(
                            Icons.smartphone,
                            color: Color.fromRGBO(238, 111, 50, 1),
                            size: 18,
                          ),
                        ),
                        Text(
                          '+37477786656',
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 10,
                  ))
            ],
          ),
          //Birthday Field Row
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 20),
            child: Row(
              children: [
                const InkWell(
                  child: Icon(
                    Icons.cleaning_services_sharp,
                    color: Color.fromRGBO(238, 111, 50, 1),
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: Text(
                    ' Your wallets birthday is feb 26th',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                const Expanded(
                    child: SizedBox(
                  width: 1,
                )),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: IconImages().backgroundImage)),
                              height: 265,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      'Congratulations',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color:
                                              Color.fromRGBO(238, 111, 50, 1)),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 16, right: 16, bottom: 16),
                                    child: Text(
                                      'Everyone celebrates their birthday once a year.Telcell Wallet gave you the opportunity to celebrate a second birthday when you chose the comfort by downloading Telcell wallet application.Thank you for your choice',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.warning_outlined,
                      color: Color.fromRGBO(238, 111, 50, 1),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 2,
            thickness: 1,
            color: Color.fromARGB(255, 201, 195, 195),
          ),
          Expanded(
            child: Row(
              //crossAxisAlignment: ,
              children: [
                const InkWell(
                  child: Icon(
                    Icons.admin_panel_settings,
                    color: Color.fromRGBO(238, 111, 50, 1),
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 0,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      ' Personification',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    width: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => const RaisePage()));
                    },
                    child: const Text(
                      'Raise >',
                      style: TextStyle(
                          fontSize: 17, color: Color.fromRGBO(238, 111, 50, 1)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
