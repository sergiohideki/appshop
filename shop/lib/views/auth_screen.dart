import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 117, 255, 0.5),
                  Color.fromRGBO(255, 188, 117, 0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}