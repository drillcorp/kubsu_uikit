import 'package:flutter/material.dart';
import 'package:kubsu_design_system/kubsu_design_system.dart';

class KubsuCheckBox extends StatefulWidget {
  const KubsuCheckBox({super.key, this.value = false, required this.onChange, this.size = 28});

  final bool value;
  final double size;
  final Function(bool value) onChange;

  @override
  State<KubsuCheckBox> createState() => _KubsuCheckBoxState();
}

class _KubsuCheckBoxState extends State<KubsuCheckBox> {
  bool _isSelected = false;
  final _iconSizeRatio = 1.75;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          setState(() => _isSelected = !_isSelected);
          widget.onChange.call(_isSelected);
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: widget.size,
            maxWidth: widget.size,
            minHeight: widget.size,
            minWidth: widget.size,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: _isSelected ? context.appColors.surfaceSecondaryAccent : context.appColors.surfaceSecondary,
              border: Border.all(
                color: _isSelected ? context.appColors.borderAccent : context.appColors.borderSecondary,
                width: 1,
              ),
            ),
            child: AnimatedSwitcher(
              reverseDuration: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child:
                  _isSelected
                      ? Icon(Icons.check, size: widget.size / _iconSizeRatio, color: context.appColors.iconAccent)
                      : SizedBox.expand(),
            ),
          ),
        ),
      ),
    );
  }
}
