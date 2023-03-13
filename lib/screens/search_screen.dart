import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/cubits/search/search_cubit.dart';
import 'package:horizon_comfort/screens/shoe_screen.dart';
import 'package:horizon_comfort/utilities/constants.dart';
import 'package:horizon_comfort/widgets/custom_list_tile.dart';

class BuildSearch extends StatefulWidget {
  const BuildSearch({Key? key}) : super(key: key);

  @override
  State<BuildSearch> createState() => _BuildSearchState();
}

class _BuildSearchState extends State<BuildSearch> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: searchController,
            style: kTypewriterTextStyle,
            onChanged: (_) {
              final searchCubit = BlocProvider.of<SearchCubit>(context);
              searchCubit.searchChanged(searchController.text);
            },
            decoration: const InputDecoration(
              hintText: 'search ...',
              hintStyle: kTypewriterTextStyle,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 3.0),
              ),
              prefixIcon: Icon(
                Icons.search_outlined,
                color: Colors.black,
                size: 30,
              ),
              focusColor: Colors.black,
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchChanged) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.shoes.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoeScreen(
                                        shoe: state.shoes[index],
                                      )));
                        },
                        child: CustomListTile(state.shoes[index]),
                      );
                    },
                  ),
                );
              } else if (state is SearchLoading) {
                return const CircularProgressIndicator();
              } else if (state is SearchError) {
                return Text(state.message);
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
