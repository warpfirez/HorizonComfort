import 'package:flutter/material.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:horizon_comfort/utilities/constants.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
    this.shoe, {
    super.key,
  });

  final ShoeModel shoe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: kBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black, border: Border.all(width: 2)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(shoe.pictureUrl!),
                    //child: Text(shoes[index].toString()),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    '${shoe.name}',
                    style: kTypewriterTextStyle.copyWith(fontSize: 16),
                    maxLines: 3,
                  ),
                )
              ],
            ),
            Text(
              '${shoe.price.toString()} €',
              style: kTypewriterTextStyle,
            ),
          ],
        ),
      ),
      // Center(child: Text('Entry ${shoesInCart[index].id}')),
    );
  }
}
