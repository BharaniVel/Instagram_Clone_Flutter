import 'package:flutter/material.dart';
import 'package:instagram_clone/auth/auth_options.dart';
import 'package:instagram_clone/responsivelayout/mobile_view.dart';
import 'package:instagram_clone/responsivelayout/mobileview/home_screen.dart';
import 'package:instagram_clone/responsivelayout/signup_mobile.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginViewMobile extends StatefulWidget {
  const LoginViewMobile({Key? key}) : super(key: key);

  @override
  State<LoginViewMobile> createState() => _LoginViewMobileState();
}

class _LoginViewMobileState extends State<LoginViewMobile> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();
  bool _isloading = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void loginuser() async {
    setState(() {
      _isloading = true;
    });
    String res = await Authmethods()
        .loginuser(email: _email.text, password: _password.text);
    if (res == 'Success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const mobileview(),
      ));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isloading = false;
    });
  }

  void navigatetosignup() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const Signupmobile(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/instagram_icon.png',
              width: 300,
              height: 200,
              colorBlendMode: BlendMode.difference,
            ),
            SizedBox(
              height: 50,
              width: 400,
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                style:
                    const TextStyle(color: Color.fromRGBO(107, 107, 107, 0.5)),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(29, 29, 29, 0.694),
                  border: InputBorder.none,
                  hintText: "Phone number, Username or Email address",
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 400,
              child: TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
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
            Container(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  child: const Text(
                    'Forgotten Password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () => launchUrlString(
                      'https://www.instagram.com/accounts/password/reset/'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 400,
              child: TextButton(
                onPressed: loginuser,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                child: _isloading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      )
                    : const Text('Log In'),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
                '----------------------------OR----------------------------'),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/facebook_img.png',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Login with Facebook',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                InkWell(
                  onTap: navigatetosignup,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
