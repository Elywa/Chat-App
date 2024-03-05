import 'package:chat_app/constants.dart';

class Message {
  final String text;
  Message(this.text);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kmessage]);
  }
}
