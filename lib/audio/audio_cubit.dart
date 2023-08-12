import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit()
      : super(
          const AudioState(
            backgroundVolume: 1,
            generalVolume: 1,
            soundEffectsVolume: 1,
            dialogueVolume: 1,
          ),
        );

  final AudioPlayer _audioPlayerForBGM = AudioPlayer();
  final AudioPlayer _audioPlayerForSFX = AudioPlayer();

  // SOUND EFFECTS
  Future<void> playSoundEffect(
    String sfxAssetPath,
  ) async {
    final clearedAssetPath = sfxAssetPath.replaceFirst('assets/', '');

    await _audioPlayerForSFX.play(
      AssetSource(
        clearedAssetPath,
      ),
      volume: state.soundEffectsVolume * state.generalVolume,
    );
  }

  void setSoundEffectsVolume(
    double newSoundEffectsVolume,
    double generalVolume,
  ) {
    final updatedState = state.copyWith(
      soundEffectsVolume: newSoundEffectsVolume * generalVolume,
    );
    emit(updatedState);
  }

  // BACKGROUND MUSICS
  Future<void> playBackgroundSound(
    String bgmAssetPath,
    double backgroundMusicVolume,
    double generalVolume,
  ) async {
    final clearedAssetPath = bgmAssetPath.replaceFirst('assets/', '');
    await _audioPlayerForBGM.play(
      AssetSource(
        clearedAssetPath,
      ),
      volume: backgroundMusicVolume * generalVolume,
    );
    await _audioPlayerForBGM.setReleaseMode(ReleaseMode.loop);
    emit(state.copyWith(isBackgroundSoundPlaying: true));
  }

  Future<void> stopBackgroundMusic() async {
    await _audioPlayerForBGM.stop();
    emit(state.copyWith(isBackgroundSoundPlaying: false));
  }

  void setBackgroundMusicVolume(
    double newBackgroundMusicVolume,
    double generalVolume,
  ) {
    final updatedState = state.copyWith(
      backgroundVolume: newBackgroundMusicVolume * generalVolume,
    );

    emit(updatedState);

    _audioPlayerForBGM.setVolume(newBackgroundMusicVolume * generalVolume);
  }

  @override
  Future<void> close() {
    _audioPlayerForBGM.dispose();
    return super.close();
  }
}
