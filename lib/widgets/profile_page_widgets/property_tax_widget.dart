import 'package:flutter/material.dart';

class PropertyTax extends StatelessWidget {
  const PropertyTax({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          color: Colors.white),
      child: Row(
        //crossAxisAlignment: ,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: InkWell(
              child: Icon(
                Icons.home,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ),
          Text(
            //' Finance',
            'Property Tax,',
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
