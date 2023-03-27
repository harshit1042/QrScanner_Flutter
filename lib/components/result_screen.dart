import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultScreen extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const ResultScreen(
      {super.key, required this.closeScreen, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            closeScreen();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
        ),
        centerTitle: true,
        title: Text(
          "QR Scanner",
          style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //show QR Code here
              QrImage(data: '', size: 150, version: QrVersions.auto),

              Text(
                "Scanned result",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                code,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black87, fontSize: 16, letterSpacing: 1),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: code));
                  },
                  child: Text(
                    "Copy",
                    style: TextStyle( fontSize: 14, letterSpacing: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
