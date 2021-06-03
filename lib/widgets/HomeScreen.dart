import 'package:flutter/material.dart';

// widgets
import './CustomAppBar.dart';

// utils
import '../utils/helpers/color_helper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key, @required this.title, @required this.isLoggedIn})
      : super(key: key);

  final String title;
  final bool isLoggedIn;

  // @override
  // _HomeScreenState createState() => _HomeScreenState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        isLoggedIn: isLoggedIn,
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
                                    MyIcons.male,
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
                                    MyIcons.female,
                                  ),
                                  Text('Tigress'),
                                  Text('Adult')
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
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
