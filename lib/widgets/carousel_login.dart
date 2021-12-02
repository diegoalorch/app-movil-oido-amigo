import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselLogin extends StatefulWidget {
  @override
  _CarouselLoginState createState() => _CarouselLoginState();
}

class _CarouselLoginState extends State<CarouselLogin> {
  final urlImages = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    var getScreenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: getScreenHeight,
      child: CarouselSlider(
          items: urlImages
              .map((item) => Container(
                    child: Container(
                      child: Image.asset(
                        item,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      width: double.infinity,
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              height: getScreenHeight)),
    );
  }
}
