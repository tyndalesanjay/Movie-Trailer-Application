import 'package:flutter/material.dart';
import 'package:movie_app/interfaces/user_interface.dart';
// import 'package:movie_app/pages/homepage/homePage.dart';
import 'package:movie_app/pages/register/register_page.dart';
import 'package:movie_app/pages/register/register_utilities.dart';
import 'package:movie_app/services/user_services.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key, required this.title});
  final String title;

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final UserService api = UserService();
  final _registerKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // checkExistingLogin();
  }

  // void checkExistingLogin() async {
  //   SharedPreferences LocalStorage = await SharedPreferences.getInstance();
  //   var newuser = (LocalStorage.getBool('token') ?? true);
  //   print(newuser);

  //   if (newuser = false) {
  //     Navigator.pushReplacement(
  //         context,
  //         new MaterialPageRoute(
  //             builder: (context) => HomePage(
  //                   title: 'HomePage',
  //                 )));
  //   }
  // }

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
                  'Login to your Account',
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
              height: screenSize.height / 3,
              child: Form(
                key: _registerKey,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    CFormField(
                        controller: _email,
                        label: 'Email',
                        message: 'Enter Email'),
                    SizedBox(
                      height: 15,
                    ),
                    PFormField(
                      controller: _password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              side: BorderSide(color: Colors.redAccent),
                              padding: EdgeInsets.all(10),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterUser(title: 'Register User');
                              }));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () async {
                                if (_registerKey.currentState!.validate()) {
                                  // SharedPreferences LocalStorage = await SharedPreferences.getInstance();
                                  // print("Validated and Logged in");
                                  api.UserLogin(Users.withoutFirstName(
                                      email: _email.text,
                                      password: _password.text));
                                  // checkExistingLogin();
                                  // var storageToken = (LocalStorage.getString("token"));
                                } else {
                                  print("error");
                                }
                                ;
                              },
                              child: Text('Login')),
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
