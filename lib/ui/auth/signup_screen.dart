import 'package:facebookclone/resources/colors.dart';
import 'package:facebookclone/resources/strings.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name', style: TextStyle(color: Colors.black)),
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
            Text('What\'s your name?',
                style: TextStyle(color: Colors.black, fontSize: 20)),
            SizedBox(
              height: 30,
            ),
            _textField(),
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
                    Navigator.pushNamed(context, "/birthdayScreen");
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 20),
        Flexible(
          child: TextFormField(
            decoration: InputDecoration(labelText: 'First Name'),
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
