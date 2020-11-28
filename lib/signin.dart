import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trailerfilm_app/forgotpassword.dart';
import 'package:trailerfilm_app/screens/home_screen.dart';
import 'package:trailerfilm_app/signup.dart';

class SignIn extends StatefulWidget {
  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  String _password;
  bool _obscureTextLogin = true;

  FocusNode myFocusNodeEmailLogin;
  FocusNode myFocusNodePasswordLogin;

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    final logo = Hero(
      tag: 'hero', 
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/image/uit-logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: this.myFocusNodeEmailLogin,
      controller: this.loginEmailController,
      decoration: InputDecoration(
        hintText: 'Enter your email...',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.email),
      ),
    );

    final password = TextFormField(
      focusNode: this.myFocusNodePasswordLogin,
      controller: this.loginPasswordController,
      obscureText: this._obscureTextLogin,
      decoration: InputDecoration(
        hintText: 'Enter your password...',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: this._obscureTextLogin ? Colors.blue : Colors.grey,
          ),
          onPressed: this._toggleLogin,
          ),
        ),
      );
    
    final loginButton = new RaisedButton(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: const Text('Sign In'),
      textColor: Colors.white,
      color: Theme.of(context).accentColor,
      elevation: 10.0,
      splashColor: Colors.blueGrey,
      onPressed: () {
        // Perform some action
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.blue),
      ),
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => ForgotPassword())
        );
      },
    );

    final registerLabel = FlatButton(
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => SignUp())
        );
      }, 
      child: Text("Sign Up",
        style: TextStyle(color: Colors.blue),
      ),
    );

    void showInSnackBar(String value) {
      FocusScope.of(context).requestFocus(new FocusNode());
      _scaffoldKey.currentState?.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"
          ),
        ),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 3),
      ));
    }
    
    return new Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 45.0),
            email,
            SizedBox(height: 10.0),
            password,
            Container(
              alignment: Alignment(1.0, 0.0),
              child: forgotLabel,
            ),
            SizedBox(height: 15.0),
            loginButton,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?"),
                registerLabel
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black54
                        ],
                        begin: const FractionalOffset(1.0, 1.0),
                        end: const FractionalOffset(0.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp
                      ),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text("Or",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                        fontFamily: "WorkSansMedium"
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black54
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp
                      ),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 40.0),
                  child: GestureDetector(
                    onTap: () => showInSnackBar("Facebook button pressed"),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: new Icon(
                        FontAwesomeIcons.facebookF,
                        color: Color(0xFF0084ff),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    onTap: () => showInSnackBar("Google button pressed"),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: new Icon(
                        FontAwesomeIcons.google,
                        color: Color(0xFF0084ff),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
