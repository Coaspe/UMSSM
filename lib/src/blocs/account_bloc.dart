import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssm/src/models/user.dart';
import 'package:ssm/src/resources/account_repository.dart';
import 'package:ssm/src/util/firebase.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({required AccountRepository accountRepository})
      : _accountRepository = accountRepository,
        super(const AccountState(
            status: AccountStatus.unauthenticated, user: SUser.empty)) {
    on<AccountChanged>(_onAccountChanged);
    on<AccountInfoChanged>(_onAccountInfoChanged);
    on<RequestGoogleLogin>(_onRequestGoogleLogin);
    _userSubscription = _accountRepository.firebaseUser.listen((value) async {
      if (value == null) {
        add(const AccountChanged(SUser.empty));
      } else {
        value.then(
          (user) {
            add(AccountChanged(user));
          },
        );
      }
    });
  }

  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _userChange;
  final AccountRepository _accountRepository;
  late final StreamSubscription<Future<SUser>?> _userSubscription;
  void _onRequestGoogleLogin(
      RequestGoogleLogin event, Emitter<AccountState> emit) {
    _accountRepository.logInWithGoogle();
  }

  void _onAccountChanged(AccountChanged event, Emitter<AccountState> emit) {
    if (event.user.isNotEmpty) {
      emit(AccountState.authenticated(event.user));
      if (_userChange != null) _userChange!.cancel();

      // 이 코드에서는 어떤 필드가 추가, 삭제, 수정되었는지 구분이 불가능하다.
      _userChange = FireStoreMethods.fs
          .collection("users")
          .doc(event.user.email)
          .snapshots()
          .listen((snap) {
        add(AccountChanged(
            SUser.fromJson(snap.data() as Map<String, dynamic>)));
      });
    } else {
      emit(const AccountState.unauthenticated());
      if (_userChange != null) _userChange!.cancel();
    }
  }

  void _onAccountInfoChanged(
      AccountInfoChanged event, Emitter<AccountState> emit) {
    AccountState newState = AccountState.authenticated(event.user);
    emit(newState);
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    if (_userChange != null) _userChange?.cancel();
    return super.close();
  }
}
