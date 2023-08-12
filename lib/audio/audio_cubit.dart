import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit()
      : super(
          const AudioState(
            isDevicePrefsConnected: false,
            backgroundVolume: 0,
            generalVolume: 0,
            soundEffectsVolume: 0,
            dialogueVolume: 0,
          ),
        );

  final AudioPlayer _audioPlayerForBGM = AudioPlayer();
  final AudioPlayer _audioPlayerForSFX = AudioPlayer();

  void connectDevicePrefs(
    double backgroundVolume,
    double dialogueVolume,
    double generalVolume,
    double soundEffectsVolume,
  ) {
    if (!state.isDevicePrefsConnected) {
      emit(
        state.copyWith(
          backgroundVolume: backgroundVolume,
          dialogueVolume: dialogueVolume,
          generalVolume: generalVolume,
          soundEffectsVolume: soundEffectsVolume,
          isDevicePrefsConnected: true,
        ),
      );
    }
  }

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
  ) async {
    final clearedAssetPath = bgmAssetPath.replaceFirst('assets/', '');
    await _audioPlayerForBGM.play(
      AssetSource(
        clearedAssetPath,
      ),
      volume: state.backgroundVolume * state.generalVolume,
    );
    await _audioPlayerForBGM.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> stopBackgroundMusic() async {
    await _audioPlayerForBGM.stop();
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
    _audioPlayerForSFX.dispose();
    return super.close();
  }
}
