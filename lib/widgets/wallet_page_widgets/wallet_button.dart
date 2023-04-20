
import 'package:flutter/material.dart';

class WalletContainer extends StatelessWidget {
  final Image image;
  const WalletContainer({key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: const Color.fromRGBO(238, 111, 50, 1),
        onTap: () {},
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 253, 253, 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          width: MediaQuery.of(context).size.width * 0.26,
          height: MediaQuery.of(context).size.width * 0.26,
          child: image,
        ));
  }
}
