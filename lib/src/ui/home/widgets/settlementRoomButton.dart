import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssm/src/constant.dart';
import 'package:ssm/src/models/models.dart';

class SettlementRoomButton extends StatefulWidget {
  const SettlementRoomButton({
    super.key,
    required this.roomInfo,
  });
  final Settlement roomInfo;

  @override
  State<SettlementRoomButton> createState() => _SettlementRoomButtonState();
}

class _SettlementRoomButtonState extends State<SettlementRoomButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scale = _animationController
        .drive(Tween<double>(begin: 1, end: 0.88))
        .drive(CurveTween(curve: Curves.bounceIn));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Column getTotalPaymentText() {
    List<Text> list = [];
    widget.roomInfo.totalPayment.forEach(
      (key, value) => list.add(
        Text(
          value.toString(),
          style: GoogleFonts.jua(fontSize: 18),
        ),
      ),
    );
    return Column();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() async {
          await _animationController.forward();
          await _animationController.reverse();
        }),
        child: AnimatedBuilder(
            animation: _scale,
            builder: (context, _) {
              return Transform.scale(
                scale: _scale.value,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: loginBackgroundColors[2],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(6, 6),
                            blurRadius: 15,
                            spreadRadius: 1),
                        BoxShadow(
                            color: loginBackgroundColors[1],
                            offset: const Offset(-6, -6),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Image.asset(
                            fit: BoxFit.none,
                            scale: 4,
                            color: logoBackgroundColor.withOpacity(0.1),
                            "assets/images/logo/logo_without_background_text_colorReversed.png"),
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.roomInfo.title,
                                  style: GoogleFonts.jua(fontSize: 24),
                                ),
                                const Icon(Icons.more_vert)
                              ],
                            ),
                            getTotalPaymentText()
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              );
            }));
  }
}
