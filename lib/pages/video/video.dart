import '../../scoped_models/main.dart';
import './drawer.dart';
import './appbar.dart';
import '../../models/video.dart';
import './style.dart';
import './single_listvideo.dart';

import 'package:chewie/chewie.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final MainModel model;

  VideoPage(this.model);

  Video selected_video;

  @override
  State<StatefulWidget> createState() {
    return VideoPageState();
  }
}

//final mobile_width = MediaQuery.of(context).size.width;

class VideoPageState extends State<VideoPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool video_loader = false;
  double opacity = 0;

  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  AnimationController _animcontroller;
  Animation<double> _listAnim;

  @override
  void initState() {
    super.initState();
    _animcontroller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _listAnim = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animcontroller,
        curve: Interval(0.0, 1),
      ),
    )..addListener(() {
        setState(() {});
      });
    _animcontroller.forward();

    widget.selected_video = widget.model.SelectedVideo;
    _videoPlayerController1 =
        VideoPlayerController.network(widget.selected_video.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 16 / 9,
      autoPlay: true,
      autoInitialize: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );

    _videoPlayerController1.addListener(() {
      if (_videoPlayerController1.value.isPlaying) {
        //print('playing');
        Duration duration = _videoPlayerController1.value.duration;
        Duration position = _videoPlayerController1.value.position;
        if (duration.inSeconds - 5 < position.inSeconds) {
          setState(
            () {
              opacity = 1;
            },
          );
        }
      }

      if (_videoPlayerController1.value.isBuffering == true) {
        setState(() {
          video_loader = true;
        });
      }
    });
  }

  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

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
      appBar: appbar(_scaffoldKey),
      body: widget.model.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Chewie(
                          controller: _chewieController,
                        ),
                      ),
                      Center(
                        child:
                            video_loader ? CircularProgressIndicator() : null,
                      ),
                    ],
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    'Video no.${widget.model.SelectedVideo.number}: ${widget.model.SelectedVideo.name}',
                    style: video_name,
                  ),
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.model.SelectedVideo.course,
                            style: course_name,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.model.SelectedVideo.description,
                            style: video_description,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(0, 300 * (1 - _listAnim.value)),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ListVideo(
                          widget.model.SelectedVideo, widget.model.SelectVideo);
                    },
                    itemCount: list.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                  ),
                ),
              ],
            ),
    );
  }
}
