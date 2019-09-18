import 'package:flutter/material.dart';

class appbar extends StatelessWidget with PreferredSizeWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  appbar(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Share'),
      backgroundColor: Color(0xFF18D191),
      elevation: 2.0,
      leading: IconButton(
        icon: Transform(
            transform: Matrix4.skewX(-0.3),
            child: Icon(
              Icons.list,
              size: 25,
            )),
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
