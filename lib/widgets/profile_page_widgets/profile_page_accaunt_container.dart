import 'package:flutter/material.dart';

class OneFileldWidget extends StatelessWidget {
  const OneFileldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Text(
            ' Telcell Wallet account',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17,
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
              onTap: () {},
              child: const Text(
                'Open  >',
                style: TextStyle(
                    fontSize: 17, color: Color.fromRGBO(238, 111, 50, 1)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
