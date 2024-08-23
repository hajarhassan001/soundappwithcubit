import 'package:flutter/material.dart';

import '../widgets/custompage.dart';

class SoundDetails extends StatelessWidget {
  const SoundDetails({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.center,
      backgroundColor:  const Color.fromARGB(255, 48, 48, 48),
      extendBodyBehindAppBar: true,
      appBar: 
      AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      actions: [  IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_sharp))
      ],
      ) ,
      body:  
      CustomPage(),



    );
  }
}