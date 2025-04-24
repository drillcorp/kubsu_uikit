import 'package:flutter/material.dart';
import 'package:kubsu_design_system/kubsu_design_system.dart';

class KubsuSwitcher extends StatefulWidget {
  const KubsuSwitcher({super.key, required this.value, required this.onChange, this.size = 54, this.thumbPadding = 4});

  final double size, thumbPadding;
  final bool value;
  final void Function(bool) onChange;

  @override
  State<KubsuSwitcher> createState() => _KubsuSwitcherState();
}

class _KubsuSwitcherState extends State<KubsuSwitcher> {
  final _animationDuration = const Duration(milliseconds: 100);
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _value = !_value);
        widget.onChange.call(_value);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(
          height: widget.size / 1.9,
          width: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                color: _value ? Color(0xFFE6EAF0) : context.appColors.surfaceAccent,
                duration: _animationDuration,
              ),
              Positioned(
                left: widget.thumbPadding,
                right: widget.thumbPadding,
                child: AnimatedAlign(
                  duration: _animationDuration,
                  alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
                  child: SizedBox.square(
                    dimension: widget.size / 2.51,
                    child: DecoratedBox(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: context.appColors.surfacePrimary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
