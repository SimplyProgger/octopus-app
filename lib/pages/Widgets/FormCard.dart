import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCard extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          key: _formKey,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Вход в учетную запись",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Имя пользователя",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(30))),
            TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Введи email';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Пример: 12345678@gmail.com",
                  ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Пароль",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(30))),
            TextFormField(
              validator: (input) {
                if(input.length < 6) {
                  return 'Пароль должен содержать больше 6 символов';
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Пример: 12345678",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
                labelText: "Пароль"
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Center(
                    child: Text("Забыли пароль?",style:
                      TextStyle(
                        color: Colors.blue
                      )
                      ,),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

