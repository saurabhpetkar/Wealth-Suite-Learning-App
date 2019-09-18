import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './scoped_models/main.dart';

import './pages/home/home.dart';
import './pages/login/login.dart';

import './models/home.dart';
import './pages/video/video.dart';
import './pages/course/course.dart';
import './pages/about/about.dart';
import './pages/share/share.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final MainModel _model = MainModel();
  bool _isAuthenticated = false;
  HomePageMode _userMode = HomePageMode.not_authenticated;

  @override
  initState() {
    super.initState();
    print("in initstate");
    _model.autoAuthenticate();
    _model.usermode.listen((HomePageMode usermode) {
      setState(() {
        _userMode = usermode;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.black,
        ),
        home: _userMode == HomePageMode.authenticated
            ? HomePage(_model)
            : LoginPage(_model),
        routes: {
          '/video': (BuildContext context) =>
              _userMode == HomePageMode.not_authenticated
                  ? LoginPage(_model)
                  : VideoPage(_model),
          '/course': (BuildContext context) =>
              _userMode == HomePageMode.not_authenticated
                  ? LoginPage(_model)
                  : CoursePage(_model),
          '/about': (BuildContext context) =>
              _userMode == HomePageMode.not_authenticated
                  ? LoginPage(_model)
                  : AboutPage(_model),
          '/share': (BuildContext context) =>
              _userMode == HomePageMode.not_authenticated
                  ? LoginPage(_model)
                  : SharePage(_model),
        },
        onGenerateRoute: (RouteSettings settings) {
//          final List<String> pathElements = settings.name.split('/');
//          if (pathElements[0] != '') {
//            return null;
//          }
//          String first = pathElements[1];
//          if (first == 'women') {
//            final String subCatagory = pathElements[2];
//            return MaterialPageRoute<bool>(
//                builder: (BuildContext context) =>
//                !_isAuthenticated ? LoginPage(_model) : ListPage(_model, pathElements[1], subCatagory));
//          }
//          else if(first == 'products'){
//            final String product_id = pathElements[2];
//            return MaterialPageRoute<bool>(
//                builder: (BuildContext context) =>
//                !_isAuthenticated ? LoginPage(_model) : ProductDetailpage(_model, product_id));
//          }
//          //ProductDetailpage(_model, product_id)
//          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                !_isAuthenticated ? HomePage(_model) : LoginPage(_model),
          );
        },
      ),
    );
  }
}
