import 'package:facebookclone/ui/auth/email.dart';
import 'package:facebookclone/ui/auth/gender_screen.dart';
import 'package:facebookclone/ui/auth/password.dart';
import 'package:facebookclone/ui/time_line_pakage/time_line_screen.dart';

import 'auth/birthday_screen.dart';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'auth/signup_screen.dart';
import 'initial_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      routes: {
        '/':(BuildContext context) => HomePage(),
//        '/':(BuildContext context) => InitialScreen(),
        '/signupScreen': (BuildContext context) => SignupScreen(),
        '/birthdayScreen': (BuildContext context) => BirthdayScreen(),
        '/gender': (BuildContext context) => Gender(),
        '/email': (BuildContext context) => Email(),
        '/password': (BuildContext context) => Password(),
        '/Login_Screen': (BuildContext context) => Login_Screen(),
      },
    );
  }
}
