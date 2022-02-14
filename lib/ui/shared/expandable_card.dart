import 'dart:math' as math;

import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class ExpandableCard extends StatefulWidget {
  final String title;
  final Widget expandedSection;
  final Color color;
  final bool expanded;
  const ExpandableCard({
    required this.title,
    required this.expandedSection,
    required this.color,
    this.expanded = false,
  });

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _expandingAnimation;
  late Animation<double> _iconAnimation;
  bool _isExpanded = false;
  late Duration _animationDuration;
  @override
  void initState() {
    super.initState();
    _animationDuration = Duration(milliseconds: 350);
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    _expandingAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );
    _iconAnimation = Tween<double>(
      end: 0,
      begin: math.pi,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    if (widget.expanded) expandOrCollapse();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: expandOrCollapse,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 20 / 2.5,
        ),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: widget.color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: buildAnimatedIcon(),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 15),
                  child: Text(
                    widget.title,
                    style: Constants.mediumText,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizeTransition(
              sizeFactor: _expandingAnimation,
              child: widget.expandedSection,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAnimatedIcon() {
    return AnimatedBuilder(
        animation: _iconAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _iconAnimation.value,
            child: Icon(
              Icons.keyboard_arrow_up,
              size: 38,
              color: Colors.white,
              key: UniqueKey(),
            ),
          );
        });
  }

  void expandOrCollapse() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }
}
