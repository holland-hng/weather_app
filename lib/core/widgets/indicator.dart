import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

import 'package:flutter/material.dart';

class SimpleIndicatorContent extends StatelessWidget {
  const SimpleIndicatorContent({
    required this.controller,
    this.indicatorSize = _defaultIndicatorSize,
  }) : assert(indicatorSize > 0);

  final IndicatorController controller;
  static const _defaultIndicatorSize = 40.0;
  final double indicatorSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: indicatorSize,
      width: indicatorSize,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(blurRadius: 5, color: Color(0x42000000))],
      ),
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: controller,
              child: const Icon(
                Icons.refresh,
                color: Colors.blueAccent,
                size: 30,
              ),
              builder: (context, child) => InfiniteRatation(
                running: controller.isLoading,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final simpleIndicator = CustomIndicatorConfig(
  builder: (context, child, controller) => Stack(
    children: <Widget>[
      child,
      PositionedIndicatorContainer(
        controller: controller,
        child: SimpleIndicatorContent(
          controller: controller,
        ),
      ),
    ],
  ),
);

final simpleIndicatorWithOpacity = CustomIndicatorConfig(
  builder: (context, child, controller) => Stack(children: <Widget>[
    AnimatedBuilder(
      child: child,
      animation: controller,
      builder: (context, child) => Opacity(
        opacity: 1.0 - controller.value.clamp(0.0, 1.0),
        child: child,
      ),
    ),
    PositionedIndicatorContainer(
      controller: controller,
      child: SimpleIndicatorContent(controller: controller),
    ),
  ]),
);

class CustomIndicatorConfig {
  final IndicatorBuilder builder;

  const CustomIndicatorConfig({
    required this.builder,
  });
}

class InfiniteRatation extends StatefulWidget {
  final Widget? child;
  final bool running;
  final bool reverse;

  InfiniteRatation({
    required this.child,
    required this.running,
    this.reverse = false,
    Key? key,
  }) : super(key: key);
  @override
  InfiniteRatationState createState() => InfiniteRatationState();
}

class InfiniteRatationState extends State<InfiniteRatation>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void didUpdateWidget(InfiniteRatation oldWidget) {
    if (oldWidget.running != widget.running) {
      if (widget.running) {
        _startAnimation();
      } else {
        _rotationController
          ..stop()
          ..value = 0.0;
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );

    if (widget.running) {
      _startAnimation();
    }

    super.initState();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _rotationController.repeat(reverse: widget.reverse);
  }

  @override
  Widget build(BuildContext context) =>
      RotationTransition(turns: _rotationController, child: widget.child);
}
