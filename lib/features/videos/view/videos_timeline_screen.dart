import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/view_models/time_line_vm.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends ConsumerStatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  VideoTimelineScreenState createState() => VideoTimelineScreenState();
}

class VideoTimelineScreenState extends ConsumerState<VideoTimelineScreen> {
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

  Future<void> onRefresh() {
    return Future.delayed(const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ref.watch(timeLineProvider).when(
          data: (videos) => RefreshIndicator(
            color: Colors.black,
            backgroundColor: Colors.black,
            onRefresh: onRefresh,
            child: PageView.builder(
              itemBuilder: (context, index) => Container(
                color: Colors.black,
                child: VieosPost(
                  onVideoFinished: _onVideoFinished,
                  index: index,
                ),
              ),
              controller: _pageController,
              itemCount: videos.length,
              scrollDirection: Axis.vertical,
              onPageChanged: _onPageChanged,
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text("$error"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
