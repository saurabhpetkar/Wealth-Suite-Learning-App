import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


import './scoped_models/main.dart';

import './pages/home/home.dart';
import './pages/login/login.dart';

import './models/home.dart';



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
  bool _otpsent = false;
  bool _registration = false;
  HomePageMode _userMode = HomePageMode.not_authenticated;



  @override
  initState() {
    super.initState();
    _model.autoAuthenticate();
    _model.usermode.listen((HomePageMode usermode){
      setState(() {
        _userMode = usermode;
      });
    });

    //necessary

    //dont erase
  }




  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.black,
        ),
        home: _userMode == HomePageMode.authenticated? HomePage(_model): LoginPage(),
        routes: {
          // '/bookings': (BuildContext context) => BookingPage(_model),

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
//          return MaterialPageRoute(
//            builder: (BuildContext context) =>
//            !_isAuthenticated ? LoginPage(_model) : HomePage(_model),
//          );
        },
      ),
    );
  }
}