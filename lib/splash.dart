import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/scheduler.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SimpleAnimation _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('Entrence', autoplay: false);

    _controller.isActiveChanged.addListener(() {
      if (!_controller.isActive) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          setState(() {
            isPlaying = false;
          });
        });
      }
    });
  }

  void _toggleAnimation() {
    setState(() {
      if (_controller.isActive) {
        _controller.isActive = false;
      } else {
        _controller.reset();
        _controller.isActive = true;
      }
      isPlaying = _controller.isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          'assets/identity_logo.riv',
          fit: BoxFit.cover,
          onInit: (artboard) {
            artboard.addController(_controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAnimation,
        child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
