import 'package:flutter/material.dart';

class CarsAndFines extends StatelessWidget {
  const CarsAndFines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      margin: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Icon(
                    Icons.directions_car,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                Text(
                  'Cars and fines',
                  style: TextStyle(fontSize: 18),
                )
              ]),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 45, top: 10, right: 10),
                    child: Text('Points balance',
                        style: TextStyle(color: Colors.grey)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('0',
                        style:
                            TextStyle(color: Color.fromARGB(255, 11, 11, 11))),
                  ),
                ],
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.exposure_zero_rounded,
            color: Color.fromRGBO(238, 111, 50, 1),
            size: 25,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
