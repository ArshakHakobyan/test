import 'package:flutter/material.dart';

class Exit extends StatelessWidget {
  const Exit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromRGBO(253, 237, 237, 1)),
      child: Row(
        //crossAxisAlignment: ,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: InkWell(
              child: Icon(
                Icons.exit_to_app,
                color: Color.fromRGBO(238, 83, 81, 1),
                size: 30,
              ),
            ),
          ),
          const Text(
            //' Finance',
            'Exit',
            style: TextStyle(
                fontSize: 17,
                color: Color.fromRGBO(238, 83, 81, 1),
                fontWeight: FontWeight.bold),
          ),
          const Expanded(
            child: SizedBox(
              width: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                )),
          ),
        ],
      ),
    );
  }
}
