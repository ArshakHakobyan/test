import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../widgets/balance_visibility.dart';
import 'package:scan/scan.dart';
import '../widgets/icon_images.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({key}) : super(key: key);

  @override
  State<QrCodePage> createState() => QrCodePageState();
}

class QrCodePageState extends State<QrCodePage> {
  String selectedButton = '';
  String qrData = "telCell";

  void onQrDataChange(String data) {
    setState(() {
      selectedButton = 'My Qr Code';
      qrData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedButton = 'My Qr Code';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const BalanceVisibility(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: selectedButton == 'Scan Qr Code'
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : Colors.white,
                        width: 3,
                      ))),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = 'Scan Qr Code';
                            });
                          },
                          style: ButtonStyle(
                            visualDensity: VisualDensity.compact,
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          child: Text("Scan Qr Code",
                              style: selectedButton == 'Scan Qr Code'
                                  ? const TextStyle(color: Colors.black)
                                  : const TextStyle(color: Colors.grey))),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: selectedButton == 'My Qr Code'
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : Colors.white,
                        width: 3,
                      ))),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedButton = 'My Qr Code';
                          });
                        },
                        style: const ButtonStyle(
                          visualDensity: VisualDensity.compact,
                        ),
                        child: Text("My Qr Code",
                            style: selectedButton == 'My Qr Code'
                                ? const TextStyle(color: Colors.black)
                                : const TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        ),
        body: selectedButton == 'My Qr Code'
            ? MyQRCode(data: qrData)
            : QRcodeScan(onScaned: onQrDataChange));
  }
}

class QRcodeScan extends StatefulWidget {
  final void Function(String) onScaned;
  const QRcodeScan({super.key, required this.onScaned});

  @override
  State<StatefulWidget> createState() {
    return QRcodeScanState();
  }
}

class QRcodeScanState extends State<QRcodeScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  late String qrText;

  @override
  void initState() {
    super.initState();
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Failed to get permission to access the drive'),
          content: const Text(
              'Please grant permission to access the camera in your device settings.'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Stack(
            children: [
              QRView(
                key: qrKey,
                onQRViewCreated: onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300,
                ),
              ),
              //Button for Torch toggle
              Positioned(
                top: 15,
                right: 15,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () async {
                    PermissionStatus cameraStatus =
                        await Permission.camera.request();
                    if (cameraStatus.isGranted) {
                      controller.toggleFlash();
                    }
                  },
                  child: const Icon(Icons.flashlight_on),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(238, 111, 50, 1),
                    ),
                  ),
                  onPressed: () {
                    getQRCodeFromImage();
                  },
                  child: const Text('Open Qr Code from Galery'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> getQRCodeFromImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String? result = await Scan.parse(pickedFile.path);
      widget.onScaned(result!);
    } else {
      return;
    }
  }

  void onQRViewCreated(QRViewController controller) {
    StreamSubscription? streamSubscription;
    setState(() {
      this.controller = controller;
    });
    streamSubscription = controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData.code!;
        if (qrText.isNotEmpty) {
          widget.onScaned(qrText);
          streamSubscription?.cancel();
        }
      });
    });
  }
}

class MyQRCode extends StatelessWidget {
  final String data;

  const MyQRCode({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image(image: IconImages().qrTop),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  //border: Border.all(Colors.green),
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color(0xFFCFDEF3),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: QrImage(
                    data: data,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
              ),
              Image(image: IconImages().qrBottom)
            ],
          ),
        ),
      ),
    );
  }
}
