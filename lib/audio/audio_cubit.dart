import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(const AudioState(isBackgroundSoundPlaying: false));
  final AudioPlayer _audioPlayerForBGM = AudioPlayer();
  final AudioPlayer _audioPlayerForSFX = AudioPlayer();

  Future<void> playSoundEffect(String sfxAssetPath) async {
    final clearedAssetPath = sfxAssetPath.replaceFirst('assets/', '');

    await _audioPlayerForSFX.play(
      AssetSource(
        clearedAssetPath,
      ),
    );
  }

  Future<void> playBackgroundSound(String bgmAssetPath) async {
    final clearedAssetPath = bgmAssetPath.replaceFirst('assets/', '');
    await _audioPlayerForBGM.play(
      AssetSource(
        clearedAssetPath,
      ),
    );
    await _audioPlayerForBGM.setReleaseMode(ReleaseMode.loop);
    emit(state.copyWith(isBackgroundSoundPlaying: true));
  }

  Future<void> stopBackgroundMusic() async {
    await _audioPlayerForBGM.stop();
    emit(state.copyWith(isBackgroundSoundPlaying: false));
  }

  @override
  Future<void> close() {
    _audioPlayerForBGM.dispose();
    return super.close();
  }
}
