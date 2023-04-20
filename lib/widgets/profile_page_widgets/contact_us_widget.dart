import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          color: Colors.white),
      child: Row(
        //crossAxisAlignment: ,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: InkWell(
              child: Icon(
                Icons.sms,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ),
          const Text(
            //' Finance',
            'Contact us',
            style: TextStyle(
              fontSize: 17,
            ),
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
