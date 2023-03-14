import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/favourites/favourites_cubit.dart';
import 'package:horizon_comfort/cubits/home/home_cubit.dart';
import 'package:horizon_comfort/screens/loading_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/widgets/custom_arrivals_container.dart';
import 'package:horizon_comfort/widgets/custom_listview_builder.dart';
import 'package:horizon_comfort/widgets/custom_masonry_grid_view_builder.dart';

class BuildHome extends StatefulWidget {
  const BuildHome({Key? key}) : super(key: key);

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
