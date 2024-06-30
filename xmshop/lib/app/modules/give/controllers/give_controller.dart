import 'dart:io';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class GiveController extends GetxController {
  final count = 0.obs;
  late IO.Socket socket;

  @override
  void onInit() {
    super.onInit();

    print("init successfully");
    //connect to the server
    socket = IO.io(
        //'http://localhost:3000',
        'http://10.0.2.2:3000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    onConnect();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onConnect() {
    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    // socket.on('event', (data) => print(data));
    // socket.onDisconnect((_) => print('disconnect'));
    // socket.on('fromServer', (_) => print(_));
  }

  void sendMessagesToServer() {
    socket.emit('phone message', 'a message from phone');
  }

  void increment() => count.value++;
}
