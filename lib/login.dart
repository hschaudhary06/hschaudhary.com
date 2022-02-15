import 'package:flutter/material.dart';
import 'package:drower/routes/MyRoutes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool change = false;
  final _form_key = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();

  String _username = "";
  String _password = "";
  String error = "";

  void _setText() {
    setState(() {
      _username = username.text;
      _password = password.text;
    });
  }

  moveToHome(BuildContext context) async {
    _setText();
    if (_form_key.currentState!.validate()) {
      if (_username == "haidar" && _password == "haidarali") {
        error = "Log in successfull";
        setState(() {
          change = true;
        });
        await Future.delayed(Duration(seconds: 1));
        await Navigator.pushNamed(context, MyRoutes.home);
        setState(() {
          change = false;
        });
      }
      else{
        error = "Username Or Password is wrong";
      }
    }
  }

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
              "Welcome, $name",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              error,
              style: TextStyle(
                color: change?Colors.green:Colors.red,
                fontSize: 15,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 34.0),
              child: Form(
                key: _form_key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username must be not empty";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
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
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password must be not empty";
                        } else if (value.length < 6) {
                          return "Password must be 6 Charector";
                        }
                        return null;
                      },
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
                    Material(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(70),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: change ? 70 : 170,
                            height: 50,
                            alignment: Alignment.center,
                            child: change
                                ? Image.asset(
                                    "assets/images/loder1.gif",
                                    height: 30,
                                  )
                                : Text(
                                    "Log In",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
