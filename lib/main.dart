import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/responsivelayout/login_mobile.dart';
import 'package:instagram_clone/responsivelayout/mobile_screen_main_page.dart';
import 'package:instagram_clone/responsivelayout/mobile_view.dart';
import 'package:instagram_clone/responsivelayout/responsivelayout.dart';
import 'package:instagram_clone/responsivelayout/signup_mobile.dart';
import 'package:instagram_clone/responsivelayout/web_layout.dart';
import 'package:instagram_clone/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1)),
      // home: const ResponsiveLayout(
      //     mobileLayout: mobileview(), webLayout: Webview()),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                    mobileLayout: mobileview(), webLayout: Webview());
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Some Error has occured'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(0, 0, 0, 1),
                ),
              );
            }
            return const LoginViewMobile();
          }),
      routes: {
        loginmobile: (context) => const LoginViewMobile(),
        signupmobile: (context) => const Signupmobile(),
        homepagemobile: (context) => const Mobilelayouthomepage(),
      },
    );
  }
}
