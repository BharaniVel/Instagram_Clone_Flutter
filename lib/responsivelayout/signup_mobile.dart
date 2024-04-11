import 'package:flutter/material.dart';
import 'package:instagram_clone/auth/auth_options.dart';
import 'package:instagram_clone/responsivelayout/mobileview/home_screen.dart';
import 'package:instagram_clone/routes/routes.dart';
import 'package:instagram_clone/utils/utils.dart';

class Signupmobile extends StatefulWidget {
  const Signupmobile({super.key});

  @override
  State<Signupmobile> createState() => _SignupmobileState();
}

class _SignupmobileState extends State<Signupmobile> {
  late final TextEditingController _emailcontroller = TextEditingController();
  late final TextEditingController _passwordcontroller =
      TextEditingController();
  late final TextEditingController _usernamecontroller =
      TextEditingController();
  bool _isloading = false;
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    super.dispose();
  }

  void signupuser() async {
    setState(() {
      _isloading = true;
    });
    String res = await Authmethods().signUpUser(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
        username: _usernamecontroller.text);
    setState(() {
      _isloading = false;
    });
    if (res != 'Success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Mobilehomescreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, loginmobile);
          },
          icon: Image.asset(
            'assets/images/back_icon_white.png',
            height: 20,
            width: 20,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const Text(
            'Create Account',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 50,
            width: 400,
            child: Text(
              'Choose username for your new account, You can always change it later',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 380,
            child: TextField(
              controller: _emailcontroller,
              keyboardType: TextInputType.name,
              enableSuggestions: false,
              autocorrect: false,
              style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(29, 29, 29, 0.694),
                  border: InputBorder.none,
                  hintText: "Email Address",
                  hintStyle: TextStyle(
                    fontSize: 16,
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 380,
            child: TextField(
              controller: _passwordcontroller,
              keyboardType: TextInputType.name,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: true,
              style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(29, 29, 29, 0.694),
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 380,
            child: TextField(
              controller: _usernamecontroller,
              keyboardType: TextInputType.name,
              enableSuggestions: false,
              autocorrect: false,
              style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(29, 29, 29, 0.694),
                border: InputBorder.none,
                hintText: "Username",
                hintStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 380,
            child: TextButton(
              onPressed: signupuser,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 206, 206, 217)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
              child: _isloading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    )
                  : const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.black),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
