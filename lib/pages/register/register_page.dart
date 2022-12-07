import 'package:flutter/material.dart';
import 'package:movie_app/interfaces/user_interface.dart';
// import 'package:movie_app/pages/homepage/homePage.dart';
import 'package:movie_app/pages/login/login_page.dart';
import 'package:movie_app/pages/register/register_utilities.dart';

import '../../services/user_services.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key, required this.title});
  final String title;

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final UserService api = UserService();
  final _registerKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ListView(
          children: [
            Center(
              child: SizedBox(
                height: 40,
                child: Text(
                  'Register a New User',
                  style: TextStyle(color: Colors.red, fontSize: 34),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 0),
                    )
                  ]),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(15),
              height: screenSize.height / 1.5,
              child: Form(
                key: _registerKey,
                // autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CFormField(
                        controller: _firstName,
                        label: 'First Name',
                        message: 'Please enter First Name'),
                    CFormField(
                        controller: _lastName,
                        label: 'Last Name',
                        message: 'Please enter Last Name'),
                    CFormField(
                        controller: _email,
                        label: 'Email',
                        message: 'Enter Email'),
                    PFormField(
                      controller: _password,
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter a Password';
                        }
                        return null;
                      },
                    ),
                    PFormField(
                      controller: _confirmPassword,
                      validator: (value) {
                        final password = _password.text;
                        final confirmPassword = _confirmPassword.text;
                        if (password.isEmpty || confirmPassword.isEmpty) {
                          if (password != confirmPassword) {
                            return 'Passwords do not match';
                          }
                        }
                        return null;
                      },
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  side: BorderSide(color: Colors.redAccent),
                                  padding: EdgeInsets.all(10)),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginUser(title: 'Login User');
                                }));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              )),
                          SizedBox(
                            width: 30,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                if (_registerKey.currentState!.validate()) {
                                  api.RegisterUsers(Users.withoutID(
                                      firstName: _firstName.text,
                                      lastName: _lastName.text,
                                      email: _email.text,
                                      password: _password.text));
                                } else {
                                  print("error");
                                }
                              },
                              child: Text('Register')),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
