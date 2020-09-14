import 'package:facebookclone/resources/colors.dart';
import 'package:facebookclone/resources/strings.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.gender, style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Text(AppStrings.qGender,
                style: TextStyle(color: Colors.black, fontSize: 20 ,fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Text(AppStrings.dGender,
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            SizedBox(
              height: 50,
            ),
            for (int i = 1; i <= 3; i++)
              Container(
                padding: const EdgeInsets.only(left: 15 , right: 15),
                child: Column(

                  children: <Widget>[ Container(
                    child: ListTile(
                      subtitle: i == 3 ? Text(AppStrings.customD) : null,
                      title: i == 1 ? Text(AppStrings.female) : ( i == 2 ? Text(AppStrings.male): Text(AppStrings.custom)),
                      trailing: Radio(
                        value: i,
                        groupValue: _value,
                        onChanged: i == 5
                            ? null
                            : (int value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                      ),
                    ),
                  ),
                    Divider(
                        color: Colors.black
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 80,
            ),
            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: RaisedButton(
                  color: AppColors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Next',
                    style: TextStyle(color: AppColors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/email");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
