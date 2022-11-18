import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedSliverAppBar extends StatefulWidget {
  const AnimatedSliverAppBar({super.key});

  @override
  State<AnimatedSliverAppBar> createState() => _AnimatedSliverAppBarState();
}

class _AnimatedSliverAppBarState extends State<AnimatedSliverAppBar> {
  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      expandedHeight: 100,
      flexibleSpace: Center(
        child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(milliseconds: 300),
            child: Text('난 이 정산에 동의 못할세',
                style: GoogleFonts.jua(color: Colors.black, fontSize: 30))),
      ),
    );
  }
}
