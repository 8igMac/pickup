import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'noti.dart';

class Server extends ChangeNotifier {
  StreamController<Noti> _controller = StreamController.broadcast();
  late int _id;
  String ip = '192.168.0.4';
  String port = '3000';

  Server() {
    try {
      final _client = http.Client();
      var request = http.Request(
        'GET',
        Uri.parse('http://$ip:$port/api/subscribe'),
      );

      request.headers['Cache-Control'] = 'no-cache';
      request.headers['Accept'] = 'text/event-stream';

      Future<http.StreamedResponse> response = _client.send(request);
      response.asStream().listen((streamResponse) {
        print(
            'Received streamResponse.statusCode: ${streamResponse.statusCode}');
        streamResponse.stream.listen((data) {
          final json = jsonDecode(utf8.decode(data));
          print('Received data: ${json.toString()}');
          if (json['type'] != null && json['content'] != null) {
            _controller.add(Noti.fromJson(json));
          } else if (json['id'] != null) {
            _id = json['id'];
          } else {
            print('Unknown data format.');
          }
        });
      });
    } catch (error) {
      print('Error subscribing to server: $error');
    }
  }

  Stream<Noti> get notifications => _controller.stream;

  int get id => _id;

  Future<void> registerDriver() async {
    final response = await http.get(
      Uri.parse('http://$ip:$port/api/register_driver/$_id'),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Choose driver error.');
    }
  }

  Future<void> chooseDriver() async {
    final response = await http.get(
      Uri.parse('http://$ip:$port/api/choose_driver/$_id'),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Choose driver error.');
    }
  }
}
