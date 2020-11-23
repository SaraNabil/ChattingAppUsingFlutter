import 'package:chat_app/components/rounded_button.dart';
import 'package:chat_app/components/rounded_input_field.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  ConversationPage({
    Key key,
  }) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    //todo get chat data
                    reverse: true,
                    children: <Widget>[
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:18 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:19 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:20 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:21 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:22 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:23 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:24 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:25 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:26 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:27 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:28 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:29 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:30 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:31 PM"),
                      ),
                      ListTile(
                        title: Text('Message'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:32 PM"),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 300,
                    color: kPrimaryLightColor,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter a message',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: kPrimaryColor,
                      child: FlatButton(
                        onPressed: () {},
                        child: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            //todo send message
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
