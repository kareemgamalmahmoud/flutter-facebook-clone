import 'package:facebookclone/PODO/User.dart';
import 'package:facebookclone/blocs/auth/auth/auth_events.dart';
import 'package:facebookclone/blocs/auth/auth/auth_states.dart';
import 'package:facebookclone/blocs/auth/bloc.dart';
import 'package:facebookclone/services/AuthServices.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends BLoC<AuthEvent>{

  PublishSubject<AuthState> subject = PublishSubject<AuthState>();
  AuthServices _authServices = AuthServices();

  @override
  void dispatch(AuthEvent event) {
    if(event is LoginTapped){
      _loginWithEmail(event.email, event.password);
    }
  }


  Future<void> _loginWithEmail(String email,String password) async {
    User user = await _authServices.loginWithEmail(email, password);
    subject.add(UserIsLoggedIn(user));
  }
}