import 'package:flutter/material.dart';
import 'package:octopus/pages/Widgets/style.dart';

class SecondFragment extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.12),
                offset: Offset(0, 10),
                blurRadius: 30
              )
            ]),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 12),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Искать...",
                  hintStyle: searchBarStyle,
                  suffixIcon: Icon(Icons.search)
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(right: 260),
          child: Text("Тренды", style: headingStyle,),
        ),
        SizedBox(height: 16,),
        Container(
          height: 240,
        )
      ],
    );
  }
}