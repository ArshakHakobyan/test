import 'package:flutter/material.dart';

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
              children: const [
                InkWell(
                  child: Icon(
                    Icons.cleaning_services_sharp,
                    color: Color.fromRGBO(238, 111, 50, 1),
                  ),
                ),
                Text(
                  ' Your Telcell Wallets birthday is',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Expanded(
                    child: SizedBox(
                  width: 1,
                )),
                InkWell(
                  child: Icon(
                    Icons.warning_outlined,
                    color: Color.fromRGBO(238, 111, 50, 1),
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
              children: const [
                InkWell(
                  child: Icon(
                    Icons.admin_panel_settings,
                    color: Color.fromRGBO(238, 111, 50, 1),
                    size: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 0,
                  ),
                  child: Text(
                    ' Personification',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: InkWell(
                    child: Text(
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
