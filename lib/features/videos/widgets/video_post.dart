import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VieosPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;
  const VieosPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VieosPost> createState() => _VieosPostState();
}

class _VieosPostState extends State<VieosPost> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");

  void _onVideoChanged() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    _videoPlayerController.play();
    setState(() {});
    _videoPlayerController.addListener(_onVideoChanged);
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _videoPlayerController.removeListener(_onVideoChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _videoPlayerController.value.isPlaying
              ? VideoPlayer(_videoPlayerController)
              : Container(
                  color: Colors.black,
                ),
        )
      ],
    );
  }
}
