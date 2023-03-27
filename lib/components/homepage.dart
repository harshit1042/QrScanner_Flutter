import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/history.dart';
import 'package:login_signup/components/qr_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();

  List<Widget> screenList = [
    Center(
      child:QRScanner(),
    ),
    Center(
      child: History(),
    ),
    Center(
      child: Text("Favorite"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("QR Scanner"),
        centerTitle: true,
      ),
      body: screenList[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavigationKey,
        onTap: (index) => setState(() {
          this.index = index;
        }),
        index: index,
        backgroundColor: Colors.white,
        color: Colors.blue,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.history,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
