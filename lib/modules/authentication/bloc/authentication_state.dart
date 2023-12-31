part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._(
      {this.status = AuthenticationStatus.unauthenticated,
      this.user = User.empty});

  const AuthenticationState.unknown(User user)
      : this._(status: AuthenticationStatus.unknown, user: user);

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.profile(User user)
      : this._(status: AuthenticationStatus.profile, user: user);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
