import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_comfort/blocs/shoe/shoe_bloc.dart';

import '../data/database_repository.dart';
import '../data/models/shoe_model.dart';
import '../utilities/constants.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_gallery_button.dart';

class ShoeScreen extends StatelessWidget {
  const ShoeScreen({Key? key, this.shoe}) : super(key: key);

  static const String routeName = 'ShoeScreen';
  final ShoeModel? shoe;

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
                BlocBuilder<ShoeBloc, ShoeState>(
                  builder: (context, state) {
                    if (state is ShoeUpdateIndex) {
                      return Container(
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
                                (shoe?.galleryUrl![
                                    state.galleryIndex.toString()])!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            //child: Text(shoes[index].toString()),
                          ),
                        ),
                      );
                    }
                    return Container(
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
                              (shoe?.galleryUrl!['0'])!,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          //child: Text(shoes[index].toString()),
                        ),
                      ),
                    );
                  },
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
              (shoe?.name)!,
              textAlign: TextAlign.center,
              style: kTypewriterTitleBoldTextStyle,
            ),
            CustomElevatedButton(
              minimumSize: const Size(300, 50),
              onPressed: () {
                print(shoe?.id);
                RepositoryProvider.of<DatabaseRepository>(context)
                    .addShoeToUserCart(shoe?.id);
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
              'brand: ${shoe?.brand!}',
              textAlign: TextAlign.center,
              style: kTypewriterTextStyle,
            ),
            Text(
              'condition: ${shoe?.condition!}',
              textAlign: TextAlign.center,
              style: kTypewriterTextStyle,
            ),
            Text(
              'price: ${shoe?.price!}',
              textAlign: TextAlign.center,
              style: kTypewriterTextStyle,
            ),
            Text(
              'size: ${shoe?.size!}',
              textAlign: TextAlign.center,
              style: kTypewriterTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
