import 'package:flutter/material.dart';
import 'package:login_signup/components/qr_scanner.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Center(
      child: QRScanner(),
    ),
    Center(
      child: Text(
        'History',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Center(
      child: Text(
        'Favorite',
        style: TextStyle(fontSize: 40),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

    );
  }
}
