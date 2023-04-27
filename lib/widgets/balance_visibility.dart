import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BalanceVisibility extends StatefulWidget {
  bool? isRouted;
  BalanceVisibility({key, this.isRouted}) : super(key: key);
  @override
  State createState() => BalanceVisibilityState();
}

class BalanceVisibilityState extends State<BalanceVisibility> {
  bool isVisible = true;
  void toggle() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isVisible
            ? ShowMoneyField(
                onPressed: toggle,
                isRouted: widget.isRouted ?? false,
              )
            : HiddenMoneyField(
                onPressed: toggle,
                isRouted: widget.isRouted ?? false,
              ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ShowMoneyField extends StatefulWidget {
  final bool isRouted;
  final void Function() onPressed;
  const ShowMoneyField(
      {super.key, required this.onPressed, required this.isRouted});

  @override
  State<ShowMoneyField> createState() => _ShowMoneyFieldState();
}

class _ShowMoneyFieldState extends State<ShowMoneyField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isRouted
          ? EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.06)
          : EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 5, right: 15),
                child: Text(
                  '0.00',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: AutofillHints.addressCityAndState),
                ),
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  child: Text(
                    "Դ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
            ],
          ),

          IconButton(
            iconSize: 28,
            onPressed: () {
              widget.onPressed();
            },
            icon: const InkWell(child: Icon(Icons.visibility_off)),
            color: Colors.white,
          ),
          //flex: 1,
        ],
      ),
    );
  }
}

class HiddenMoneyField extends StatefulWidget {
  final bool isRouted;
  final void Function() onPressed;
  const HiddenMoneyField(
      {super.key, required this.onPressed, required this.isRouted});

  @override
  State<HiddenMoneyField> createState() => _HiddenMoneyFieldState();
}

class _HiddenMoneyFieldState extends State<HiddenMoneyField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isRouted
          ? EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05)
          : EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wallet,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(width: 9),
          const Text(
            '• • • • •',
            style: TextStyle(
                height: 1,
                fontSize: 35,
                color: Colors.white,
                fontFamily: AutofillHints.addressCityAndState),
          ),
          IconButton(
            iconSize: 28,
            onPressed: () {
              widget.onPressed();
            },
            icon: const Icon(Icons.visibility),
            //padding: const EdgeInsets.only(),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
