import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../AppState.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String email;
  String pasword;
  bool _obsecure = true;
  DateTime timeSpan = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: appState.dark ? Color(0xFF06232c) : Colors.white,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * .55
              : 300,
          width: MediaQuery.of(context).size.width < 500
              ? MediaQuery.of(context).size.width * .8
              : MediaQuery.of(context).size.width * .60,
          decoration: BoxDecoration(
            color: appState.dark ? Color(0xFF0b313b) : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'Budget ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: 25),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Watch',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.lobster().fontFamily)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      //filled: true,
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintText: "Your email Address",
                      labelText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String keyed) {
                    setState(() {
                      email = keyed;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  obscureText: _obsecure,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock_open,
                        color: Colors.white,
                      ),
                      border: UnderlineInputBorder(),
                      hintText: "Password",
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obsecure = !_obsecure;
                            });
                          },
                          child: Icon(
                            _obsecure ? Icons.visibility : Icons.visibility_off,
                            color: _obsecure ? Colors.white : Colors.red,
                          ))),
                  onChanged: (String value) {
                    setState(() {
                      pasword = value;
                    });
                  },
                ),
              ),

              FlatButton(
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Budget Watch © ${timeSpan.year}",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                      // onPressed: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (_) => ForgotPass(
                      //                 tag: 'valhalla',
                      //               )));
                      // },
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            color: Colors.white60, fontWeight: FontWeight.w500),
                      )),
                      FlatButton(
                      // onPressed: () {
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (_) => CreateAccount()));
                      // },
                      child: Text(
                        "Create account",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
