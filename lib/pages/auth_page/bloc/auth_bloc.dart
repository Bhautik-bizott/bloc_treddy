import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
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

  FutureOr<void> loginButtonClickedEvent(LoginButtonClickedEvent event, Emitter<AuthState> emit) {}

  FutureOr<void> signUpButtonClickedEvent(SignUpButtonClickedEvent event, Emitter<AuthState> emit) {}

}
