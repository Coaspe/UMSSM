import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssm/src/blocs/account_bloc.dart';
import 'package:ssm/src/resources/account_repository.dart';
import 'package:ssm/src/ui/home/pages/pages.dart';

class App extends StatelessWidget {
  const App({super.key, required AccountRepository accountRepository})
      : _accountRepository = accountRepository;
  final AccountRepository _accountRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _accountRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AccountBloc>(
              create: (_) => AccountBloc(accountRepository: _accountRepository))
        ],
        child: const MainPage(),
      ),
    );
  }
}
