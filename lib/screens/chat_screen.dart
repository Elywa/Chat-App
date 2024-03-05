import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'ChatScreen';
  bool isLodaing = false;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context, snapShot) {
          isLodaing = true;
          if (snapShot.hasData) {
            List<Message> messagesList = [];
            isLodaing = false;
            for (int i = 0; i < snapShot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapShot.data!.docs[i]));
            }
            //print(snapShot.data!.docs[0]['message']);
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kImage,
                      height: 50,
                    ),
                    const Text(
                      'Chat',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return ChatBubble(message: messagesList[index],);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add(
                          {
                            kmessage: data,
                          },
                        );
                        controller.clear();
                      },
                      decoration: InputDecoration(
                        hintText: 'Send Message',
                        suffixIcon: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ModalProgressHUD(
              color: Colors.transparent,
              inAsyncCall: isLodaing,
              child: Scaffold(),
            );
          }
        });
  }
}
