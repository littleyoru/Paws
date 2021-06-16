import 'package:flutter/material.dart';

// constants
import '../constants/app_icons.dart';

// widgets
import './CustomAppBar.dart';
import './MainNavigationBar.dart';

// utils
import '../utils/helpers/color_helper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Paws',
        isLoggedIn: true,
        showLogout: true,
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                ListTile(
                  title: Text('Pet adoption'),
                  leading: Icon(
                    Icons.pets,
                    color: createMaterialColor(Color(0xFF9E181C)),
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
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
                                      image: AssetImage(
                                          'assets/graphics/test/Mjavse.jpeg'),
                                      fit: BoxFit.cover),
                                ),
                                // child: Image.asset(
                                //   'assets/graphics/test/Mjavse.jpg',
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    AppIcons.male,
                                    // color: createMaterialColor(
                                    //     Color(0xFF9E181C)),
                                  ),
                                  Text('Mjavse'),
                                  Text('Adult')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
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
                                      image: AssetImage(
                                          'assets/graphics/test/Tigress.PNG'),
                                      fit: BoxFit.cover),
                                ),
                                // child: Image.asset(
                                //   'assets/graphics/test/Mjavse.jpg',
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    AppIcons.female,
                                  ),
                                  Text('Tigress'),
                                  Text('Adult')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
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
                                      image: AssetImage(
                                          'assets/graphics/test/Godzira.PNG'),
                                      fit: BoxFit.cover),
                                ),
                                // child: Image.asset(
                                //   'assets/graphics/test/Mjavse.jpg',
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    AppIcons.female,
                                  ),
                                  Text('Godzira'),
                                  Text('Young')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column()
          ],
        ),
      ),
      bottomNavigationBar: MainNavigationBar(),
    );
  }
}
