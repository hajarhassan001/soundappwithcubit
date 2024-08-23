import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sound_app/business_logic/cubit/sound_cubit.dart';

import 'core/screensize.dart';
import 'presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.initi(context);

    return BlocProvider(
        create: (context) => SoundCubit(),
        child: const SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MyHomePage(title: 'sound app'),
          ),
        ));
  }
}
