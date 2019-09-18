import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingleProduct extends StatelessWidget {
  final String picture;
  final String name;

  final String cost;

  SingleProduct(this.name, this.picture, this.cost);

  @override
  Widget build(BuildContext context) {
    final double wid = 200;
    final double heig = 150;
    return GestureDetector(
      onTap: () {
        // widget.model.SelectCourse; do it later
        Navigator.pushNamed(context, '/course');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Container(
          //color: Colors.yellow,
          width: wid,
          height: heig,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  color: Colors.white,
                  width: wid * 0.85,
                  height: heig * 0.9,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: heig * 0.75,
                  width: wid * 0.9,
                  //color: Colors.red,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        offset: Offset(12, 22),
                        blurRadius: 12,
                      )
                    ],
                  ),
                  child: Image.network(
                    picture,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(bottom: 20, left: 2, child: Text(name)),
            ],
          ),
        ),
      ),
    );
  }
}

//
//Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Container(
//height: 90,
//width: 160,
//child: ClipRRect(
//borderRadius: BorderRadius.circular(
//10.0,
//),
//child: Image.network(
//picture,
//fit: BoxFit.fitWidth,
//),
//),
//),
//SizedBox(
//height: 7,
//),
//SizedBox(
//width: 160,
//child: Text(name),
//),
//
//SizedBox(
//height: 2,
//),
//SizedBox(
//width: 100,
//child: Text(
//'$cost Rs',
//style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
//),
//),
//],
//),
