import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatUserCard extends StatefulWidget {
  @override
  State<ChatUserCard> createState() => ChatUserCardState();
}

class ChatUserCardState extends State<ChatUserCard> {
  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal : 2 , vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child:  InkWell(
        onTap: (){},
        child: const ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),

          title: Text('User' , style: TextStyle(fontSize: 21 , color: Colors.black),),
          subtitle: Text('Recent Message' , style: TextStyle(fontSize: 16) , maxLines: 1,),
          trailing: Text('12:00 PM' , style: TextStyle(color: Colors.black54),),

        ),

      ),

    );
  }
}
