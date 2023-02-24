import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/blocs/shoe/shoe_bloc.dart';

import '../data/models/shoe_model.dart';
import '../utilities/constants.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_gallery_button.dart';

class ShoeScreen extends StatelessWidget {
  const ShoeScreen({Key? key}) : super(key: key);

  static const String routeName = 'ShoeScreen';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) {
        return const ShoeScreen();
      },
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomGalleryButton(
                  text: '<',
                  myFunction: () {
                    context.read<ShoeBloc>().add(DecrementIndex());
                  },
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black, border: Border.all(width: 5)),
                  child: InteractiveViewer(
                    maxScale: 2.5,
                    minScale: 0.1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 300,
                        child: Image.network(
                          ShoeModel.shoes[0].pictureUrl!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      //child: Text(shoes[index].toString()),
                    ),
                  ),
                ),
                CustomGalleryButton(
                  text: '>',
                  myFunction: () {
                    context.read<ShoeBloc>().add(IncrementIndex());
                  },
                ),
              ],
            ),
            Text(
              ShoeModel.shoes[0].name!,
              textAlign: TextAlign.center,
              style: kTypewriterTitleBoldTextStyle,
            ),
            CustomElevatedButton(
              minimumSize: const Size(300, 50),
              onPressed: () {
                print('Adding to cart');
              },
              text: 'Add to cart',
            ),
            const SizedBox(
              width: 300,
              child: Divider(
                thickness: 2,
              ),
            ),
            Text(
              'brand: ${ShoeModel.shoes[0].brand!}',
              textAlign: TextAlign.center,
              style: kTypewriterTextStyle,
            ),
            Text(
              'condition: ${ShoeModel.shoes[0].condition!}',
              textAlign: TextAlign.center,
              style: kTypewriterTextStyle,
            ),
            Text(
              'price: ${ShoeModel.shoes[0].price!}',
              textAlign: TextAlign.center,
              style: kTypewriterTextStyle,
            ),
            Text(
              'size: ${ShoeModel.shoes[0].size!}',
              textAlign: TextAlign.center,
              style: kTypewriterTextStyle,
            ),
            BlocBuilder<ShoeBloc, ShoeState>(builder: (context, state) {
              if (state is ShoeStateInitial) {
                return _counter(context, 0);
              }
              if (state is ShoeUpdateIndex) {
                return _counter(context, state.index);
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}

Widget _counter(BuildContext context, int counter) {
  return Center(
    child: Text(
      counter.toString(),
    ),
  );
}
