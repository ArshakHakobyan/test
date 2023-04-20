import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          color: Colors.white),
      child: Row(
        //crossAxisAlignment: ,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: InkWell(
              child: Icon(
                Icons.settings,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ),
          Text(
            //' Finance',
            'Settings',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
                child: Icon(
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
