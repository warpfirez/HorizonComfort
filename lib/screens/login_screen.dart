import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(20),
                      minimumSize:
                          MaterialStateProperty.all(const Size(250, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black87),
                      overlayColor: MaterialStateProperty.all(Colors.teal[900]),
                      shadowColor: MaterialStateProperty.all(Colors.brown[900]),
                    ),
                    child: const Text('Sign In'),
                    onPressed: () {},
                  )
                ],
              ),
              const Text("First time? Register here"),
            ],
          ),
        ),
      ),
    );
  }
}
