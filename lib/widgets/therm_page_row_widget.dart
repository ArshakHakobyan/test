import 'package:flutter/material.dart';

class ThermsPageRowWidget extends StatelessWidget {
  final String text;
  const ThermsPageRowWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                children: [
                  TextSpan(
                    text: text.substring(0, 3),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(238, 111, 50, 1),
                    ),
                  ),
                  TextSpan(
                    text: text.substring(3),
                    style: const TextStyle(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
