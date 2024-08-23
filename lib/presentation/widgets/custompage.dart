// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sound_app/business_logic/cubit/sound_cubit.dart';

import 'package:sound_app/core/constant.dart';

import '../../data/local_data.dart';
import 'customiconbutton.dart';

class CustomPage extends StatelessWidget {
  static int? currentItem;
  CustomPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoundCubit, SoundState>(
      listener: (context, state) {
      },
      
         builder: (context, state) {
            SoundCubit cubit = SoundCubit.get(context);
            cubit.soundInitialCubit();

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 120,
                      backgroundColor: Colors.amber,
                      child: CircleAvatar(
                          radius: 115,
                          foregroundImage: AssetImage(myconst.abdarhmanlist)),
                    ),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Flexible(
                              flex: 1,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.ios_share,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.orange,
                                    ),
                                  ])),
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                listSound[currentItem!].title,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          listSound[currentItem!].subtitle,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ]),
                    Slider(
                        value: cubit.position.inSeconds.toDouble(),
                        thumbColor: Colors.white,
                        activeColor: Colors.amber,
                        inactiveColor: Colors.grey,
                        min: 0.0,
                        max: cubit.duration.inSeconds.toDouble(),
                        onChanged: (value) async {
                          final position = Duration(seconds: value.toInt());
                         await SoundCubit.player.seek(position);
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButton(
                          icon: Icons.replay_10_rounded,
                          onPressed: () {},
                        ),
                        CustomIconButton(
                          icon: Icons.skip_previous_rounded,
                          onPressed: () {},
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            cubit.soundResumeAndPauseCubit();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          backgroundColor: Colors.amber,
                          child: Icon(
                            cubit.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        CustomIconButton(
                          icon: Icons.skip_next_rounded,
                          onPressed: () {},
                        ),
                        CustomIconButton(
                          icon: Icons.forward_10_rounded,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
  
  }

