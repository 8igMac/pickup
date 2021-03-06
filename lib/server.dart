import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'noti.dart';

class Server extends ChangeNotifier {
  StreamController<Noti> _controller = StreamController.broadcast();
  late int _id;
  late final String? _ip;
  late final String? _port;

  Server() {

    print("HOST: ${dotenv.env['HOST']}, PORT: ${dotenv.env['PORT']}");//debug
    _ip = dotenv.env['HOST'];
    _port = dotenv.env['PORT'];

    try {
      final _client = http.Client();
      var request = http.Request(
        'GET',
        Uri.parse('http://$_ip:$_port/api/subscribe'),
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
      Uri.parse('http://$_ip:$_port/api/register_driver/$_id'),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Choose driver error.');
    }
  }

  Future<void> chooseDriver() async {
    final response = await http.get(
      Uri.parse('http://$_ip:$_port/api/choose_driver/$_id'),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Choose driver error.');
    }
  }

  Future<void> driverLocation() async {
    final response = await http.get(
      Uri.parse('http://$_ip:$_port/api/driver_location/$_id'),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Choose driver error.');
    }
  }

  Future<void> driverFinished() async {
    final response = await http.get(
      Uri.parse('http://$_ip:$_port/api/driver_finished/$_id'),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Choose driver error.');
    }
  }

  Future<void> driverRate(int score) async {
    final response = await http.post(
      Uri.parse('http://$_ip:$_port/api/rating_score/driver/$_id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'rating': score.toString(),
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Rating error');
    }
  }

  Future<void> passengerRate(int score) async {
    final response = await http.post(
      Uri.parse('http://$_ip:$_port/api/rating_score/passenger/$_id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'rating': score.toString(),
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Rating error.');
    }
  }
}
