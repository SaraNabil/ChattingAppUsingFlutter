import 'package:chat_app/screans/conversation_page.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ListItem extends StatelessWidget {
  final String id;
  final String userName;
  final String image;
  const ListItem({
    Key key,
    this.userName,
    this.image,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConversationPage(),
          settings: RouteSettings(
            arguments: id,
          ),
        ),
      ),
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 5.0,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: kPrimaryColor,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(image),
                      radius: 28,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    userName,
                    style: TextStyle(fontSize: 20.0, color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            Divider(
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
