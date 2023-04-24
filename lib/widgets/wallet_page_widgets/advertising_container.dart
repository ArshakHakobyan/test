import 'package:flutter/material.dart';

class AdvertisingContainer extends StatelessWidget {
  final Image image;
  final Widget? routeToWidget;

  const AdvertisingContainer({key, required this.image, this.routeToWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 10),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                //color: Color.fromRGBO(8, 0, 0, 0.2),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            width: MediaQuery.of(context).size.width * 0.28,
            child: image),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: const Color.fromRGBO(238, 111, 50, 0.2),
              onTap: () {
                if (routeToWidget != null) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return routeToWidget!;
                  }));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
