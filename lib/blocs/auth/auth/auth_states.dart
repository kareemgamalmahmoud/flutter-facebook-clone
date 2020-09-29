import 'package:facebookclone/PODO/User.dart';

abstract class AuthState{}

class UserIsLoggedIn extends AuthState{
  User user;
  UserIsLoggedIn(this.user);
}