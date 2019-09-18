import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/services.dart';

import './drawer.dart';
import './appbar.dart';
import '../../scoped_models/main.dart';

class SharePage extends StatefulWidget {
  final MainModel model;

  SharePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _SharePageState();
  }
}

class _SharePageState extends State<SharePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share'),
        backgroundColor: Color(0xFF18D191),
        elevation: 2.0,
      ),
      drawer: drawer(context, widget.model.logout),
      body: ListView(
        children: <Widget>[
          Padding(
            child: Text(
              "Share it with your friends!",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          Padding(
            child: Text(
              "Invite your friends using the Invite code and win 50 Reward Points",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black54),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          Stack(
            children: [
              Center(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      'https://shawglobalnews.files.wordpress.com/2019/02/dragon-aurora.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(width: 250, child: Text("##@@!@!@%%\$VVDD"),),
                Builder(
                  builder: (context) => RaisedButton(
                    onPressed: () {
                      final data = ClipboardData(text: "flutter text");
                      Clipboard.setData(data).then((result) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Copied to ClipBoard'),
                          duration: Duration(seconds: 2),
                        ));
                      });
                      print(data);
                    },
                    child: Text("Copy"),
                    color: Colors.green,
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
