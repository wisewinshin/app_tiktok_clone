import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/view/video_preview_screen.dart';

class VideoRecordingScreen extends StatefulWidget {
  static const String routeName = "postVideo";
  static const String routeURL = "/uploading";
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late CameraController _cameraController;
  bool _hasPermissons = false;
  bool _isSelfieMode = false;
  late FlashMode _flashMode;
  late double _currentZoom;
  late double _maxZoom;
  late double _minZoom;

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 200,
    ),
  );
  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.1).animate(_animationController);

  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
    lowerBound: 0.0,
    upperBound: 1.0,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initPermissions();
    initCamera();
    _progressAnimationController.addListener(() {
      setState(() {});
    });
    _progressAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _stopRecording();
      }
    });
  }

  Future<void> initPermissions() async {
    final PermissionStatus cameraPermission = await Permission.camera.request();
    final PermissionStatus micPermission =
        await Permission.microphone.request();

    final bool cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final bool micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      setState(() {
        _hasPermissons = true;
      });
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }
    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.high,
    );

    await _cameraController.initialize();
    await _cameraController.prepareForVideoRecording(); //애플전용
    _flashMode = _cameraController.value.flashMode;
    _maxZoom = await _cameraController.getMaxZoomLevel();
    _minZoom = await _cameraController.getMinZoomLevel();
    _currentZoom = (_maxZoom + _minZoom) / 5;
    setState(() {});
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
  }

  Future<void> _rotateflashMode() async {
    switch (_flashMode) {
      case FlashMode.auto:
        _flashMode = FlashMode.off;
        break;
      case FlashMode.off:
        _flashMode = FlashMode.always;
        break;
      case FlashMode.always:
        _flashMode = FlashMode.torch;
        break;
      case FlashMode.torch:
        _flashMode = FlashMode.auto;
        break;
      default:
        _flashMode = FlashMode.auto;
    }
    await _cameraController.setFlashMode(_flashMode);
    setState(() {});
  }

  IconData getFlashIcon() {
    switch (_flashMode) {
      case FlashMode.always:
        return Icons.flash_on_rounded;
      case FlashMode.auto:
        return Icons.flash_auto_rounded;
      case FlashMode.off:
        return Icons.flash_off_rounded;
      case FlashMode.torch:
        return Icons.flashlight_on;
      default:
        return Icons.flash_auto_rounded;
    }
  }

  Future<void> _startRecording(TapDownDetails details) async {
    if (_cameraController.value.isRecordingVideo) {
      return;
    }
    await _cameraController.startVideoRecording();
    _animationController.forward();
    _progressAnimationController.forward();
  }

  Future<void> _stopRecording() async {
    if (!_cameraController.value.isRecordingVideo) {
      return;
    }
    _animationController.reverse();
    _progressAnimationController.reset();
    final XFile file = await _cameraController.stopVideoRecording();

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(
          videos: file,
          isPicked: false,
        ),
      ),
    );
  }

  Future<void> _onPickVideosPressed() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video == null) return;
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(
          videos: video,
          isPicked: true,
        ),
      ),
    );
  }

  void _changeCameraZoom(DragUpdateDetails details) async {
    if (details.localPosition.dy >= 0) {
      if (_currentZoom + (-details.localPosition.dy * 0.05) < _minZoom) return;
      _cameraController
          .setZoomLevel(_currentZoom + (-details.localPosition.dy * 0.05));
    }
    if (details.localPosition.dy < 0) {
      if (_currentZoom + (-details.localPosition.dy * 0.005) > _maxZoom) return;
      _cameraController
          .setZoomLevel(_currentZoom + (-details.localPosition.dy * 0.005));
    }
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (!_cameraController.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      await initCamera();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _animationController.dispose();
    _progressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _hasPermissons && _cameraController.value.isInitialized
            ? Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                  Positioned(
                    left: Sizes.size20,
                    top: Sizes.size20,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: _cameraController.value.isInitialized
                              ? _toggleSelfieMode
                              : null,
                          icon: const Icon(
                            Icons.cameraswitch,
                            color: Colors.white,
                          ),
                        ),
                        Gaps.v12,
                        IconButton(
                          onPressed: _rotateflashMode,
                          icon: Icon(
                            _cameraController.value.isInitialized
                                ? getFlashIcon()
                                : null,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: Sizes.size32,
                    child: Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onPanUpdate: _changeCameraZoom,
                          onTapDown: _startRecording,
                          onTapUp: (detail) => _stopRecording(),
                          child: ScaleTransition(
                            scale: _buttonAnimation,
                            child: Container(
                              padding: const EdgeInsets.all(Sizes.size4),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    width: Sizes.size60 + Sizes.size6,
                                    height: Sizes.size60 + Sizes.size6,
                                    child: CircularProgressIndicator(
                                      value: _progressAnimationController.value,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Container(
                                    width: Sizes.size60,
                                    height: Sizes.size60,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: _onPickVideosPressed,
                              icon: const Icon(
                                FontAwesomeIcons.image,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("권한주세요"),
                  Gaps.v10,
                  CircularProgressIndicator.adaptive(),
                ],
              ),
      ),
    );
  }
}
