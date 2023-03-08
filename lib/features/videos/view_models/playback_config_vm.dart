import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/playback_config_repo.dart';

class PlaybackConfigViewModel extends ChangeNotifier {
  final PlaybackConfigRepo _repo;

  late final PlaybackConfigModel _model = PlaybackConfigModel(
    isMuted: _repo.isMuted(),
    isAutoplay: _repo.isAutoplay(),
  );

  PlaybackConfigViewModel(this._repo);

  void setMuted(bool value) {
    _repo.setMuted(value);
    _model.isMuted = value;
    notifyListeners();
  }

  void setAutoplay(bool value) {
    _repo.setAutoplay(value);
    _model.isAutoplay = value;
    notifyListeners();
  }

  bool get isMuted => _model.isMuted;
  bool get isAutoplay => _model.isAutoplay;
}
