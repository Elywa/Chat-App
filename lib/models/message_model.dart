import 'package:chat_app/constants.dart';

class Message {
  final String text;
  final String id;
  Message(this.text, {required this.id});

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kmessage], id: jsonData['id']);
  }
}
