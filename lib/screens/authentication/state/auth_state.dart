abstract class AuthState {
  AuthState();
}

class AuthSignUP extends AuthState {
  AuthSignUP();
}

class AuthSignIn extends AuthState {
  AuthSignIn();
}

class AuthConfirmation extends AuthState {
  AuthConfirmation();
}
class AuthID extends AuthState {
  AuthID();
}

class AuthSplash extends AuthState {
  double _time;
  AuthSplash(this._time);
}

class AuthInitial extends AuthState {
  AuthInitial();
}
