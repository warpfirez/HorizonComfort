import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/favourites/favourites_cubit.dart';
import 'package:horizon_comfort/screens/loading_screen.dart';
import 'package:horizon_comfort/screens/shoe_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/widgets/custom_list_tile.dart';

class BuildFavourites extends StatefulWidget {
  const BuildFavourites({Key? key}) : super(key: key);

  @override
  State<BuildFavourites> createState() => _BuildFavouritesState();
}

class _BuildFavouritesState extends State<BuildFavourites> {
  @override
  void initState() {
    super.initState();
    final favouritesCubit = BlocProvider.of<FavouritesCubit>(context);
    favouritesCubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: kPastelPink,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    'Favourite items',
                    style: kTypewriterTitleBoldTextStyle.copyWith(fontSize: 22),
                  ),
                ],
              ),
            ),
            BlocBuilder<FavouritesCubit, FavouritesState>(
              builder: (context, state) {
                if (state is FavouritesChanged) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: state.shoesFavourite.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: const Key('key'),
                          onDismissed: (direction) {
                            BlocProvider.of<FavouritesCubit>(context)
                                .favouritesChanged(
                                    state.shoesFavourite[index].id);
                          },
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShoeScreen(
                                            shoe: state.shoesFavourite[index],
                                          )));
                            },
                            child: CustomListTile(state.shoesFavourite[index]),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        thickness: 2,
                      ),
                    ),
                  );
                } else if (state is FavouritesLoading) {
                  return const BuildLoading();
                } else if (state is FavouritesError) {
                  return Text(state.message);
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
