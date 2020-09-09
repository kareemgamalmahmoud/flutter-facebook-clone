import 'package:facebookclone/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BirthdayScreen extends StatefulWidget {
  @override
  _BirthdayScreenState createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birthday', style: TextStyle(color: Colors.black)),
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
            Text('What\'s your Birthday ?',
                style: TextStyle(color: Colors.black, fontSize: 20)),
            SizedBox(
              height: 30,
            ),

//           source :  https://www.youtube.com/watch?v=snpKbe3yZmI

            SizedBox(
              height: 100,
              child: CupertinoDatePicker(
                initialDateTime: _dateTime,
                use24hFormat: true,
              mode: CupertinoDatePickerMode.date,
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
                    Navigator.pushNamed(context, "/gender");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
