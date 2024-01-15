part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CheckAuth extends AuthEvent {}
