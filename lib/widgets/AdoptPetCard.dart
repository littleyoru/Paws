import 'package:flutter/material.dart';
import '../constants/app_icons.dart';

class AdoptPetCard extends StatelessWidget {
  AdoptPetCard(
      {Key? key,
      required this.name,
      required this.age,
      required this.gender,
      required this.imageUrl})
      : super(key: key);

  final String name;
  final String age;
  final String gender;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(5.0),
                ),
                image: DecorationImage(
                    image: AssetImage('$imageUrl'), fit: BoxFit.cover),
              ),
              // child: Image.asset(
              //   'assets/graphics/test/Mjavse.jpg',
              //   fit: BoxFit.cover,
              // ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  gender == 'M' ? AppIcons.male : AppIcons.female,
                  // color: createMaterialColor(
                  //     Color(0xFF9E181C)),
                ),
                Text('$name'),
                Text('$age')
              ],
            )
          ],
        ),
      ),
    );
  }
}
