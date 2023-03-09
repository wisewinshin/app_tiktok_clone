import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoint.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
import 'package:tiktok_clone/features/videos/widgets/video_variant_button.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VieosPost extends ConsumerStatefulWidget {
  final Function onVideoFinished;
  final int index;
  const VieosPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  VieosPostState createState() => VieosPostState();
}

class VieosPostState extends ConsumerState<VieosPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoPlayerController;
  bool _isPaused = false;
  final _animationDuration = const Duration(milliseconds: 200);
  late final AnimationController _animationController;
  late bool isMuted = ref.read(playbackConfigProvider).isMuted;

  void _onVideoChanged() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset("assets/videos/video.mp4");
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    if (!mounted) return;
    if (kIsWeb || isMuted) {
      await _videoPlayerController.setVolume(0);
    }
    setState(() {});
    _videoPlayerController.addListener(_onVideoChanged);
  }

  void _onVisibilityChange(VisibilityInfo info) async {
    if (!mounted) return;
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying &&
        ref.read(playbackConfigProvider).isAutoplay) {
      await _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
      setState(() {
        _isPaused = true;
      });
    } else {
      _videoPlayerController.play();
      _animationController.forward();
      setState(() {
        _isPaused = false;
      });
    }
  }

  void _onMuteTap() {
    if (_videoPlayerController.value.volume == 0) {
      _videoPlayerController.setVolume(0.5);
      isMuted = false;
    } else {
      _videoPlayerController.setVolume(0);
      isMuted = true;
    }
    setState(() {});
  }

  void _onCommentsTap(BuildContext context) async {
    late bool isPlayed;
    if (_videoPlayerController.value.isPlaying) {
      isPlayed = true;
      _onTogglePause();
    } else {
      isPlayed = false;
    }
    await showModalBottomSheet(
      constraints: const BoxConstraints(maxWidth: Breakpoints.sm),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const VideoComments(),
    );
    if (isPlayed) {
      _onTogglePause();
    }
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChange,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: _animationDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      size: Sizes.size52,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Username",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v24,
                Text(
                  "discription",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                IconButton(
                  onPressed: _onMuteTap,
                  icon: isMuted
                      ? const FaIcon(
                          FontAwesomeIcons.volumeXmark,
                          size: Sizes.size32,
                          color: Colors.white,
                        )
                      : const FaIcon(
                          FontAwesomeIcons.volumeHigh,
                          size: Sizes.size32,
                          color: Colors.white,
                        ),
                ),
                Gaps.v24,
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/92836658?v=4"),
                  child: Text(""),
                ),
                Gaps.v24,
                const VideoVariantButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: "2.9M",
                ),
                Gaps.v24,
                GestureDetector(
                  onTap: () => _onCommentsTap(context),
                  child: const VideoVariantButton(
                    icon: FontAwesomeIcons.solidCommentDots,
                    text: "33K",
                  ),
                ),
                Gaps.v24,
                const VideoVariantButton(
                  icon: FontAwesomeIcons.share,
                  text: "Share",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
