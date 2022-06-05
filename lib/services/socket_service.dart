import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static late io.Socket _socket;

  static void connectAndListen() {
    _socket = io.io(
        'http://10.0.2.2:5000',
        // 'http://localhost:5000',
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setQuery({'userName': 'ahmad'})
            .build());

    _socket.connect();

    _socket.on('message', (data) {
      print(data);
    });

    _socket.on('users', (data) {
      var users = (data as List<dynamic>).map((e) => e.toString()).toList();
    });
  }

  static void dispose() {
    _socket.dispose();
    _socket.destroy();
    _socket.close();
    _socket.disconnect();
  }
}
