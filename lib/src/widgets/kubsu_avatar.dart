import 'dart:math';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//TODO: Нужно доделать ошибку и заглушку
class KubsuAvatar extends StatelessWidget {
  const KubsuAvatar({required this.imagePath, this.size = 48, this.borderWidth, super.key});

  final String imagePath;

  ///double value which point, which rect size avatar will be use
  ///[size] == 15 the same as width == 15, height == 15
  final double size;

  ///You can set [borderWidth] use hard value, if you don't set value,
  ///then [borderWidth] will be calculate from 13% of minimal side
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        height: size,
        width: size,
        imageUrl: imagePath,
        placeholder: (context, _) {
          return SizedBox.square(
            dimension: size,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(1000)),
            ),
          );
        },
        imageBuilder:
            (context, imageProvider) => ConstrainedBox(
              constraints: BoxConstraints(maxHeight: size, maxWidth: size, minWidth: size, minHeight: size),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: DecoratedBox(
                      decoration: BoxDecoration(image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
                    ),
                  ),
                  ClipPath(
                    clipper: _RoundedBorderClipper(borderWidth),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                      child: const SizedBox.expand(),
                    ),
                  ),
                ],
              ),
            ),
        errorWidget:
            (context, error, _) => SizedBox.square(
              dimension: size,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(1000)),
              ),
            ),
      ),
    );
  }
}

final class _RoundedBorderClipper extends CustomClipper<Path> {
  _RoundedBorderClipper(this._borderWidth);

  final double? _borderWidth;

  @override
  Path getClip(Size size) {
    assert(size.height >= size.width || size.width >= size.width);
    final path = Path();
    final targetSide = min(size.height, size.width);
    final cornerRadius = Radius.circular(size.height);
    final outerRRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, size.width, size.height),
      topRight: cornerRadius,
      topLeft: cornerRadius,
      bottomLeft: cornerRadius,
      bottomRight: cornerRadius,
    );
    final borderWidth = _borderWidth ?? targetSide * 0.13;
    final padding = borderWidth / 2;
    final innerRRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(padding, padding, size.width - borderWidth, size.height - borderWidth),
      topRight: cornerRadius,
      topLeft: cornerRadius,
      bottomLeft: cornerRadius,
      bottomRight: cornerRadius,
    );

    path
      ..addRRect(outerRRect)
      ..addRRect(innerRRect)
      ..fillType = PathFillType.evenOdd
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<ui.Path> oldClipper) => false;
}
