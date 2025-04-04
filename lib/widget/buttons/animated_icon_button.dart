

import 'package:flutter/material.dart';

class AnimatedIconButton extends StatefulWidget {

  
  const AnimatedIconButton({super.key});

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> with SingleTickerProviderStateMixin {
  
  late Animation _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100)
    );
    _animation = Tween<double>(begin: 0.2,end: 0.9).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _animation, 
      builder: (context, child) {
        
        return Container();
      },
    );
  }
}