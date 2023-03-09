import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/screens/menu_screen.dart';
import 'package:horizon_comfort/cubits/profile/profile_cubit.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/widgets/custom_elevated_button.dart';

class EditProfileDetailsScreen extends StatelessWidget {
  EditProfileDetailsScreen({Key? key}) : super(key: key);

  static const String routeName = 'ProfileDetailsScreen';
  final formKey = GlobalKey<FormState>();

  static Route route() {
    return MaterialPageRoute(
      builder: (context) {
        return EditProfileDetailsScreen();
      },
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: formKey,
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            MenuScreen.routeName,
                            ModalRoute.withName(
                                EditProfileDetailsScreen.routeName),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          child: Text(
                            "<",
                            style: kTypewriterTitleBoldTextStyle.copyWith(
                                fontSize: 36),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 70),
                  const SizedBox(
                    width: 350,
                    child: Text(
                      'Edit your profile details',
                      style: kTypewriterTitleBoldTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    color: kPastelPink,
                    elevation: 3,
                    child: SizedBox(
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 16.0, left: 8.0, right: 8.0),
                            child: TextFormField(
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: "Enter new email",
                              ),
                              onChanged: (value) {
                                context
                                    .read<ProfileCubit>()
                                    .emailChanged(value);
                                print(state.email);
                              },
                              validator: (value) {
                                if (state.email.isEmpty ||
                                    !state.email.contains('@')) {
                                  return 'Enter valid email';
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
                                hintText: "Enter new full name",
                              ),
                              onChanged: (value) {
                                context
                                    .read<ProfileCubit>()
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
                                hintText: "Enter new phone number",
                              ),
                              onChanged: (value) {
                                context
                                    .read<ProfileCubit>()
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: CustomElevatedButton(
                              onPressed: () {
                                ///hide keyboard
                                FocusScope.of(context).unfocus();

                                final isValidForm =
                                    formKey.currentState!.validate();
                                if (isValidForm) {
                                  try {
                                    context
                                        .read<ProfileCubit>()
                                        .editProfileDetails();

                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      MenuScreen.routeName,
                                      ModalRoute.withName(
                                          EditProfileDetailsScreen.routeName),
                                    );
                                  } catch (e) {
                                    print(e);
                                  }
                                }
                              },
                              text: 'Confirm Changes',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
