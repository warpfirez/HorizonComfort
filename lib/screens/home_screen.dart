import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/favourites/favourites_cubit.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:horizon_comfort/screens/shoe_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/widgets/custom_arrivals_container.dart';

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
    favouritesCubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.shoes.length,
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
                            child: Image.network(
                                widget.shoes[index].galleryUrl!['0']!),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShoeScreen(
                                          shoe: widget.shoes[index],
                                        )));
                          },
                        ),
                        BlocBuilder<FavouritesCubit, FavouritesState>(
                          builder: (context, state) {
                            if (state is FavouritesChanged) {
                              return InkWell(
                                child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    switchInCurve: Curves.easeIn,
                                    switchOutCurve: Curves.easeOut,
                                    child: state.user.favouritesIds
                                            .contains(widget.shoes[index].id)
                                        ? const Icon(
                                            Icons.favorite_outlined,
                                            color: kPastelRed,
                                            size: 30,
                                          )
                                        : Icon(Icons.favorite_outline_outlined,
                                            color: Colors.black87,
                                            size: 30,
                                            key: ValueKey(state
                                                .user.favouritesIds.length))),
                                onTap: () {
                                  final favouritesCubit =
                                      BlocProvider.of<FavouritesCubit>(context);
                                  favouritesCubit.favouritesChanged(
                                      widget.shoes[index].id);
                                },
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      ],
                    ),
                  );
                }),
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
            child: MasonryGridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: widget.shoes.length,
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
                                      shoe: widget.shoes[index],
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              widget.shoes[index].pictureUrlCandid!),
                        ),
                      ),
                    ),
                    BlocBuilder<FavouritesCubit, FavouritesState>(
                      builder: (context, state) {
                        if (state is FavouritesChanged) {
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  switchInCurve: Curves.easeIn,
                                  switchOutCurve: Curves.easeOut,
                                  child: state.user.favouritesIds
                                          .contains(widget.shoes[index].id)
                                      ? const Icon(
                                          Icons.favorite_outlined,
                                          color: kPastelRed,
                                          size: 30,
                                        )
                                      : Icon(Icons.favorite_outline_outlined,
                                          color: Colors.black87,
                                          size: 30,
                                          key: ValueKey(state
                                              .user.favouritesIds.length))),
                            ),
                            onTap: () {
                              final favouritesCubit =
                                  BlocProvider.of<FavouritesCubit>(context);
                              favouritesCubit
                                  .favouritesChanged(widget.shoes[index].id);
                            },
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
