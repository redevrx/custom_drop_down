import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.child,
    required this.dropDownBuilder,
    this.onStateChange,
    this.targetAnchor = Alignment.bottomLeft,
    this.alignment = AlignmentDirectional.topStart,
    this.getController,
  });

  final Widget child;
  final Widget Function(OverlayPortalController controller) dropDownBuilder;
  final Function(OverlayPortalController)? onStateChange;
  final Function(OverlayPortalController)? getController;

  final Alignment targetAnchor;
  final AlignmentGeometry alignment;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late OverlayPortalController _controller;
  final _link = LayerLink();

  void initController() {
    _controller = OverlayPortalController();

    if (widget.getController == null) return;
    widget.getController!(_controller);
  }

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _controller,
        overlayChildBuilder: (context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: widget.targetAnchor,
            child: Align(
              alignment: widget.alignment,
              child: widget.dropDownBuilder(_controller),
            ),
          );
        },
        child: GestureDetector(
          onTap: () {
            _controller.toggle();

            if (widget.onStateChange == null) return;
            widget.onStateChange!(_controller);
          },
          child: widget.child,
        ),
      ),
    );
  }
}

class CustomDropDownPosition extends StatefulWidget {
  const CustomDropDownPosition({
    super.key,
    required this.child,
    required this.dropDownBuilder,
    this.onStateChange,
    this.targetAnchor = Alignment.bottomLeft,
    this.alignment = AlignmentDirectional.topStart,
    this.getController,
    this.width,
    this.height,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  final Widget child;
  final Widget Function(OverlayPortalController controller) dropDownBuilder;
  final Function(OverlayPortalController)? onStateChange;
  final Function(OverlayPortalController)? getController;

  final Alignment targetAnchor;
  final AlignmentGeometry alignment;

  final double? width;
  final double? height;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  State<CustomDropDownPosition> createState() => _CustomDropDownPositionState();
}

class _CustomDropDownPositionState extends State<CustomDropDownPosition> {
  late OverlayPortalController _controller;
  final _link = LayerLink();

  void initController() {
    _controller = OverlayPortalController();

    if (widget.getController == null) return;
    widget.getController!(_controller);
  }

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _controller,
        overlayChildBuilder: (context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: widget.targetAnchor,
            child: Positioned(
              width: widget.width,
              height: widget.height,
              top: widget.top,
              right: widget.right,
              left: widget.left,
              bottom: widget.bottom,
              child: widget.dropDownBuilder(_controller),
            ),
          );
        },
        child: GestureDetector(
          onTap: () {
            _controller.toggle();

            if (widget.onStateChange == null) return;
            widget.onStateChange!(_controller);
          },
          child: widget.child,
        ),
      ),
    );
  }
}
