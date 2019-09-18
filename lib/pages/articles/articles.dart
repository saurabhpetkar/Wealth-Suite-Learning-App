import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_models/main.dart';


class ArticlePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}

class ArticlePageState extends State<ArticlePage>{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}