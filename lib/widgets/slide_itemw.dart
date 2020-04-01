import 'package:flutter/material.dart';

import '../model/slider.dart';

class SlideItemW extends StatelessWidget {
  final int index;
  SlideItemW(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(sliderList[index].sliderImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
