


import 'package:flutter/material.dart';


enum ButtonAnimation {
  animation1,
}

class AnimatedButton extends StatefulWidget {
  
  final Widget child;
  final double? width, height;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final void Function(bool)? onHover;
  final void Function(bool)? onFocusChange;
  final BoxDecoration ? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip? clipBehavior;
  // final WidgetStatesController? statesController;

  const AnimatedButton({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    // this.statesController,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  
  late Animation _animation;
  late AnimationController _controller;


  void initAnimationVaribals(){
    _animation = Tween<double>(begin: 0.01,end: 0.09).animate(_controller);
    _controller.addListener((){
      setState(() {
        
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    initAnimationVaribals();
  }

  @override
  Widget build(BuildContext context) {

   

    return FocusableActionDetector(
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      onShowFocusHighlight: widget.onFocusChange,
      child: MouseRegion(
        onEnter: (event) => widget.onHover?.call(true),
        onExit: (event) => widget.onHover?.call(false),
        child: GestureDetector(
          onTapDown: (_) => _controller.forward(),
          onTapUp: (_) => _controller.reverse(),
          onTapCancel: () => _controller.reverse(),
          onLongPress: widget.onLongPress,
          child: Container(
            clipBehavior: widget.clipBehavior ?? Clip.none,
            width: widget.width != null ? (widget.width!-(widget.width! * _animation.value).toDouble())  : 100-(100 * _animation.value).toDouble(),
            height: widget.height != null ? (widget.height!-(widget.height! * _animation.value).toDouble())  : 60-(60 * _animation.value).toDouble(),
            decoration: widget.style ?? BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.blueAccent,
                  Colors.lightBlue,
                  Colors.lightBlueAccent,
                ]
              )
            ),
            child: Center(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}