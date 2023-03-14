import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:horizon_comfort/cubits/favourites/favourites_cubit.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:horizon_comfort/screens/home_screen.dart';
import 'package:horizon_comfort/screens/shoe_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';

class CustomMasonryGridViewBuilder extends StatelessWidget {
  const CustomMasonryGridViewBuilder({
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
    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: shoesPopular.length,
      itemBuilder: (context, index) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topEnd,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoeScreen(
                              shoe: shoesPopular[index],
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(shoesPopular[index].pictureUrlCandid!),
                ),
              ),
            ),
            BlocBuilder<FavouritesCubit, FavouritesState>(
              builder: (context, state) {
                if (state is FavouritesLoaded) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          switchInCurve: Curves.easeIn,
                          switchOutCurve: Curves.easeOut,
                          child: state.user.favouritesIds
                                  .contains(shoesPopular[index].id)
                              ? const Icon(
                                  Icons.favorite_outlined,
                                  color: kPastelRed,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.favorite_outline_outlined,
                                  color: Colors.black87,
                                  size: 30,
                                )),
                    ),
                    onTap: () {
                      final favouritesCubit =
                          BlocProvider.of<FavouritesCubit>(context);
                      favouritesCubit.favouritesChanged(shoesPopular[index].id);
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        );
      },
    );
  }
}
