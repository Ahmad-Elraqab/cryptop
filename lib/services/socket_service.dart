import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static late io.Socket socket;
  static NotificationService get notify => dependency();

  static void connectAndListen() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    final token = _storage.get('token');

    await notify.initNotification();
    socket = io.io(
        // 'http://localhost:5000/user',
        // 'http://10.0.2.2:5000/user',
        'https://alert-sys.herokuapp.com/user',
        io.OptionBuilder()
            .setTransports(['websocket'])
            .setExtraHeaders({'token': token})
            .disableAutoConnect()
            .build());

    socket.connect();
    socket.on('message', (data) async {
      print(data['title']);
      await notify.showNotification(data['title'], data['msg']);
    });

    // socket.on('users', (data) {
    //   var users = (data as List<dynamic>).map((e) => e.toString()).toList();
    // });
  }

  static void dispose() {
    socket.dispose();
    socket.destroy();
    socket.close();
    socket.disconnect();
  }
}
