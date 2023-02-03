import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../widgets/custom_elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = 'RegisterScreen';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const RegisterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/NightCityBackground.jpg'))),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Horizon",
                        style: kHorizonTextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Comfort",
                        style: kHorizonTextStyleBold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 8.0, right: 8.0),
                    child: TextField(
                      decoration: kTextFieldDecoration,
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 8.0, right: 8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Enter your password",
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: 'Register',
                  )
                ],
              ),
              GestureDetector(
                child: const Text("Already have an account? Login here"),
                onTap: () {
                  Navigator.pushNamed(context, 'LoginScreen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
