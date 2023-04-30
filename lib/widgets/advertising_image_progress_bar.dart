import 'dart:async';
import 'package:flutter/material.dart';

class ProgressBarAdvertising extends StatefulWidget {
  final Image advertisingImage;
  const ProgressBarAdvertising({super.key, required this.advertisingImage});

  @override
  ProgressBarAdvertisingState createState() {
    return ProgressBarAdvertisingState();
  }
}

class ProgressBarAdvertisingState extends State<ProgressBarAdvertising> {
  double progress = 0;
  Timer? timer;

  void startProgress() {
    timer = Timer.periodic(const Duration(milliseconds: 5), (timer) {
      if (progress > 1) {
        timer.cancel();
        Navigator.of(context).pop();
      }
      setState(() {
        progress += 0.0013;
      });
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: InkWell(
          onTap: () {
            setState(() {
              progress = 0;
            });
          },
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: widget.advertisingImage,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.9,
                  top: 20,
                ),
                child: IconButton(
                    onPressed: () {
                      timer!.cancel();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Color.fromARGB(255, 220, 216, 216),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(238, 111, 50, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
