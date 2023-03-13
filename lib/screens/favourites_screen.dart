import 'package:flutter/material.dart';
import 'package:horizon_comfort/utilities/constants.dart';

class BuildFavourites extends StatefulWidget {
  const BuildFavourites({Key? key}) : super(key: key);

  @override
  State<BuildFavourites> createState() => _BuildFavouritesState();
}

class _BuildFavouritesState extends State<BuildFavourites> {
  @override
  void initState() {
    super.initState();
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
          ],
        ),
      ),
    );
  }
}
