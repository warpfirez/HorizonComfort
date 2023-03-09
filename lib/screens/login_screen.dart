import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/blocs/auth/auth_bloc.dart';
import 'package:horizon_comfort/cubits/login/login_cubit.dart';
import 'package:horizon_comfort/screens/menu_screen.dart';
import 'package:horizon_comfort/screens/register_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/widgets/custom_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = 'LoginScreen';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.authenticated
            ? const MenuScreen()
            : const LoginScreen();
      },
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            Navigator.of(context).pushReplacementNamed(
              MenuScreen.routeName,
            );
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Container(
              color: const Color(0xFFF5F6EF),
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
                          child: TextFormField(
                            decoration: kTextFieldDecoration,
                            onChanged: (value) {
                              context.read<LoginCubit>().emailChanged(value);
                              print(state.email);
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
                              context.read<LoginCubit>().passwordChanged(value);
                              print(state.password);
                            },
                          ),
                        ),
                        CustomElevatedButton(
                          onPressed: () {
                            /// hide keyboard
                            FocusScope.of(context).unfocus();

                            context.read<LoginCubit>().loginWithCredentials();

                            print(BlocProvider.of<AuthBloc>(context)
                                .state
                                .status);
                          },
                          text: 'Login',
                        )
                      ],
                    ),
                    GestureDetector(
                      child: const Text("First time? Register here"),
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          RegisterScreen.routeName,
                          ModalRoute.withName(LoginScreen.routeName),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
