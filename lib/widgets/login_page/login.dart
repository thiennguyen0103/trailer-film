import 'package:trailerfilm_app/theme/theme.dart' as theme;
import 'package:flutter/material.dart';
import 'package:trailerfilm_app/widgets/login_page/signin_screen.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: theme.Colors.kPrimaryColor,
        scaffoldBackgroundColor: theme.Colors.kBackgroundColor,
        textTheme: TextTheme(
          display1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          button: TextStyle(color: theme.Colors.kPrimaryColor),
          headline:
              TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/perosn.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "SOLARS FILM\n",
                        style: Theme.of(context).textTheme.display1,
                      ),
                      TextSpan(
                        text: "WHERE YOU CAN RELAX YOUR MIND!",
                        style: Theme.of(context).textTheme.headline,
                      )
                    ],
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignInScreen();
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 25),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: theme.Colors.kPrimaryColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "GET STARTED",
                            style: Theme.of(context).textTheme.button.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}