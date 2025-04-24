import 'package:flutter/material.dart';

import 'kubsu_button_delegate.dart';

class KubsuIconButton extends StatelessWidget {
  const KubsuIconButton({
    super.key,
    required this.delegate,
    required this.icon,
    this.shape = BoxShape.circle,
    this.size = 48,
  });

  final KubsuButtonDelegate delegate;
  final BoxShape shape;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox.square(
        dimension: size,
        child: InkWell(
          onTap: delegate.onTap,
          splashColor: delegate.splashColor,
          highlightColor: delegate.highlightColor,
          borderRadius: shape == BoxShape.circle ? BorderRadius.circular(100) : delegate.radius,
          child: Ink(
            decoration: BoxDecoration(
              boxShadow: delegate.boxShadow,
              color: delegate.backgroundColor,
              borderRadius: shape == BoxShape.circle ? BorderRadius.circular(100) : delegate.radius,
              border: delegate.border,
            ),
            child: Center(child: Icon(icon, color: delegate.iconColor, size: size / 2)),
          ),
        ),
      ),
    );
  }
}
