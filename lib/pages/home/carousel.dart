import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:carousel_slider/carousel_slider.dart';


class carousel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 5),
      pauseAutoPlayOnTouch: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 700),
      height: 200.0,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      items: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Stack(
            children: [
              Center(child: CircularProgressIndicator()),
              Center(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://shawglobalnews.files.wordpress.com/2019/02/dragon-aurora.jpg',
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Stack(
            children: [
              Center(child: CircularProgressIndicator()),
              Center(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg',
                ),
              ),
            ],
          ),
        ),ClipRRect(
          borderRadius: BorderRadius.circular(00),
          child: Stack(
            children: [
              Center(child: CircularProgressIndicator()),
              Center(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://shawglobalnews.files.wordpress.com/2019/02/dragon-aurora.jpg',
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Center(child: CircularProgressIndicator()),
              Center(
                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg'),
              ),
            ],
          ),
        ),


      ],
    );
  }


}
