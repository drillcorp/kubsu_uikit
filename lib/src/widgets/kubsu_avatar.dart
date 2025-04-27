import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//TODO: Нужно доделать ошибку и заглушку
class KubsuAvatar extends StatelessWidget {
  const KubsuAvatar({required this.path, this.size = 48, super.key});

  final String path;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: size,
      width: size,
      imageUrl: path,
      placeholder: (context, _) {
        return SizedBox.square(
          dimension: size,
          child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(1000))),
        );
      },
      imageBuilder:
          (context, imageProvider) => SizedBox.square(
            dimension: size,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: DecoratedBox(
                    decoration: BoxDecoration(image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
                  ),
                ),
                ClipPath(
                  clipper: _RoundedBorderClipper(),
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
    );
  }
}

final class _RoundedBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final outerRect = Rect.fromCircle(center: Offset(size.height / 2, size.width / 2), radius: size.height / 2);
    final innerRect = Rect.fromCircle(center: Offset(size.height / 2, size.width / 2), radius: size.height / 2.3);

    path
      ..addOval(outerRect)
      ..addOval(innerRect)
      ..fillType = PathFillType.evenOdd
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<ui.Path> oldClipper) => false;
}
