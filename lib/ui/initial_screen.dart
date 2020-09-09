import 'package:facebookclone/resources/colors.dart';
import 'package:facebookclone/resources/strings.dart';
import 'package:flutter/material.dart';


class InitialScreen extends StatelessWidget {
  final TextStyle textStyle = TextStyle(color: AppColors.textColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 42,
            ),
            _buildLanguagesRow(),
            _buildLogo(),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguagesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("العربية", style: textStyle),
        Text(
          " - ",
          style: textStyle,
        ),
        Text(
          "Francais",
          style: textStyle,
        ),
        Text(" - ", style: textStyle),
        Text(
          "More...",
          style: TextStyle(color: AppColors.blueTextColor),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      padding: EdgeInsets.only(bottom: 120,top: 70),
      child: Image.asset(
        AssetStrings.logo,
        height: 50,
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildButton(AppStrings.login, AppColors.blue, AppColors.white, () {}),

            _buildButton(
              "Create New Facebook Account",
              AppColors.babyBlue,
              AppColors.blueTextColor,
                  () {
                Navigator.pushNamed(context, "/signupScreen");
              },
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: AppColors.blueTextColor),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String st, Color background, Color textColor, Function onPressed) {
    return Container(
      width: double.infinity,
      height: 45,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: RaisedButton(
          color: background,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Text(
            st,
            style: TextStyle(color: textColor),
          ),
          onPressed: onPressed),
    );
  }
}
