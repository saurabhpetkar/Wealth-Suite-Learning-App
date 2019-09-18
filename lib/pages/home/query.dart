import 'package:flutter/material.dart';

class query extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 100,
      ),
      Center(
        child: Text(
          'Have Queries?',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Email us at: ',
            style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          Text(
            'saurabh.blah@gmail.com',
            style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
      SizedBox(
        height: 40,
      ),
    ],);
  }
}
