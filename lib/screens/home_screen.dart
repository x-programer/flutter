import 'package:chat_app/widgets/chat_user_card.dart';
import 'package:chat_app/apis/apis.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(
              Icons.home,
              size: 33,
            ),
            title: const Text('Chat Us'),
            actions: [
              // first action button...
              IconButton(
                  onPressed: () {
                    // code ...
                  },
                  icon: const Icon(Icons.search)),

              // second Action button ....
              IconButton(
                onPressed: () {
                  //  button code ...
                },
                icon: Icon(Icons.line_axis_rounded),
              )
            ]),
        body: StreamBuilder(builder: (context, snapshot) {
          stream:
          APIS.firebase.collection("users").snapshots();

          if (snapshot.hasData) {
            final data = snapshot.data;

            print('Data /////////////////////////////////////////////// : $data');
          }

          return ListView.builder(
              itemCount: 16,
              padding: EdgeInsets.only(top: 3),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatUserCard();
              });
        }),

        // FloatingActionButton...
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 30),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add_comment_rounded),
            )));
  }
}
