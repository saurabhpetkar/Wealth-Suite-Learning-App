import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../models/video.dart';
import './style.dart';

class ListVideo extends StatelessWidget {
  final Function SelectVideo;
  final Video video;

  ListVideo(this.video, this.SelectVideo);

  @override
  Widget build(BuildContext context) {
    int max_l = (MediaQuery.of(context).size.width * 0.08).toInt();
    return GestureDetector(
      onTap: () {
        SelectVideo(video);
        Navigator.pushReplacementNamed(context, '/video');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 170,
            height: 130,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Center(child: CircularProgressIndicator()),
                  Center(
                    child: FadeInImage.memoryNetwork(
                      fit: BoxFit.fill,
                      placeholder: kTransparentImage,
                      image:
                          'https://shawglobalnews.files.wordpress.com/2019/02/dragon-aurora.jpg',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 170,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Video no.${video.number}: ${video.name}',
                    style: video_name,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    video.course,
                    style: course_name,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(video.description.substring(0, max_l) + '...',
                      style: video_description),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
