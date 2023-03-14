import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/favourites/favourites_cubit.dart';
import 'package:horizon_comfort/cubits/home/home_cubit.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:horizon_comfort/screens/loading_screen.dart';
import 'package:horizon_comfort/screens/shoe_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/widgets/custom_arrivals_container.dart';
import 'package:horizon_comfort/widgets/custom_listview_builder.dart';

class BuildHome extends StatefulWidget {
  const BuildHome({Key? key, required this.shoes}) : super(key: key);

  final List<ShoeModel> shoes;

  @override
  State<BuildHome> createState() => _BuildHomeState();
}

class _BuildHomeState extends State<BuildHome> {
  @override
  void initState() {
    super.initState();

    final favouritesCubit = BlocProvider.of<FavouritesCubit>(context);
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    favouritesCubit.loadData();
    homeCubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomArrivalsContainer(),
                const SizedBox(height: 14),
                const Text(
                  "New Arrivals",
                  style: kTypewriterTitleBoldTextStyle,
                ),
                Expanded(
                  child: CustomListViewBuilder(
                    widget: widget,
                    shoesArrivals: state.shoesArrivals,
                    shoesPopular: state.shoesPopular,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Most Popular",
                    style: kTypewriterTitleBoldTextStyle,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: CustomMasonryGridViewBuilder(
                    widget: widget,
                    shoesArrivals: state.shoesArrivals,
                    shoesPopular: state.shoesPopular,
                  ),
                ),
              ],
            ),
          );
        } else if (state is HomeLoading) {
          return const BuildLoading();
        } else if (state is HomeError) {
          return Text(
            state.message,
            style: kTypewriterTextStyle,
          );
        }

        return const SizedBox();
      },
    );
  }
}

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
