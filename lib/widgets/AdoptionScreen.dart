import 'package:flutter/material.dart';
// widgets
import './CustomAppBar.dart';
import 'AdoptPetCard.dart';
import './MainNavigationBar.dart';
import './TempBottomBar.dart';

class AdoptionScreen extends StatelessWidget {
  AdoptionScreen({Key? key}) : super(key: key);

  // final List<Pet> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pet adoption',
        isLoggedIn: true,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            AdoptPetCard(
              name: 'Mjavse',
              age: 'Adult',
              gender: 'M',
              imageUrl: 'assets/graphics/test/Mjavse.jpeg',
            ),
            AdoptPetCard(
              name: 'Tigress',
              age: 'Adult',
              gender: 'F',
              imageUrl: 'assets/graphics/test/Tigress.PNG',
            ),
            AdoptPetCard(
              name: 'Beethoven',
              age: 'Senior',
              gender: 'M',
              imageUrl: 'assets/graphics/test/Beethoven.jpeg',
            ),
            AdoptPetCard(
              name: 'Shen-zin Su',
              age: 'Adult',
              gender: 'M',
              imageUrl: 'assets/graphics/test/Shen-zin_Su.jpeg',
            ),
            AdoptPetCard(
              name: 'Godzira',
              age: 'Young',
              gender: 'F',
              imageUrl: 'assets/graphics/test/Godzira.PNG',
            ),
          ],
        ),
        // GridView.count(
        //   crossAxisCount: 2,
        //   children: <Widget>[
        //     AdoptPetCard(
        //       name: 'Mjavse',
        //       age: 'Adult',
        //       imageUrl: 'assets/graphics/test/Mjavse.jpeg',
        //     ),
        //     AdoptPetCard(
        //         name: 'Tigress',
        //         age: 'Adult',
        //         imageUrl: 'assets/graphics/test/Tigress.PNG')
        //   ],
        // ),
      ),
      bottomNavigationBar: TempBottomBar(),
    );
  }
}
