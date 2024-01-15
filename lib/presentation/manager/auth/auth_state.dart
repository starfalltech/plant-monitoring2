part of 'auth_bloc.dart';

enum AuthStatus { initial, success, failure, loading }

final class AuthState extends Equatable {
  final AuthStatus status;

  const AuthState({
    this.status = AuthStatus.initial,
  });

  AuthState copyWith({
    AuthStatus? status,
  }) =>
      AuthState(
        status: status ?? this.status,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
