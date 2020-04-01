import 'package:flutter/cupertino.dart';

class Slider {
  final String sliderImageUrl;

  Slider(
      {@required this.sliderImageUrl});
}

final sliderList = [
    Slider(
        sliderImageUrl: 'assets/images/slider_1.png'),
    Slider(
        sliderImageUrl: 'assets/images/slider_2.png'),
    Slider(
        sliderImageUrl: 'assets/images/slider_3.png'),
  ];
