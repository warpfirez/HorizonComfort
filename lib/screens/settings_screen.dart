import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/data/auth_repository.dart';
import 'package:horizon_comfort/data/database_repository.dart';

import '../blocs/auth/auth_bloc.dart';
import '../data/models/user_model.dart';
import '../widgets/custom_arrivals_container.dart';

Widget buildSettings(BuildContext context, UserModel user) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(user.id!),
      Text(user.email!),
      GestureDetector(
        child: const Text("fetch shoe by id"),
        onTap: () {
          RepositoryProvider.of<DatabaseRepository>(context)
              .fetchShoeById('2dh0hO5XF7mF183Jmw2e');
        },
      ),
      GestureDetector(
        child: const Text("add user"),
        onTap: () {
          print(BlocProvider.of<AuthBloc>(context).state.status);
        },
      ),
      GestureDetector(
        child: const Text("Sign Out"),
        onTap: () {
          print(BlocProvider.of<AuthBloc>(context).state.status);
          final authCubit = BlocProvider.of<AuthBloc>(context);
          authCubit.add(SignOut());
          print(BlocProvider.of<AuthBloc>(context).state.status);
        },
      ),
    ],
  );
}
