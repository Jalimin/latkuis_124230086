import 'package:flutter/material.dart';
import 'package:olah_data/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  bool isLoginSuccess = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Login Page")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [FlutterLogo(size: 150,),_usernameField(), _passwordField(), _loginButton(context)],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        // enabled: true,
        controller: usernameC,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          hintText: "Username. . .",
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          fillColor: Colors.cyan,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        controller: passwordC,
         style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          hintText: "Password. . .",
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          fillColor: Colors.cyan,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20, 
        vertical: 10
      ),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          print("LOGIN");
          _login();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.cyan,
        ),
        child: Text("LOGIN", 
        style: TextStyle(
          fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  void _login(){
    String text = "", username, password;
      username = usernameC.text.trim();
      password = passwordC.text.trim();
      // print("Username : $username");
      // print("Password : $password");
      if(username == "Erizal" && password == "Erizal86"){
        //login berhasil
        setState(() {
          text = "Login Berhasil!";
          isLoginSuccess = true;
        });
        Navigator.pushReplacement(
          context,
         MaterialPageRoute(builder: (context){
          return HomePage(username: username,);
        }));
      }else{
        // login gagal
        setState(() {
          text = "Login Gagal";
          isLoginSuccess = false;
        });
      }

      SnackBar snackBar = SnackBar(
        backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,
        content: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        )
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
