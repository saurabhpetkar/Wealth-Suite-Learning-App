import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart';



import '../models/home.dart';
import '../models/user.dart';


class ConnectedModel extends Model {
  bool _isloading = false;
  User _authenticatedUser;
  PublishSubject<HomePageMode> _usermode = PublishSubject();

}

class UserModel extends ConnectedModel {

  PublishSubject<HomePageMode> get usermode {
    return _usermode;
  }

  User get authenticatedUser {
    return _authenticatedUser;
  }


  Timer _authtimer;
  PublishSubject<bool> _userSubject = PublishSubject();

  PublishSubject<bool> get userSubject {
    return _userSubject;
  }

  User get user {
    return _authenticatedUser;
  }



  Future<Map<String, dynamic>> authenticate(String email, String password) async {
    _isloading = true;
    notifyListeners();


    final Map<String, dynamic> authdata_login = {
      'email': email,
      'password': password,
    };

    final name = "temperory name";
    bool haserror = true;
    String message = 'incorrect data entered';

    //eras the below later
    String access = 'access';
    String refresh = 'refresh';

    setAuthTimeout(1 * 3600 * 24); //1day timeout in seconds
    final DateTime now = DateTime.now();
    final DateTime expiryTime =
    now.add(Duration(seconds: 1 * 3600 * 24)); //1 day in seconds

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('refresh', refresh);
    prefs.setString('username', name);
    prefs.setString('access',access);
    //prefs.setString('refresh', responsedata['refresh']);
//      prefs.setString('username', responsedata['username']);
//      prefs.setString('access', responsedata['access']);
    prefs.setString('expiryTime', expiryTime.toIso8601String());
    //erase the above later
    //_userSubject.add(true);
//    print(authdata_signup);
//    http.Response response;
//
//      String link = "link to login";
//
//      response = await http.post(
//        link,
//        body: json.encode(authdata_login),
//        headers: {'Content-Type': 'application/json'},
//      );
//
//    print('ye hai response ${json.decode(response.body)}');
//    final Map<String, dynamic> responsedata = json.decode(response.body);
//    print('ye hai status code ${response.statusCode}');
//
//    if (response.statusCode != 400 && response.statusCode != 401) {
//      haserror = false;
//      _authenticatedUser = User(
//        refresh: responsedata['refresh'],
//        access: responsedata['access'],
//        username: responsedata['username'],
//      );
//
//      setAuthTimeout(1 * 3600 * 24); //1day timeout in seconds
//      final DateTime now = DateTime.now();
//      final DateTime expiryTime =
//      now.add(Duration(seconds: 1 * 3600 * 24)); //1 day in seconds
//
//      final SharedPreferences prefs = await SharedPreferences.getInstance();
//      prefs.setString('refresh', responsedata['refresh']);
//      prefs.setString('username', responsedata['username']);
//      prefs.setString('access', responsedata['access']);
//      prefs.setString('expiryTime', expiryTime.toIso8601String());
//      _userSubject.add(true);
//    }
//    else{
//      return {'success': false, 'error': 'some error'};
//    }



    //only frontend purpose
    haserror = false;
    message = 'Logged in';
    _usermode.add(HomePageMode.authenticated);
    //only for frontend purpose

    _isloading = false;
    notifyListeners();
    _authenticatedUser = User(username: 'user', refresh: 'refresh', access: 'access', email: email);
    return {'success': !haserror, 'message': message};
  }

  void autoAuthenticate() async {
    print('in autoauthenticate');
    _usermode.add(HomePageMode.not_authenticated);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String access = prefs.getString('access');

    if (access != null) {

      final String expiryTime = prefs.getString('expiryTime');
      print('autoAuthenticate');
      final DateTime now = DateTime.now();
      final parsedExpiryTime = DateTime.parse(expiryTime);
      if (parsedExpiryTime.isBefore(now)) {
        _authenticatedUser = null;
        notifyListeners();
        return;
      }

      _authenticatedUser = User(
        access: prefs.getString('access'),
        refresh: prefs.getString('refresh'),
        username: prefs.getString('username'),
      );
      final int tokenlifespan = parsedExpiryTime.difference(now).inSeconds;
      setAuthTimeout(tokenlifespan);
      _usermode.add(HomePageMode.authenticated);
      //_userSubject.add(true);
      notifyListeners();
    }
    print('out of autoauthenticate');

    //logged out hai
  }

  void logout() async {
    print('logout ho raha hai');
    _authtimer.cancel();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('access');
    prefs.remove('refresh');
    prefs.remove('username');
    _authenticatedUser = null;
    _usermode.add(HomePageMode.not_authenticated);
    print('logout ho gaya');
  }

  void setAuthTimeout(int time) {
    _authtimer = Timer(Duration(seconds: time), () {
      logout();
      print('logout, automatic');
    });
  }
}

class UtilityModel extends ConnectedModel{
  bool get isLoading {
    return _isloading;
  }
}
