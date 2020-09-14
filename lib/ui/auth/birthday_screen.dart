import 'dart:math';

import 'package:facebookclone/resources/colors.dart';
import 'package:facebookclone/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';


class BirthdayScreen extends StatefulWidget {


  @override
  _BirthdayScreenState createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {

  DateTime _dateTime = DateTime.now();

  Future<Null> _SelecDate(BuildContext context) async{
    final DateTime picker = await showDatePicker(context: context, initialDate: _dateTime , firstDate: new DateTime(2016) , lastDate: new DateTime(2021) );

    if(picker != null && picker != _dateTime){
      print('date selected : ${_dateTime.toString()}');
      setState(() {
        _dateTime = picker;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birthday', style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)),
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
            Text(AppStrings.qBirthday,
                style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),

//           source :  https://www.youtube.com/watch?v=snpKbe3yZmI

            SizedBox(
              height: 100,
              child: CupertinoDatePicker(

                initialDateTime: _dateTime,
                use24hFormat: true,
                mode:CupertinoDatePickerMode.date,

                onDateTimeChanged: (dataTime)
                {
                  setState(() {

                    _dateTime = dataTime;
                  });
                },
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
//                    return _SelecDate(context);
                    Navigator.pushNamed(context, "/gender");
                  }),
            )
          ],
        ),
      ),
    );
  }
}

