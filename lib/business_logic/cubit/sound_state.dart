part of 'sound_cubit.dart';

@immutable
sealed class SoundState {}

final class SoundInitial extends SoundState {}

final class SoundResumeAndPause extends SoundState {}

final class SoundseekAudio extends SoundState {}









