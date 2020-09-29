abstract class AuthEvent{}

class LoginTapped extends AuthEvent{
  String email;
  String password;
  LoginTapped(this.email,this.password);
}

class Logout extends AuthEvent{}