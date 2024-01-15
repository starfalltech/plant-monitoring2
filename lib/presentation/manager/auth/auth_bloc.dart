import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<CheckAuth>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 3470));
      emit(const AuthState(status: AuthStatus.success));
    });
  }
}
