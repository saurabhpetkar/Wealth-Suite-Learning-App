import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/main.dart';
import './drawer.dart';

class HomePage extends StatefulWidget {
  final MainModel model;

  HomePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: drawer(context, widget.model.logout),
        appBar: AppBar(
          title: Text('WealthSuite'),
          backgroundColor: Color(0xFF18D191),
          elevation: 2.0,
          leading: IconButton(
            icon: Transform(transform: Matrix4.skewX(0.3), child: Icon(Icons.list)),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
        ),
        body: Container(
          color: Colors.white,
          child: widget.model.isLoading
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Text('this is the home page after login'),
                ),
        ),
      ),
    );
  }
}

//bottomNavigationBar: CurvedNavigationBar(
//          buttonBackgroundColor: Colors.black,
//          color: Colors.black,
//          backgroundColor: Colors.white,
//          items: <Widget>[
//            Icon(Icons.add, size: 30, color: Colors.white,),
//            Icon(Icons.list, size: 30, color: Colors.white,),
//            Icon(Icons.compare_arrows, size: 30, color: Colors.white,),
//          ],
//          onTap: (index) {
//            //Handle button tap
//            print(index);
//          },
//        ),
//ListView.builder
//(
//itemCount: litems.length,
//itemBuilder: (BuildContext ctxt, int index) {
//return singleTile(index, litems[index]);
//}
//),
//class EntryItem extends StatelessWidget {
//  const EntryItem(this.entry);
//
//  final Entry entry;
//
//  Widget _buildTiles(Entry root) {
//    if (root.children.isEmpty) return ListTile(title: Text(root.title));
//    return ExpansionTile(
//      key: PageStorageKey<Entry>(root),
//      title: Text(root.title),
//      children: root.children.map(_buildTiles).toList(),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return _buildTiles(entry);
//  }
//}

// The entire multilevel list displayed by this app.
//  final List<Entry> data = <Entry>[
//    Entry(
//      'Chapter A',
//      <Entry>[
//        Entry(
//          'Section A0',
//          <Entry>[
//            Entry('Item A0.1'),
//            Entry('Item A0.2'),
//            Entry('Item A0.3'),
//          ],
//        ),
//        Entry('Section A1'),
//        Entry('Section A2'),
//      ],
//    ),
//    Entry(
//      'Chapter B',
//      <Entry>[
//        Entry('Section B0'),
//        Entry('Section B1'),
//      ],
//    ),
//    Entry(
//      'Chapter C',
//      <Entry>[
//        Entry('Section C0'),
//        Entry('Section C1'),
//        Entry(
//          'Section C2',
//          <Entry>[
//            Entry('Item C2.0'),
//            Entry('Item C2.1'),
//            Entry('Item C2.2'),
//            Entry('Item C2.3'),
//          ],
//        ),
//      ],
//    ),
//  ];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.

//      body: ListView.builder(
//        itemBuilder: (BuildContext context, int index) =>
//            EntryItem(data[index]),
//        itemCount: data.length,
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
//        height: MediaQuery.of(context).size.height,
//        child: Center(
//          child: Text('Home page, after login'),
//        ),
//      ),

//Widget singleTile(int index, String content){
//  return Column(
//    mainAxisSize: MainAxisSize.min,
//    children: <Widget>[
//      RaisedButton(
//        color: Colors.blue,
//        onPressed: (){
//          setState(() {
//            number = number == index ? -1 : index;
//          });
//        },
//        child: Text(content),
//        padding: EdgeInsets.all(20.0),
//      ),
//      SizedBox(height: 10.0,),
//      AnimatedContainer(duration: Duration(milliseconds: 500),
//        padding: EdgeInsets.all(20.0),
//        child: Text('animated box ${content}'),
//        height: number == index ? 100.0 : 0.0,
//        color: Colors.grey,
//        curve: Curves.easeInOut,
//      ),
//      SizedBox(height: 10.0,),
//
//    ],
//  );
//}
//
//
//List<String> litems = ["1","2","3","fourth"];
//
