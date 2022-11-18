part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountLogout extends AccountEvent {}

class AccountChanged extends AccountEvent {
  const AccountChanged(this.user);

  final SUser user;
  @override
  List<Object> get props => [user];
}

class AccountInfoChanged extends AccountEvent {
  const AccountInfoChanged(this.user);

  final SUser user;

  @override
  List<Object> get props => [user];
}

class RequestGoogleLogin extends AccountEvent {}
