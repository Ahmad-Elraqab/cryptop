import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/services/notification_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static late io.Socket _socket;
  static NotificationService get notify => dependency();

  static void connectAndListen() async {
    await notify.initNotification();
    _socket = io.io(
        // 'http://localhost:5000/user',
        'http://10.0.2.2:5000/user',
        // 'https://cryptop-sys.herokuapp.com/user',
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());

    _socket.connect();

    _socket.on('message', (data) async {
      print(data['title']);
      await notify.showNotification(data['title'], data['msg']);
    });

    // _socket.on('users', (data) {
    //   var users = (data as List<dynamic>).map((e) => e.toString()).toList();
    // });
  }

  static void dispose() {
    _socket.dispose();
    _socket.destroy();
    _socket.close();
    _socket.disconnect();
  }
}
