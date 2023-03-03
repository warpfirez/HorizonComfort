import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/utilities/constants.dart';

import '../cubits/menu/menu_cubit.dart';
import '../data/models/shoe_model.dart';
import '../data/models/user_model.dart';
import '../widgets/custom_arrivals_container.dart';

Widget buildCart(BuildContext context, UserModel user,
    List<ShoeModel> shoesInCart, int totalPrice) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          color: kPastelGreen,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cart items',
                style: kTypewriterTitleBoldTextStyle.copyWith(fontSize: 22),
              ),
              Text(
                'Item price',
                style: kTypewriterTitleBoldTextStyle.copyWith(fontSize: 22),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: shoesInCart.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: const Key('key'),
                onDismissed: (direction) {
                  BlocProvider.of<MenuCubit>(context)
                      .removeCartItem(shoesInCart[index].id);
                },
                child: Container(
                  height: 100,
                  color: kBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(width: 2)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    shoesInCart[index].pictureUrl!),
                                //child: Text(shoes[index].toString()),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                '${shoesInCart[index].name}',
                                style:
                                    kTypewriterTextStyle.copyWith(fontSize: 16),
                                maxLines: 3,
                              ),
                            )
                          ],
                        ),
                        Text(
                          '${shoesInCart[index].price.toString()} €',
                          style: kTypewriterTextStyle,
                        ),
                      ],
                    ),
                  ),
                  // Center(child: Text('Entry ${shoesInCart[index].id}')),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              thickness: 2,
            ),
          ),
        ),
        Container(
          height: 80,
          color: kPastelPink,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total price: $totalPrice€',
                    style: kTypewriterTitleBoldTextStyle.copyWith(fontSize: 22),
                  ),
                  Text(
                    'Proceed to checkout',
                    style: kTypewriterTitleBoldTextStyle.copyWith(fontSize: 22),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
