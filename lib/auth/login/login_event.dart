abstract class LoginEvent {}//3 possible events in Login

class LoginUsernameChanged extends LoginEvent {
  final String username;//hold the value that is being watched

  LoginUsernameChanged({required this.username});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends LoginEvent {}