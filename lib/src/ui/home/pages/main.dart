import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssm/src/blocs/account_bloc.dart';
import 'package:ssm/src/ui/home/pages/pages.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home:
            BlocBuilder<AccountBloc, AccountState>(builder: ((context, state) {
          if (state.status == AccountStatus.authenticated) {
            return const FeedPage();
          } else {
            return const LoginPage();
          }
        })));
  }
}
