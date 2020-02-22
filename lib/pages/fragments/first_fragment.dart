import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:octopus/pages/Widgets/style.dart';

class FirstFragment extends StatelessWidget {

Widget image_carousel = new Container(
  height: 220,
  width: 400,
  child: new Carousel(
    images: [
      AssetImage('assets/image_02.png'),
      AssetImage('assets/image_01.png')
    ],
    autoplay: true,
    dotSize: 6.0,
    dotSpacing: 20.0,
    dotBgColor: Colors.blueAccent.withOpacity(0.5),
    indicatorBgPadding: 5.0,
    animationCurve: Curves.easeOut,
  )
);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: image_carousel,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(right: 190),
          child: Text("Обновления",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 30
          ),),
        ),
        Container(
          width: 350,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white70.withOpacity(1.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,color: Colors.grey[300],spreadRadius: 5
              )
            ]
          ),
          child: Column(
            children: <Widget>[

            ],
          )
        )
      ],
    );
  }
}
