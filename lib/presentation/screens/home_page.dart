import 'package:flutter/material.dart';
import 'package:sound_app/core/constant.dart';
import 'package:sound_app/core/screensize.dart';

import '../widgets/customlistview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
              children: [
        Container(
          height: ScreenSize.const_height / 3,
          width: ScreenSize.const_width,
          decoration: const BoxDecoration(
              image:  DecorationImage(
                  image:  AssetImage(myconst.abdarhamnimage),
                  fit: BoxFit.fill)),
        ),
        Container(
        
           height: ScreenSize.const_height / 1.5,
            width: ScreenSize.const_width,
              decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 48, 48, 48),
                   ),
          child:  CustomListView(),
        ),
              ],
            ));
  }
}
  
