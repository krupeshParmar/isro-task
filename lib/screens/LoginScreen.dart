import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:isro/widgets/RoundedButton.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../constants.dart';
import 'Home.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String title = 'ISRO';
  FirebaseAuth auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email = '', emailError = '';
  late String password = '', passwordError = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoadingOverlay(
        isLoading: showSpinner,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24.0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                      errorText: emailError.isEmpty ? null : emailError),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                      errorText: passwordError.isEmpty ? null : passwordError),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  colour: Colors.lightBlueAccent,
                  onPressed: () => loginCallback(context),
                ),
                SizedBox(
                  height: 32.0,
                ),
                RoundedButton(
                  title: 'Register here',
                  colour: Colors.redAccent,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validate() {
    bool val = true;
    if (email.isEmpty) {
      setState(() {
        emailError = 'Please enter your email!';
      });
      val = false;
    } else
      setState(() {
        emailError = '';
      });
    if (password.isEmpty) {
      setState(() {
        passwordError = 'Please enter your password!';
      });
      val = false;
    } else if (password.length < 6) {
      setState(() {
        passwordError = 'Password is too short!';
      });
      val = false;
    } else
      setState(() {
        passwordError = '';
      });
    return val;
  }

  void loginCallback(BuildContext context) async {
    if (validate()) {
      setState(() {
        showSpinner = true;
      });
      print('here');
      try {
        final user = (await auth.signInWithEmailAndPassword(
                email: email, password: password))
            .user;
        setState(() {
          showSpinner = false;
        });
        if (user != null)
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: title)));
      } catch (e) {
        setState(() {
          showSpinner = false;
        });
        var msg = e as FirebaseAuthException;
        print(e);
        if (msg.message != null)
          Fluttertoast.showToast(
              msg: msg.message.toString(),
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_LONG);
      }
      setState(() {
        showSpinner = false;
      });
    }
  }
}
