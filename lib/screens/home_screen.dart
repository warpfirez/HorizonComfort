import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/data/auth_repository.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';

import '../blocs/auth/auth_bloc.dart';
import '../widgets/custom_arrivals_container.dart';

Widget buildHome(BuildContext context, String homeData) {
  return Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomArrivalsContainer(),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ShoeModel.shoes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0,
                              color: Colors.black54,
                              spreadRadius: 1)
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 34,
                        backgroundColor: const Color(0xFFB28DFF),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(ShoeModel.shoes[index].pictureUrl),
                        ),
                      ),
                    ));
              }),
        ),
        const Divider(
          thickness: 3,
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            child: const Text("Print auth status"),
            onTap: () {
              print(BlocProvider.of<AuthBloc>(context).state.status);
            },
          ),
        ),
      ],
    ),
  );
}
