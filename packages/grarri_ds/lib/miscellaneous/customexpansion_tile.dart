import 'package:flutter/material.dart';

import '../grarri_ds.dart';

const Duration _kExpand = Duration(milliseconds: 200);

// ignore: must_be_immutable
class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;
  bool isExpanded;
  CustomExpansionTile({
    super.key,
    required this.title,
    this.children = const <Widget>[],
    this.isExpanded = false,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _iconTurns;
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  late CurvedAnimation _heightFactor;
  final Tween<double> _heightFactorTween = Tween<double>(begin: 0.0, end: 1.0);

  @override
  void initState() {
    _animationController = AnimationController(duration: _kExpand, vsync: this);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
    _heightFactor = CurvedAnimation(
      parent: _animationController.drive(_heightFactorTween),
      curve: Curves.easeIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _heightFactor.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      widget.isExpanded = !widget.isExpanded;
      if (widget.isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.maybeOf(context)?.writeState(context, widget.isExpanded);
    });
  }

  void _handleTap() {
    _toggleExpansion();
  }

  Widget? _buildIcon(BuildContext context) {
    return RotationTransition(
      turns: _iconTurns,
      child: const Icon(
        Icons.arrow_drop_down,
        color: DsColors.color3CBCB4,
        size: 32,
      ),
    );
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final Widget tile = Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.title,
                  style:
                      DsFonts.medium14.copyWith(color: DsColors.color4A5662)),
              const SizedBox(width: 12),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(top: 2),
                      child: Divider(
                          color: DsColors.color4A5662.withOpacity(0.4)))),
              const SizedBox(width: 6),
              InkWell(
                onTap: _handleTap,
                child: _buildIcon(context),
              ),
            ],
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );

    return Material(
      color: Colors.transparent,
      child: tile,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !widget.isExpanded && _animationController.isDismissed;
    final bool shouldRemoveChildren = closed;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
      ),
    );
    return AnimatedBuilder(
      animation: _animationController.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
