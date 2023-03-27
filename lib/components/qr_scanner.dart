import 'package:flutter/material.dart';
import 'package:login_signup/components/result_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr/qr.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;

  void closScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Place the QR code in the area",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Scanning will be started automatically",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                    child: Stack(
                      children: [
                        MobileScanner(
                          allowDuplicates: true,
                          onDetect: (barcode, args) {
                            if (!isScanCompleted) {
                              String code = barcode.rawValue ?? '---';
                              isScanCompleted = true;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                    closeScreen: closScreen,
                                    code: code,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
