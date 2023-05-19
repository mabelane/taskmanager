import 'package:flutter/material.dart';

import '../../util/colours.dart';

class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: screenWidth * .155,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              color: bgGColour.withOpacity(0.7),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .015),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {});
                    },
                    child: Stack(children: [
                      AnimatedContainer(
                        curve: Curves.fastEaseInToSlowEaseOut,
                        duration: const Duration(seconds: 1),
                        width: index == _selectedIndex
                            ? screenWidth * .32
                            : screenWidth * .18,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastEaseInToSlowEaseOut,
                          height:
                              index == _selectedIndex ? screenWidth * .12 : 0,
                          width:
                              index == _selectedIndex ? screenWidth * .32 : 0,
                          decoration: BoxDecoration(
                              color: index == _selectedIndex
                                  ? pColour.withOpacity(.2)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      )
                    ]),
                  )),
        ),
      ),
    );
  }
}
