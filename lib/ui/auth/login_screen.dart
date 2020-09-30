import 'package:facebookclone/blocs/auth/auth/auth_bloc.dart';
import 'package:facebookclone/blocs/auth/auth/auth_events.dart';
import 'package:facebookclone/blocs/auth/auth/auth_states.dart';
import 'package:facebookclone/resources/colors.dart';
import 'package:facebookclone/resources/strings.dart';
import 'package:flutter/material.dart';

class Login_Screen extends StatefulWidget {
  @override
  Login_ScreenState createState() => Login_ScreenState();
}

class Login_ScreenState extends State<Login_Screen> {
  final TextStyle textStyle = TextStyle(color: AppColors.textColor);

  final _formKey = GlobalKey<FormState>();
  bool _visible = false;

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  bool showLoading = false;

  AuthBloc _authBloc = AuthBloc();
  String userName;

  @override
  void initState() {
    _authBloc.subject.listen((AuthState state) {
      if (state is UserIsLoggedIn) {
        setState(() {
          userName = state.user.name;
          showLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            _buildLogo(),
            userName != null ? Text("Hi $userName") : Container(),
            SizedBox(
              width: 300,
              child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: ListTile(
                  title: Text("Please enter your email and password",
                      style: TextStyle(color: Colors.red, fontSize: 12)),
                  trailing: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            _buildTextFields(emailCtrl, passwordCtrl),
            SizedBox(
              height: 20,
            ),
            _buildButtons(context),
            showLoading ? CircularProgressIndicator() : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 85, left: 85),
                  child: Text(
                    'Sign Up for Facebook',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Icon(
                  Icons.announcement, //i can not find the (?) mark !!!!
                  color: Colors.grey,
                  size: 25.0,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      padding: EdgeInsets.only(bottom: 40, top: 70),
      child: Image.asset(
        AssetStrings.logo_text,
        height: 50,
        width: 200,
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildButton(AppStrings.login, AppColors.blue, AppColors.white, () {
              _authBloc.dispatch(LoginTapped(emailCtrl.text, passwordCtrl.text));
              setState(() {
                showLoading = true;
              });
//                  !_formKey.currentState.validate() ? setState(() {
//              _visible = !_visible;
//            }) : Navigator.pushNamed(context, "/");
//
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      String st, Color background, Color textColor, Function onPressed) {
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

  Widget _buildTextFields(
      TextEditingController Ctrl1, TextEditingController Ctrl2) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: 200,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: TextFormField(
                controller: Ctrl1,
                validator: (value) {
                  if (value.isEmpty) {
                    return "email !";
                  }
                },
                decoration: InputDecoration(labelText: AppStrings.login_email),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
              child: TextFormField(
                controller: Ctrl2,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Password";
                  }
                },
                decoration:
                    InputDecoration(labelText: AppStrings.login_password),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
