import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/playback_config_repo.dart';

class PlaybackConfigViewModel extends Notifier<PlaybackConfigModel> {
  final PlaybackConfigRepo _repo;

  PlaybackConfigViewModel(this._repo);

  void setMuted(bool value) {
    _repo.setMuted(value);
    state = PlaybackConfigModel(
      isAutoplay: state.isAutoplay,
      isMuted: value,
    );
  }

  void setAutoplay(bool value) {
    _repo.setAutoplay(value);
    state = PlaybackConfigModel(
      isAutoplay: value,
      isMuted: state.isMuted,
    );
  }

  @override
  PlaybackConfigModel build() {
    return PlaybackConfigModel(
      isMuted: _repo.isMuted(),
      isAutoplay: _repo.isAutoplay(),
    );
  }
}

final playbackConfigProvider =
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModel>(
  () => throw UnimplementedError(),
);
