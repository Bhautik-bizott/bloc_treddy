part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

abstract class AuthRedirectionEvent extends AuthEvent{}

class AuthInitialEvent extends AuthEvent {}

class AuthLoadingEvent extends AuthEvent {}

class AuthLoadedSuccessEvent extends AuthEvent {}

class LoginButtonClickedEvent extends AuthRedirectionEvent {}

class SignUpButtonClickedEvent extends AuthRedirectionEvent {}