import 'package:flutter/material.dart';
import 'package:kubsu_design_system/kubsu_design_system.dart';

class KubsuUserCard extends StatelessWidget {
  const KubsuUserCard({
    required this.name,
    required this.faculty,
    required this.imagePath,
    this.isTeacher = false,
    this.width = 300,
    this.onTap,
    super.key,
  });

  final String name, faculty, imagePath;
  final VoidCallback? onTap;
  final double width;
  final bool isTeacher;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: width,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: context.appColors.surfacePrimary,
              border: Border.all(color: context.appColors.borderPrimary),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  KubsuAvatar(path: imagePath),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(name, style: context.appTexts.body),
                            if (isTeacher)
                              SizedBox.square(
                                dimension: 20,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: context.appColors.surfaceAccent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(KubsuIcons.teacher, color: context.appColors.surfacePrimary, size: 12),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Text(
                          faculty,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.appTexts.small.copyWith(color: context.appColors.textTertiary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
