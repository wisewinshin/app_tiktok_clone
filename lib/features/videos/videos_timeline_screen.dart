import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final _scrollDuration = const Duration(milliseconds: 200);
  final _scrollCurve = Curves.linear;

  int _pageCount = 10;

  final PageController _pageController = PageController();

  void _onPageChanged(int index) {
    _pageController.animateToPage(
      index,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (index == _pageCount - 2) {
      _pageCount++;
      setState(() {});
    }
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => VieosPost(
        onVideoFinished: _onVideoFinished,
        index: index,
        key: GlobalKey(),
      ),
      controller: _pageController,
      itemCount: _pageCount,
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
    );
  }
}
