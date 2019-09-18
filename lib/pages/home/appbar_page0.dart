import 'package:flutter/material.dart';

class appbar_page0 extends StatelessWidget with PreferredSizeWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  appbar_page0(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            width: MediaQuery.of(context).size.width * 0.90,
            child: TextField(

              style: TextStyle(fontSize: 17),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    borderSide: BorderSide(width: 1,color: Colors.black),
                  ),
                hintText: 'Search',
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        ),
      ],
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Transform(
            transform: Matrix4.skewX(0),
            child: Icon(

              Icons.list,
              color: Colors.black,
              size: 30,
            )),
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      elevation: 2.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
