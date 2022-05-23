import 'dart:convert';

import 'package:cryptop/app/dependency.dart';
import 'package:cryptop/services/rest_service..dart';
import 'package:web_socket_channel/io.dart';

class WebSocketService {
  RestService get rest => dependency();

  Stream<dynamic> getTicker(url) async* {
    print('hi');
    final channel = IOWebSocketChannel.connect(
        'wss://stream.binance.com:9443/stream?streams=' +
            url.substring(0, url.length - 1));

    await for (final value in channel.stream) {
      print(value);
      yield jsonDecode(value.toString());
    }
  }
}
