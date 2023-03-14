import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/favourites/favourites_cubit.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:horizon_comfort/screens/home_screen.dart';
import 'package:horizon_comfort/screens/shoe_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
    required this.widget,
    required this.shoesArrivals,
    required this.shoesPopular,
  });

  final BuildHome widget;
  final List<ShoeModel> shoesArrivals;
  final List<ShoeModel> shoesPopular;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: shoesArrivals.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topEnd,
              children: [
                InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                        Image.network(shoesArrivals[index].galleryUrl!['0']!),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoeScreen(
                                  shoe: shoesArrivals[index],
                                )));
                  },
                ),
                BlocBuilder<FavouritesCubit, FavouritesState>(
                  builder: (context, state) {
                    if (state is FavouritesLoaded) {
                      return InkWell(
                        child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            switchInCurve: Curves.easeIn,
                            switchOutCurve: Curves.easeOut,
                            child: state.user.favouritesIds
                                    .contains(shoesArrivals[index].id)
                                ? const Icon(
                                    Icons.favorite_outlined,
                                    color: kPastelRed,
                                    size: 30,
                                  )
                                : Icon(Icons.favorite_outline_outlined,
                                    color: Colors.black87,
                                    size: 30,
                                    key: ValueKey(
                                        state.user.favouritesIds.length))),
                        onTap: () {
                          final favouritesCubit =
                              BlocProvider.of<FavouritesCubit>(context);
                          favouritesCubit
                              .favouritesChanged(shoesArrivals[index].id);
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          );
        });
  }
}
