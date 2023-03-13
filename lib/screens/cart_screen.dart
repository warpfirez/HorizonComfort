import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/screens/shoe_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/cubits/menu/menu_cubit.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:horizon_comfort/widgets/custom_list_tile.dart';

class BuildCart extends StatelessWidget {
  const BuildCart(
      {required this.shoesInCart, required this.totalPrice, Key? key})
      : super(key: key);

  final List<ShoeModel> shoesInCart;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
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
                  child: InkWell(
                    child: CustomListTile(shoesInCart[index]),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoeScreen(
                                    shoe: shoesInCart[index],
                                  )));
                    },
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
                      style:
                          kTypewriterTitleBoldTextStyle.copyWith(fontSize: 22),
                    ),
                    Text(
                      'Proceed to checkout',
                      style:
                          kTypewriterTitleBoldTextStyle.copyWith(fontSize: 22),
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
}
