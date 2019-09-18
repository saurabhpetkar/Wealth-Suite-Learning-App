import 'package:flutter/material.dart';

class WhatWillYouLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Colors.white,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.17,
                height: 50,
                child: Icon(
                  Icons.access_alarm,
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.78,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
                child: Text(
                    'some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, '),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.17,
                height: 50,
                child: Icon(
                  Icons.access_alarm,
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.78,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
                child: Text(
                    'some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, '),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.17,
                height: 50,
                child: Icon(
                  Icons.access_alarm,
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.78,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
                child: Text(
                    'some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, '),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.17,
                height: 50,
                child: Icon(
                  Icons.access_alarm,
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.78,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
                child: Text(
                    'some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, '),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.17,
                height: 50,
                child: Icon(
                  Icons.access_alarm,
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.78,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
                child: Text(
                    'some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, some text, '),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
