import 'registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'package:flash_chat_2/components/rounded_button.dart';
import 'package:flash_chat_2/constants.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation =
        ColorTween(begin: Colors.white, end: Colors.blueGrey).animate(controller);
    controller.reverse(from: 1.0);
    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: const ['Flash Chat'],
                  textStyle: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(color: lightBlue, text: 'Log In', onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
              // print(Text('a'),);
              //Go to login screen.
            },),
            RoundedButton(color: darkBlue, text: 'Register', onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
              //Go to registration screen.
            },),
          ],
        ),
      ),
    );
  }
}
