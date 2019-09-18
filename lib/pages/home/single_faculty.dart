import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingleFaculty extends StatelessWidget {
  final String picture;
  final String designation;

  final String description;
  final String name;

  SingleFaculty(this.name, this.picture, this.designation, this.description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      picture,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.69,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                        disabledColor: Colors.grey,
                        onPressed: null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                        color: Colors.grey,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        designation,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        description * 3,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
