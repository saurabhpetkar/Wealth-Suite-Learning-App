//import 'package:flutter/material.dart';
//import 'package:scoped_model/scoped_model.dart';
//import 'dart:async';
//import 'package:flutter/services.dart';
//
//import '../scoped_models/main.dart';
//import '../models/auth.dart';
//
//class AuthPage extends StatefulWidget {
//  @override
//  _AuthPageState createState() => new _AuthPageState();
//}
//
//class _AuthPageState extends State<AuthPage> {
//  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
//  final Color button_color = Colors.black54;
//  bool phone = false;
//  String signup;
//
//  AuthMode _authMode = AuthMode.login;
//  Map<String, dynamic> user = {
//    'email': 'email',
//    'password': 'blah',
//    'name': '',
//    'phone': '',
//    'gender': 'Male',
//  };
//
//  @override
//  void initState() {
//    super.initState();
//  }
//

//
//  Widget LoginPage(
//      Widget emailField, Widget passwordField, Widget loginButton) {
//    final double deviceWidth = MediaQuery.of(context).size.width;
//    final double targetwidth =
//    deviceWidth > 550.0 ? deviceWidth * 0.90 : deviceWidth * 0.98;
//    final double targetPadding = deviceWidth - targetwidth;
//    return Center(
//      child: Form(
//        key: _formkey,
//        child: Container(
//          child: ListView(
//            children: <Widget>[
//              SizedBox(
//                height: deviceWidth > 550 ? 0.0 : 100.0,
//              ),
//              SizedBox(
//                height: 150.0,
//                child: Image.asset(
//                  "assets/images/logo.png",
//                  fit: BoxFit.contain,
//                ),
//              ),
//              SizedBox(height: 25.0),
//              Container(
//                padding: EdgeInsets.only(
//                    left: targetPadding,
//                    right: targetPadding,
//                    bottom: 0.0,
//                    top: 0.1),
//                child: emailField,
//              ),
//              SizedBox(height: 25.0),
//              Container(
//                padding: EdgeInsets.only(
//                    left: targetPadding,
//                    right: targetPadding,
//                    bottom: 0.0,
//                    top: 0.1),
//                child: passwordField,
//              ),
//              SizedBox(
//                height: 35.0,
//              ),
//              Container(
//                padding: EdgeInsets.only(
//                    left: targetPadding,
//                    right: targetPadding,
//                    bottom: 0.0,
//                    top: 0.1),
//                child: loginButton,
//              ),
//              SizedBox(
//                height: 25.0,
//              ),
//              FlatButton(
//                onPressed: () {
//                  gotoSignup();
//                },
//                child: Text('switch to Signup'),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//

//
//
//  @override
//  Widget build(BuildContext context) {
//    void authform(Function authenticate) async {

//        if (!_formkey.currentState.validate()) {
//          return;
//        }
//        _formkey.currentState.save();
//
//
//
//      final Map<String, dynamic> successInformation = await authenticate(
//          user['email'],
//          user['password'],
//      );
//
//      if (!successInformation['success']) {
//        showDialog(
//          context: context,
//          builder: (BuildContext context) {
//            return AlertDialog(
//              title: Text('Error'),
//              content: Text(successInformation['message']),
//              actions: <Widget>[
//                FlatButton(
//                  child: Text('OK'),
//                  onPressed: () => Navigator.of(context).pop(),
//                ),
//              ],
//            );
//          },
//        );
//      }
//    }
//

//

//
//    final emailField = TextFormField(
//      initialValue: 'sss@s.com',
//      obscureText: false,
//      keyboardType: TextInputType.emailAddress,
//      autofocus: false,
//      onSaved: (String value) {
//        user['email'] = value;
//      },
//      validator: (String value) {
//        if (value.isEmpty)
//          return 'Cant leave it empty.';
//        else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//            .hasMatch(value)) {
//          //its an email
//          print("sent an email");
//        }
//      },
//      decoration: InputDecoration(
//        focusedBorder:
//        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//        prefixIcon: Padding(
//          padding: EdgeInsets.all(7.0),
//          child: Icon(
//            Icons.email,
//            color: Colors.white,
//          ),
//        ),
//        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//        hintText: "Email",
//        border:
//        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//      ),
//    );
//
//    final passwordField = TextFormField(
//      obscureText: true,
//      initialValue: 'sss',
//      keyboardType: TextInputType.text,
//      autofocus: false,
//      onSaved: (String value) {
//        user['password'] = value;
//      },
//      validator: (String value) {
//        if (value.isEmpty) return 'Cant leave it empty.';
//      },
//      decoration: InputDecoration(
//        focusedBorder:
//        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//        icon: Padding(
//          padding: EdgeInsets.all(7.0),
//          child: Icon(
//            Icons.lock,
//            color: Colors.white,
//          ),
//        ),
//        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//        hintText: "Password",
//        border:
//        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//      ),
//    );
//
//    final loginButon = ScopedModelDescendant<MainModel>(
//      builder: (BuildContext context, Widget child, MainModel model) {
//        return model.isLoading
//            ? Center(
//          child: CircularProgressIndicator(),
//        )
//            : Material(
//          elevation: 5.0,
//          borderRadius: BorderRadius.circular(30.0),
//          color: button_color,
//          child: MaterialButton(
//            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//            onPressed: () {
//              _authMode = AuthMode.login;
//              authform(model.authenticate, model.sendOtp);
//            },
//            child: Text("login",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    color: Colors.white, fontWeight: FontWeight.bold)),
//          ),
//        );
//      },
//    );
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Travel App'),
//        backgroundColor: Colors.black,
//        elevation: 10.0,
//      ),
//      body: Container(
//        decoration: BoxDecoration(
//          color: Colors.black26,
//          image: DecorationImage(
//            colorFilter: new ColorFilter.mode(
//                Colors.black.withOpacity(0.1), BlendMode.dstATop),
//            image: AssetImage('assets/images/mountains.jpg'),
//            fit: BoxFit.cover,
//          ),
//        ),
//
//        height: MediaQuery.of(context).size.height,
//
//        child: PageView(
//          controller: _controller,
//          physics: new AlwaysScrollableScrollPhysics(),
//          children: <Widget>[
//            LoginPage(emailField, passwordField, loginButon),
//            HomePage(),
//            SignupPage(FieldSignup, loginButonSignup)
//          ],
//          scrollDirection: Axis.horizontal,
//        ),
//      ),
//    );
//  }
//}
