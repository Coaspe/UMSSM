import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: _buildAppBarActionButton(child: const BackButton()),
        actions: [_buildAppBarActionButton(child: const BackButton())],
      ),
      body: const Text(
        'Test',
      ),
    );
  }

  Widget _buildAppBarActionButton({required Widget child}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Material(
          shape: CircleBorder(),
          child: SizedBox.square(dimension: 40),
        ),
        Center(child: child),
      ],
    );
  }
}
