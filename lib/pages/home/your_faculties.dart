import 'package:flutter/material.dart';

class YourFaculties extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 20,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF29B6F6),
              Color(0xFF40C4FF),
              Color(0xFF29B6F6),
            ],
            stops: [
              0.33,
              0.66,
              0.99,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'YOUR FACULTIES',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    ],);
  }
}
