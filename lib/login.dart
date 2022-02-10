import 'package:flutter/material.dart';
import 'package:drower/routes/MyRoutes.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60.0,
            ),
            Image.asset(
              "assets/images/login.png",
              height: 200,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome, Log In",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 34.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                      contentPadding: EdgeInsets.all(20.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                      contentPadding: EdgeInsets.all(20.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  ElevatedButton(
                    child: Text("Log in"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple, // background (button) color
                      onPrimary: Colors.white, // foreground (text) color
                      minimumSize: Size(170, 50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.home);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
