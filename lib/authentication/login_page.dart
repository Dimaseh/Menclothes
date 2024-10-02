import 'package:flutter/material.dart';
import 'package:tugasdua/presentation/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isLoginSuccess = true;

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _logoWidget(),
                _usernamefield(),
                _passwordfield(),
                _loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Image.asset(
        'assets/images/logo.jpg',
        height: 300,
        width: 300,
      ),
    );
  }

  Widget _usernamefield() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(16.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                  color: (isLoginSuccess) ? Colors.blue : Colors.red)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }

  Widget _passwordfield() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true, // Menyembunyikan input password
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(16.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                  color: (isLoginSuccess) ? Colors.blue : Colors.red)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        onPressed: () {
          String text = "";
          if (password == "123") {
            setState(() {
              text = "Login sukses";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomePage(username: username);
            }));
          } else {
            setState(() {
              text = "Login gagal";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}
