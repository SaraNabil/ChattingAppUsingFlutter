import 'dart:io';

import 'package:chat_app/components/rounded_button.dart';
import 'package:chat_app/components/rounded_input_field.dart';
import 'package:chat_app/components/rounded_password_field.dart';
import 'package:chat_app/screans/chats_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File _image;
  String _url;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _formkey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.white,
        height: size.height,
        width: double.infinity,
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    backgroundImage: _image == null ? null : FileImage(_image),
                    radius: 80,
                  ),
                  GestureDetector(
                    onTap: pickImage,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RoundedInputField(
                hintText: 'Name',
                icon: Icons.person,
                textEditingController: _nameController,
                validatorText: 'Please Fill name field',
              ),
              RoundedInputField(
                hintText: 'Email',
                icon: Icons.mail,
                textEditingController: _emailController,
                validatorText: 'Please Fill email field',
              ),
              RoundedPasswordField(
                textEditingController: _passController,
                validatorText: 'Please Fill password field',
              ),
              RoundedButton(
                text: 'Sign up',
                press: () async {
                  //todo sign up code from firebase
                  if (_formkey.currentState.validate()) {
                    var result = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passController.text.trim());
                    if (result != null) {
                      uploadImage(
                          context,
                          result.user.uid,
                          _nameController.text.trim(),
                          _emailController.text.trim());
                    } else {
                      print('please try later');
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addUser(String id, String name, String email, String url) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(id)
        .set({
          'id': id,
          'name': name,
          'email': email,
          'imageUrl': url,
        })
        .then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ChatsPage()),
            ))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void pickImage() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    var image = File(pickedImage.path);
    setState(() {
      _image = image;
    });
  }

  void uploadImage(context, String id, String name, String email) async {
    try {
      FirebaseStorage storage =
          FirebaseStorage.instanceFor(bucket: 'gs://chatapp-7b513.appspot.com');
      Reference ref = storage.ref().child('usersImgs').child(_image.path);

      await ref.putFile(_image);

      UploadTask task = ref.putFile(_image);
      task.snapshotEvents.listen((TaskSnapshot snapshot) {
        print('Task state: ${snapshot.state}');
        print(
            'Progress: ${(snapshot.totalBytes / snapshot.bytesTransferred) * 100} %');
        ref.getDownloadURL().then((value) {
          addUser(id, name, email, value);
          print('url : $value');
        });
      }, onError: (e) {
        print(task.snapshot);

        if (e.code == 'permission-denied') {
          print('User does not have permission to upload to this reference.');
        }
      });
    } catch (ex) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(ex.message),
      ));
    }
  }
}
