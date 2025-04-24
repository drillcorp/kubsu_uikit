import 'package:flutter/material.dart';

import 'kubsu_button_delegate.dart';

class KubsuButton extends StatelessWidget {
  const KubsuButton({required this.title, required this.delegate, super.key, this.icon});

  final String title;
  final Widget? icon;
  final KubsuButtonDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: delegate.onTap,
      borderRadius: delegate.radius,
      splashColor: delegate.splashColor,
      highlightColor: delegate.highlightColor,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: delegate.radius,
          color: delegate.backgroundColor,
          border: delegate.border,
          boxShadow: delegate.boxShadow,
        ),
        child: Padding(
          padding: delegate.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [if (icon case Widget icon) icon, Text(title, style: delegate.style)],
          ),
        ),
      ),
    );
  }
}
