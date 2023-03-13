import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/cart/cart_cubit.dart';
import 'package:horizon_comfort/screens/loading_screen.dart';
import 'package:horizon_comfort/screens/shoe_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/widgets/custom_list_tile.dart';

class BuildCart extends StatefulWidget {
  const BuildCart({Key? key}) : super(key: key);

  @override
  State<BuildCart> createState() => _BuildCartState();
}

class _BuildCartState extends State<BuildCart> {
  @override
  void initState() {
    super.initState();
    final cartCubit = BlocProvider.of<CartCubit>(context);
    cartCubit.loadData();
  }

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
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoaded) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.shoesInCart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          BlocProvider.of<CartCubit>(context)
                              .removeCartItem(state.shoesInCart[index].id);
                        },
                        child: InkWell(
                          child: CustomListTile(state.shoesInCart[index]),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShoeScreen(
                                          shoe: state.shoesInCart[index],
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
                );
              } else if (state is CartLoading) {
                return const BuildLoading();
              }
              return const SizedBox();
            },
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        if (state is CartLoaded) {
                          return Row(
                            children: [
                              Text(
                                'Total price: ',
                                style: kTypewriterTitleBoldTextStyle.copyWith(
                                    fontSize: 22),
                              ),
                              Text(
                                '${state.totalPrice.toString()}€',
                                style: kTypewriterTitleBoldTextStyle.copyWith(
                                    fontSize: 22),
                              ),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
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
