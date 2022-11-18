import 'package:flutter/material.dart';
import 'package:ssm/src/constant.dart';
import 'package:ssm/src/ui/home/widgets/animatedSliverAppBar.dart';
import 'package:ssm/src/ui/home/widgets/settlementRoomButton.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const AnimatedSliverAppBar(),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return SettlementRoomButton(
                      roomInfo: settle1,
                    );
                  },
                  childCount: 6,
                ),
              )),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.blue[100 * (index % 9)],
                      child: Text('grid item $index'),
                    );
                  },
                  childCount: 6,
                ),
              ))
        ],
      ),
    );
  }
}
