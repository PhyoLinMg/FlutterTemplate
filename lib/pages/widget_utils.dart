import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:template/pages/dotted_slider.dart';

//use Dotted Slider
dottedSlider(List<String> images) {
  return DottedSlider(
    maxHeight: 200,
    children: images.map((e) => _slideImage(e)).toList(),
  );
}

//here you can customize the image layout
Widget _slideImage(String imageUrl) {
  return Container(
    height: 200,
    width: double.infinity,
    decoration: BoxDecoration(
      image:
          DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.contain),
    ),
  );
}

//chip layout in filter
Padding buildChip(
    String label, Color color, String avatarTitle, Color textColor) {
  return Padding(
    padding: const EdgeInsets.only(top: 2.0, right: 2.0, left: 2.0),
    child: FilterChip(
      padding: EdgeInsets.all(4.0),
      label: Text(
        label,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(
        side: BorderSide(color: color),
      ),
      onSelected: (bool value) {
        print("selected");
      },
    ),
  );
}

//Price Filter between lowest and highest
getPriceFilter(double lowerValue, double upperValue) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(
            top: 16.0, bottom: 8.0, left: 8.0, right: 8.0),
        child: Text("PRICE"),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("\$ " + '$lowerValue'),
            Text("\$ " + '$upperValue'),
          ],
        ),
      ),
      FlutterSlider(
        tooltip: FlutterSliderTooltip(
          leftPrefix: Icon(
            Icons.attach_money,
            size: 19,
            color: Colors.black45,
          ),
          rightSuffix: Icon(
            Icons.attach_money,
            size: 19,
            color: Colors.black45,
          ),
        ),
        trackBar: FlutterSliderTrackBar(
          inactiveTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black12,
            border: Border.all(width: 3, color: Colors.blue),
          ),
          activeTrackBar: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.red.withOpacity(0.5)),
        ),
        //value is to set default price to lower and higher price
        values: [30, 420],
        rangeSlider: true,
        max: 500,
        min: 0,
        onDragging: (handlerIndex, lowerValue, upperValue) {
          // _lowerValue = lowerValue;
          // _upperValue = upperValue;
          // setState(() {});
        },
      )
    ],
  );
}
