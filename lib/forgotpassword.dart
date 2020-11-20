
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  @override
  
  Widget build(BuildContext context) {
    // TODO: implement build
    final logo = Hero(
      tag: 'hero', 
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/image/lock.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email...',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.email),
      ),
    );

    final sendEmailButton = new RaisedButton(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: const Text('Send Mail'),
      textColor: Colors.white,
      color: Theme.of(context).accentColor,
      elevation: 10.0,
      splashColor: Colors.blueGrey,
      onPressed: () {
        // Perform some action
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: new Text("Forgot Password")
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 45.0),
            email,
            SizedBox(height: 10.0),
            sendEmailButton,
            SizedBox(height: 10.0),
            Text("Enter your email and we will send you a link to reset your password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0
              ),
            )
          ]
        ),
      ),
    );
  }
}