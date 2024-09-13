import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_traddy/pages/auth_page/repository/auth_repository.dart';
import 'package:bloc_traddy/pages/pin_page/ui/pin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/navigation_service.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthRepository respository = AuthRepository();

  AuthBloc() : super(AuthInitialState()) {
    on<AuthInitialEvent>(authInitialEvent);
    on<AuthLoadingEvent>(authLoadingEvent);
    on<AuthLoadedSuccessEvent>(authLoadedSuccessEvent);
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
    on<SignUpButtonClickedEvent>(signUpButtonClickedEvent);
  }

  FutureOr<void> authInitialEvent(AuthInitialEvent event, Emitter<AuthState> emit) {}

  FutureOr<void> authLoadingEvent(AuthLoadingEvent event, Emitter<AuthState> emit) {}

  FutureOr<void> authLoadedSuccessEvent(AuthLoadedSuccessEvent event, Emitter<AuthState> emit) {}

  FutureOr<void> loginButtonClickedEvent(LoginButtonClickedEvent event, Emitter<AuthState> emit) {
    Navigator.of(NavigationService.navigatorKey.currentContext!).push(
      MaterialPageRoute(
        builder: (_) => const PinPage()
      ),
    );
  }

  FutureOr<void> signUpButtonClickedEvent(SignUpButtonClickedEvent event, Emitter<AuthState> emit) {
    // respository.signUpAPI(userName, password);

  }

}
