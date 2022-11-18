import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssm/src/blocs/account_bloc.dart';
import 'package:ssm/src/constant.dart';
import 'package:ssm/src/ui/home/pages/feed.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Widget input(String hint, {bool isPass = false}) {
  return TextField(
    obscureText: isPass,
    decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFACACAC), fontSize: 14),
        contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 38),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(100, 68, 51, 48)),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 68, 51, 48)),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        )),
  );
}

Widget divider(Size size) {
  return Container(
    width: size.width * 0.8,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          height: 50,
        ),
        Divider(
          color: Colors.black,
        ),
        // Text(
        //   "가입하기 귀찮지?",
        //   style: GoogleFonts.jua(fontSize: 14),
        // ),
        Divider(),
      ],
    ),
  );
}

class _LoginPageState extends State<LoginPage> {
  Color bottomColor = loginBackgroundColors[0];
  Color topColor = loginBackgroundColors[loginBackgroundColors.length - 1];
  int _backgroundColorIdx = 0;
  int _sloganIdx = Random(1234).nextInt(loginSlogans.length - 1);
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 2),
        (_) => setState(() {
              _sloganIdx = Random(1234).nextInt(loginSlogans.length);
            }));
    Future.delayed(
        const Duration(seconds: 1),
        () => setState(
              () {
                bottomColor = topColor;
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          onEnd: () {
            setState(() {
              _backgroundColorIdx += 1;
              bottomColor = loginBackgroundColors[
                  _backgroundColorIdx % loginBackgroundColors.length];
              topColor = loginBackgroundColors[
                  (_backgroundColorIdx + 1) % loginBackgroundColors.length];
            });
          },
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: begin, end: end, colors: [bottomColor, topColor])),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("얼마씀?", style: GoogleFonts.jua(fontSize: 45)),
                  Text(loginSlogans[_sloganIdx],
                      style: GoogleFonts.jua(fontSize: 15)),
                ],
              ),
              // const SizedBox(
              //   height: 50,
              // ),
              // Column(
              //   children: [
              //     Container(
              //       width: size.width * 0.8,
              //       margin: const EdgeInsets.only(top: 18),
              //       child: input('Email'),
              //     ),
              //     Container(
              //       width: size.width * 0.8,
              //       margin: const EdgeInsets.only(top: 18),
              //       child: input('Password', isPass: true),
              //     ),
              //   ],
              // ),
              divider(size),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      child: Image.asset(
                        'assets/images/oauth/google.png',
                        width: 45,
                      ),
                      onTap: () =>
                          // context.read<AccountBloc>().add(RequestGoogleLogin())
                          Navigator.of(context).push(
                              PlatformAdaptedRouter((p0) => const FeedPage())))
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}

Route PlatformAdaptedRouter(Widget Function(BuildContext) builder) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: builder);
  } else {
    return MaterialPageRoute(builder: builder);
  }
}
