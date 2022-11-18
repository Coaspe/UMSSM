part of 'account_bloc.dart';

enum AccountStatus { authenticated, unauthenticated }

class AccountState extends Equatable {
  const AccountState({required this.status, this.user = SUser.empty});
  const AccountState.authenticated(SUser user)
      : this(status: AccountStatus.authenticated, user: user);
  const AccountState.unauthenticated()
      : this(status: AccountStatus.unauthenticated);
  final AccountStatus status;
  final SUser user;

  @override
  List<Object> get props => [status, user.email];
}
