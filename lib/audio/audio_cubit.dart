import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit({
    required AudioCache bgmAudioCache,
    required AudioCache sfxAudioCache,
  })  : _bgmPlayer = AudioPlayer()..audioCache = bgmAudioCache,
        _sfxPlayer = AudioPlayer()..audioCache = sfxAudioCache,
        super(
          const AudioState(
            isDevicePrefsConnected: false,
            backgroundVolume: 0,
            generalVolume: 0,
            soundEffectsVolume: 0,
            dialogueVolume: 0,
          ),
        );

  final AudioPlayer _bgmPlayer;
  final AudioPlayer _sfxPlayer;

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
    await _sfxPlayer.play(
      AssetSource(
        sfxAssetPath,
      ),
      volume: state.soundEffectsVolume * state.generalVolume,
    );
  }

  void setSoundEffectsVolume({
    required double newSoundEffectsVolume,
    required double generalVolume,
  }) {
    final updatedState = state.copyWith(
      soundEffectsVolume: newSoundEffectsVolume * generalVolume,
    );
    emit(updatedState);
    _sfxPlayer.setVolume(newSoundEffectsVolume * generalVolume);
  }

  // BACKGROUND MUSICS
  Future<void> playBackgroundSound(
    String bgmAssetPath,
  ) async {
    await _bgmPlayer.play(
      AssetSource(
        bgmAssetPath,
      ),
      volume: state.backgroundVolume * state.generalVolume,
    );
    await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> stopBackgroundMusic() async {
    await _bgmPlayer.stop();
  }

  void setBackgroundMusicVolume({
    required double newBackgroundMusicVolume,
    required double generalVolume,
  }) {
    final updatedState = state.copyWith(
      backgroundVolume: newBackgroundMusicVolume * generalVolume,
    );

    emit(updatedState);

    _bgmPlayer.setVolume(newBackgroundMusicVolume * generalVolume);
  }

  @override
  Future<void> close() {
    _bgmPlayer.dispose();
    _sfxPlayer.dispose();
    return super.close();
  }
}
