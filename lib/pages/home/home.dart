import '../../scoped_models/main.dart';
import './drawer.dart';
import './what_will_you_learn.dart';
import './single_faculty.dart';
import './appbar.dart';
import './appbar_page0.dart';
import './single_product.dart';


import 'package:chewie/chewie.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './fancy_navbar.dart';
import './query.dart';
import './your_faculties.dart';
import './carousel.dart';

class HomePage extends StatefulWidget {
  final MainModel model;

  HomePage(this.model);

  final String title = 'chewie demo';

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

//final mobile_width = MediaQuery.of(context).size.width;

class HomePageState extends State<HomePage> {
  TargetPlatform _platform;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //ScrollController _scrollController = ScrollController();

  TextEditingController _controller = TextEditingController();
  bool first;
  double text_height = 50;

  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    first = true;
    _videoPlayerController1 =
        VideoPlayerController.asset('videos/1_minute_video.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 16 / 9,
      autoPlay: false,
      autoInitialize: true,
    );
    _chewieController.pause();
  }

  List<Map<String, String>> litems = [
    {
      'picture':
          'https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg',
      'designation': 'some designation',
      'name': 'some name',
      'description': 'some description'
    },
    {
      'picture':
          'https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg',
      'designation': 'some designation',
      'name': 'some name',
      'description': 'some description'
    },
    {
      'picture':
          'https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg',
      'designation': 'some designation',
      'name': 'some name',
      'description': 'some description'
    },
    {
      'picture':
          'https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg',
      'designation': 'some designation',
      'name': 'some name',
      'description': 'some description'
    },
    {
      'picture':
          'https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg',
      'designation': 'some designation',
      'name': 'some name',
      'description': 'some description'
    },
  ];
  int _currentIndex = 0;
  bool showAppBar = false;

  void onTabTapped(int index) {
    setState(() {
      if (index == 0) {
        showAppBar = false;
        _videoPlayerController1.pause();
      } else
        showAppBar = true;
      if (index == 1) {
        _videoPlayerController1.play();
      } else
        _videoPlayerController1.pause();
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(context, widget.model.logout),
      appBar: showAppBar ? appbar(_scaffoldKey) : appbar_page0(_scaffoldKey),
      bottomNavigationBar: FancyBottomNavigation(
        textColor: Colors.black,
        activeIconColor: Colors.white,
        circleColor: Color(0xFF18D191),
        inactiveIconColor: Color(0xFF18D191),
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.star, title: "Premium"),
          TabData(iconData: Icons.card_giftcard, title: "Rewards")
        ],
        onTabChangedListener: onTabTapped,
      ),
      body: WhichPageToShow(_currentIndex, _chewieController, litems,
          _controller, _scaffoldKey, text_height),
    );
  }
}

Widget WhichPageToShow(
    int page,
    ChewieController chewieController,
    List<Map<String, String>> litems,
    TextEditingController _controller,
    GlobalKey<ScaffoldState> _scaffoldKey,
    double text_height) {
  if (page == 0)
    return Page0(_controller, _scaffoldKey, text_height);
  else if (page == 1)
    return Page1(chewieController, litems);
  else
    return Page2();
}

Widget Page0(TextEditingController _controller,
    GlobalKey<ScaffoldState> _scaffoldKey, double text_height) {
  return ListView(
    children: <Widget>[
      SizedBox(height: 1,),

      carousel(),
      SizedBox(height: 15,),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: Text('Category 1', style: TextStyle(fontSize: 20)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Row(
            children: <Widget>[
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: Text('Category 1', style: TextStyle(fontSize: 20)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Row(
            children: <Widget>[
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: Text('Category 1', style: TextStyle(fontSize: 20)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Row(
            children: <Widget>[
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: Text('Category 1', style: TextStyle(fontSize: 20)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Row(
            children: <Widget>[
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: Text('Category 1', style: TextStyle(fontSize: 20)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Row(
            children: <Widget>[
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text('Category 2', style: TextStyle(fontSize: 20)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Row(
            children: <Widget>[
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text('Category 3', style: TextStyle(fontSize: 20)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Row(
            children: <Widget>[
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
              SingleProduct(
                  'Sundar pichai ted talk',
                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                  '3000'),
            ],
          ),
        ),
      ),
    ],
  );

}

Widget Page1(
    ChewieController chewieController, List<Map<String, String>> litems) {
  return ListView(
    children: <Widget>[
      Container(
        child: Center(
          child: Chewie(
            controller: chewieController,
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3),
        child: WhatWillYouLearn(),
      ),
      YourFaculties(),
      SingleFaculty(litems[0]['name'], litems[0]['picture'],
          litems[0]['designation'], litems[0]['description']),
      SingleFaculty(litems[0]['name'], litems[0]['picture'],
          litems[0]['designation'], litems[0]['description']),
      SingleFaculty(
        litems[0]['name'],
        litems[0]['picture'],
        litems[0]['designation'],
        litems[0]['description'],
      ),
      query(),
    ],
  );
}

Widget Page2() {
  return Center(
    child: Text('page no 2'),
  );
}

//  return CustomScrollView(
//    slivers: <Widget>[
//      const SliverAppBar(
//
//        floating: true, pinned: false, snap: false,
//        expandedHeight: 100.0,
//        flexibleSpace: FlexibleSpaceBar(
//          title: Text('Demo'),
//        ),
//      automaticallyImplyLeading: false,
//
//      ),
//
//      SliverGrid(
//        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//          maxCrossAxisExtent: 100.0,
//        ),
//        delegate: SliverChildBuilderDelegate(
//              (BuildContext context, int index) {
//            return Container(
//              width: 160,
//              height: 90,
//              alignment: Alignment.center,
//              color: Colors.teal[100 * (index % 9)],
//              child: Text('grid item $index'),
//            );
//          },
//          childCount: 20,
//        ),
//      ),
//      SliverFixedExtentList(
//        itemExtent: 50.0,
//        delegate: SliverChildBuilderDelegate(
//              (BuildContext context, int index) {
//            return Container(
//              alignment: Alignment.center,
//              color: Colors.lightBlue[100 * (index % 9)],
//              child: Text('list item $index'),
//            );
//          },
//        ),
//      ),
//    ],
//  );

//
