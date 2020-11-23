import 'package:chat_app/components/list_item.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/screans/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  ChatsPage({Key key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  Stream users = FirebaseFirestore.instance
      .collection('users')
      .orderBy('name')
      .snapshots();

  String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        backgroundColor: kPrimaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/chat_bubbles.jpg"),
                      fit: BoxFit.cover)),
              child: null,
            ),
            Divider(
              color: kPrimaryColor,
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18.0,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Divider(
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: users,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView(
            //todo if userId = currentUserId remove user from the chats list
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              userId = document.data()['id'];
              print('user Id -----> $userId');
              return ListItem(
                id: userId,
                userName: document.data()['name'],
                image: document.data()['imageUrl'],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
