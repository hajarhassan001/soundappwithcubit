import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sound_app/presentation/widgets/custompage.dart';

import '../../data/local_data.dart';

part 'sound_state.dart';

class SoundCubit extends Cubit<SoundState> {
  static final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  double value = 0;
  SoundCubit() : super(SoundInitial());

  static SoundCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  void seekAudio(){

   final position =  (Duration(seconds: value.toInt()));
          player.seek(position);

     emit(SoundseekAudio());

  }


  void soundInitialCubit()  {
    player.onPlayerStateChanged.listen((state) {
      isPlaying = state == PlayerState.playing;
    });


    player.onDurationChanged.listen((Duration d) {
      duration = d;
    });


    player.onDurationChanged.listen((Duration p) {
      position = p;
    });

    emit(SoundInitial());
  }

  void soundResumeAndPauseCubit()async {
    isPlaying = !isPlaying;

    if (isPlaying) {
   await   player.play(AssetSource(listSound[CustomPage.currentItem!].sound));
    } else {
      player.pause();
    }
    emit(SoundResumeAndPause());
  }


 
}
