import 'package:flutter/material.dart';

class SmallIconButton extends StatelessWidget {
  final Image image;
  const SmallIconButton({key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 253, 253, 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          width: MediaQuery.of(context).size.width * 0.26,
          height: MediaQuery.of(context).size.width * 0.26,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: image,
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: const Color.fromRGBO(238, 111, 50, 0.2),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
