import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.blue[400],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue[300],
                        height: 120,
                      ),
                    );
                  })),

          Padding(padding: EdgeInsets.all(8.0),
          child: Container(
            width: 200,
            color: Colors.blue[300],
          ),)
        ],
      ),
    );
  }
}
