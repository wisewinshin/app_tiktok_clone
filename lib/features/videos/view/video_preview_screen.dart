import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  final bool isPicked;
  final XFile videos;
  const VideoPreviewScreen({
    super.key,
    required this.videos,
    required this.isPicked,
  });

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late final VideoPlayerController _videoPlayerController;

  Future<void> _initVideo() async {
    _videoPlayerController =
        VideoPlayerController.file(File(widget.videos.path));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
    setState(() {});
  }

  Future<void> _saveVideo() async {
    await GallerySaver.saveVideo(widget.videos.path);
  }

  Future<void> _initPermission() async {
    final PermissionStatus storagePermission =
        await Permission.storage.request();
  }

  @override
  void initState() {
    super.initState();
    _initPermission();
    _initVideo();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("미리보기"),
        actions: [
          if (!widget.isPicked)
            IconButton(
              onPressed: _saveVideo,
              icon: const Icon(
                FontAwesomeIcons.floppyDisk,
              ),
            )
        ],
      ),
      body: _videoPlayerController.value.isInitialized
          ? VideoPlayer(_videoPlayerController)
          : null,
    );
  }
}
