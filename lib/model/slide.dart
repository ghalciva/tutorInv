import 'package:flutter/cupertino.dart';
import 'package:tutorInv/constants/constants.dart';

class Slide {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slide(
      {@required this.sliderImageUrl,
      @required this.sliderHeading,
      @required this.sliderSubHeading});
}

final slideList = [
    Slide(
        sliderImageUrl: 'assets/images/slider_1.png',
        sliderHeading: Constants.SLIDER_HEADING_1,
        sliderSubHeading: Constants.SLIDER_DESC1),
    Slide(
        sliderImageUrl: 'assets/images/slider_2.png',
        sliderHeading: Constants.SLIDER_HEADING_2,
        sliderSubHeading: Constants.SLIDER_DESC2),
    Slide(
        sliderImageUrl: 'assets/images/slider_3.png',
        sliderHeading: Constants.SLIDER_HEADING_3,
        sliderSubHeading: Constants.SLIDER_DESC3),
  ];
