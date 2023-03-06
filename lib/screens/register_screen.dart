import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/data/auth_repository.dart';
import 'package:horizon_comfort/screens/menu_screen.dart';
import 'package:horizon_comfort/screens/login_screen.dart';

import '../cubits/login/login_cubit.dart';
import '../cubits/register/register_cubit.dart';
import '../data/database_repository.dart';
import '../utilities/constants.dart';
import '../widgets/custom_elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = 'RegisterScreen';
  final formKey = GlobalKey<FormState>();

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => RegisterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: formKey,
            child: Container(
              color: const Color(0xFFF5F6EF),
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
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
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 16.0, left: 8.0, right: 8.0),
                            child: TextFormField(
                              decoration: kTextFieldDecoration,
                              onChanged: (value) {
                                context
                                    .read<RegisterCubit>()
                                    .emailChanged(value);
                                print(state.email);
                              },
                              validator: (value) {
                                if (state.email.isEmpty ||
                                    !state.email.contains('@')) {
                                  return 'Enter a valid email';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 16.0, left: 8.0, right: 8.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: "Enter your password",
                              ),
                              onChanged: (value) {
                                context
                                    .read<RegisterCubit>()
                                    .passwordChanged(value);
                                print(state.password);
                              },
                              validator: (value) {
                                if (state.password.length < 6 ||
                                    state.password.isEmpty) {
                                  return 'Password is too short';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 16.0, left: 8.0, right: 8.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: "Confirm your password",
                              ),
                              onChanged: (value) {
                                context
                                    .read<RegisterCubit>()
                                    .passwordConfirmChanged(value);
                                print(state.passwordConfirm);
                              },
                              validator: (value) {
                                if (state.passwordConfirm != state.password) {
                                  return "Passwords don't match";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 16.0, left: 8.0, right: 8.0),
                            child: TextFormField(
                              obscureText: false,
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: "Enter your full name",
                              ),
                              onChanged: (value) {
                                context
                                    .read<RegisterCubit>()
                                    .fullNameChanged(value);
                                print(state.fullName);
                              },
                              validator: (value) {
                                if (state.fullName.length < 2 ||
                                    state.fullName.isEmpty) {
                                  return 'Enter valid full name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 16.0, left: 8.0, right: 8.0),
                            child: TextFormField(
                              obscureText: false,
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: "Enter your phone number",
                              ),
                              onChanged: (value) {
                                context
                                    .read<RegisterCubit>()
                                    .phoneChanged(value);
                                print(state.phone);
                              },
                              validator: (value) {
                                if (state.phone.length < 9) {
                                  return 'Phone number too short';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          CustomElevatedButton(
                            onPressed: () async {
                              final isValidForm =
                                  formKey.currentState!.validate();
                              if (isValidForm) {
                                try {
                                  await context
                                      .read<RegisterCubit>()
                                      .registerWithCredentials();
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            text: 'Register',
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 15),
                        child: GestureDetector(
                          child:
                              const Text("Already have an account? Login here"),
                          onTap: () {
                            // Navigator.pushNamed(context, LoginScreen.routeName);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginScreen.routeName,
                              ModalRoute.withName(RegisterScreen.routeName),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
