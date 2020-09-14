import 'package:facebookclone/resources/colors.dart';
import 'package:facebookclone/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Address', style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)),
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
            Text(AppStrings.qEmail,
                style: TextStyle(color: Colors.black, fontSize: 20 , fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),

            Container(
//              i do not know how to make this width as wide as the buttom's...
              width: 300,
              child: Flexible(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email Address'),
                ),
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
                    Navigator.pushNamed(context, "/password");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
