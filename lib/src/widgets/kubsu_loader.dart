import 'package:flutter/material.dart';
import 'package:kubsu_design_system/kubsu_design_system.dart';

class KubsuLoader extends StatefulWidget {
  const KubsuLoader({super.key, this.size = 48, this.spacing = 2});

  final double size;
  final double spacing;

  @override
  State<KubsuLoader> createState() => _KubsuLoaderState();
}

class _KubsuLoaderState extends State<KubsuLoader> with TickerProviderStateMixin {
  final _positions = [Alignment.topRight, Alignment.bottomRight, Alignment.bottomLeft, Alignment.topLeft];

  Alignment _alignmentFirst = Alignment.topRight;
  Alignment _alignmentSecond = Alignment.topLeft;
  Alignment _alignmentThird = Alignment.bottomLeft;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      switchOne();
    });
  }

  void switchOne() {
    int index = _positions.indexOf(_alignmentFirst);
    index = (index + 1) % _positions.length;
    setState(() => _alignmentFirst = _positions[index]);
  }

  void switchSecond() {
    int index = _positions.indexOf(_alignmentSecond);
    index = (index + 1) % _positions.length;
    setState(() => _alignmentSecond = _positions[index]);
  }

  void switchThird() {
    int index = _positions.indexOf(_alignmentThird);
    index = (index + 1) % _positions.length;
    setState(() => _alignmentThird = _positions[index]);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return SizedBox.square(
      dimension: widget.size,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: _alignmentFirst,
            onEnd: switchSecond,
            child: _Box(color: colors.iconAccent, size: widget.size / 2 - widget.spacing),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: _alignmentSecond,
            onEnd: switchThird,
            child: _Box(color: colors.iconAccent.withAlpha(153), size: widget.size / 2 - widget.spacing),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: _alignmentThird,
            onEnd: switchOne,
            child: _Box(color: colors.iconAccent.withAlpha(76), size: widget.size / 2 - widget.spacing),
          ),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3))),
    );
  }
}
