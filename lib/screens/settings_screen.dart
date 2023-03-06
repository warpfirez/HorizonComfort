import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/data/auth_repository.dart';
import 'package:horizon_comfort/data/database_repository.dart';
import 'package:horizon_comfort/utilities/constants.dart';

import '../blocs/auth/auth_bloc.dart';
import '../data/models/user_model.dart';
import '../widgets/custom_arrivals_container.dart';

Widget buildSettings(BuildContext context, UserModel user) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
              padding: const EdgeInsets.all(4.0),
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('images/ShoesBackground.jpg')),
                color: kPastelYellow,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: const Center()),
          const Positioned(
              bottom: -35,
              child: SizedBox(
                width: 90,
                height: 90,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80'),
                ),
              )),
        ],
      ),
      const SizedBox(
        height: 45,
      ),
      Text(
        user.fullName!,
        style: kTypewriterTitleBoldTextStyle.copyWith(fontSize: 24),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Card(
          elevation: 3,
          color: kPastelPink,
          child: SizedBox(
            width: 350,
            height: 250,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.mail_outline),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.email!,
                        style: kTypewriterTextStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time_outlined),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Mon - Sat: 8am - 7pm',
                        style: kTypewriterTextStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.phoneNumber!,
                        style: kTypewriterTextStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            size: 30,
                            color: Colors.green[800],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Edit Profile Details',
                            style: kTypewriterTitleBoldTextStyle.copyWith(
                                fontSize: 20, color: Colors.green[800]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        final authCubit = BlocProvider.of<AuthBloc>(context);
                        authCubit.add(SignOut());
                        print(BlocProvider.of<AuthBloc>(context).state.status);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout_outlined,
                            size: 30,
                            color: Colors.green[800],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign out',
                            style: kTypewriterTitleBoldTextStyle.copyWith(
                              fontSize: 20,
                              color: Colors.green[800],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Card(
          elevation: 3,
          color: kPastelGreen,
          child: SizedBox(
            width: 350,
            height: 70,
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Payout account',
                        style: kTypewriterTitleBoldTextStyle,
                      ),
                      InkWell(
                        child: const Icon(Icons.info_outline),
                        onTap: () {},
                      )
                    ],
                  ),
                  Text(
                    'Provide your data and link your bank account to receive payments for your items',
                    style: kTypewriterTextStyle.copyWith(fontSize: 13),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

// GestureDetector(
// child: const Text("fetch shoe by id"),
// onTap: () {
// RepositoryProvider.of<DatabaseRepository>(context)
//     .fetchShoeById('2dh0hO5XF7mF183Jmw2e');
// },
// ),
// GestureDetector(
// child: const Text("add user"),
// onTap: () {
// print(BlocProvider.of<AuthBloc>(context).state.status);
// },
// ),
// GestureDetector(
// child: const Text("Sign Out"),
// onTap: () {
// print(BlocProvider.of<AuthBloc>(context).state.status);
// final authCubit = BlocProvider.of<AuthBloc>(context);
// authCubit.add(SignOut());
// print(BlocProvider.of<AuthBloc>(context).state.status);
// },
// ),
