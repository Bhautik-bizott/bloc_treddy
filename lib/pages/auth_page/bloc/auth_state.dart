part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

abstract class AuthRedirectionState {}

final class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedSuccessState extends AuthState {}

class LoginButtonClickedState extends AuthRedirectionState {}

class SignUpButtonClickedState extends AuthRedirectionState {}
