import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

import '../controllers/give_controller.dart';

class GiveView extends GetView<GiveController> {
  GiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GiveView'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            StreamPlayingExample(),
            ElevatedButton(
                onPressed: () {
                  controller.sendMessagesToServer();
                },
                child: Text("send"))
          ],
        ));
  }
}

class StreamPlayingExample extends StatefulWidget {
  final String url = "http://192.168.1.20:8000/live/exercise.flv";
  const StreamPlayingExample({super.key});

  @override
  State<StreamPlayingExample> createState() => _StreamPlayingExampleState();
}

class _StreamPlayingExampleState extends State<StreamPlayingExample> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.setDataSource(widget.url, autoPlay: true);
    print("player is initialized");
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
    print("player is released");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      alignment: Alignment.center,
      child: FijkView(
        player: player,
      ),
    );
  }
}
