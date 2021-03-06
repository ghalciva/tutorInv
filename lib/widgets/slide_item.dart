import 'package:flutter/material.dart';

import '../model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

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
              image: AssetImage(slideList[index].sliderImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          slideList[index].sliderHeading,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          slideList[index].sliderSubHeading,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
