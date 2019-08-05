import 'package:flutter/material.dart';

Widget drawer(BuildContext context, Function logout) {
  return
    Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'logged in username',
              style: TextStyle(color: Colors.white),
            ),
            accountEmail:
            Text('logged in email', style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
                color: Color(0xFF18D191),
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage('assets/images/logo.png'))),
          ),

          ListTile(
            title: Text('Logout', style: TextStyle(fontSize: 16, color: Colors.blueGrey),),
            selected: true,
            leading: Icon(Icons.arrow_downward),
            onTap: (){
              Navigator.pop(context);
              logout();
            },
          ),
          Divider(
            color: Colors.black38,
          ),
        ],
      ),
    );
}
