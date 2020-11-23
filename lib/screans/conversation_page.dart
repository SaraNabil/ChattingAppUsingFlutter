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
                    children: <Widget>[
                      ListTile(
                        title: Text('Dabdoob'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("Sara, ana b7bk"),
                      ),
                      ListTile(
                        title: Text('حبيبتى'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:18 PM"),
                      ),
                      ListTile(
                        title: Text('Dabdoob'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("متشليش ههم حاجه ونبى"),
                      ),
                      ListTile(
                        title: Text('Dabdoob'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("Sara, ana b7bk"),
                      ),
                      ListTile(
                        title: Text('حبيبتى'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:18 PM"),
                      ),
                      ListTile(
                        title: Text('Dabdoob'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("متشليش ههم حاجه ونبى"),
                      ),
                      ListTile(
                        title: Text('Dabdoob'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("Sara, ana b7bk"),
                      ),
                      ListTile(
                        title: Text('حبيبتى'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:18 PM"),
                      ),
                      ListTile(
                        title: Text('Dabdoob'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("متشليش ههم حاجه ونبى"),
                      ),
                      ListTile(
                        title: Text('Dabdoob'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("Sara, ana b7bk"),
                      ),
                      ListTile(
                        title: Text('حبيبتى'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:18 PM"),
                      ),
                      ListTile(
                        title: Text('Dabdoob'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("متشليش ههم حاجه ونبى"),
                      ),
                      ListTile(
                        title: Text('Dabdoob'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("Sara, ana b7bk"),
                      ),
                      ListTile(
                        title: Text('حبيبتى'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("12:18 PM"),
                      ),
                      ListTile(
                        title: Text('Dabdoob'),
                        leading: Icon(Icons.av_timer),
                        subtitle: Text("متشليش ههم حاجه ونبى"),
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
                            Scaffold.of(context).removeCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Call Clicked"),
                            ));
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
