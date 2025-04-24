import 'package:flutter/material.dart';
import 'package:kubsu_design_system/kubsu_design_system.dart';

class KubsuClassTile extends StatelessWidget {
  const KubsuClassTile({
    super.key,
    required this.className,
    required this.classRoom,
    required this.time,
    this.classTypeLabel,
    this.personalOrGroupChips,
    this.classNumber = 1,
  });

  final String className, time, classRoom;
  final Widget? classTypeLabel;
  final List<Widget>? personalOrGroupChips;
  final int classNumber;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.appColors.surfacePrimary,
        border: Border.all(width: 1, color: context.appColors.borderPrimary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (classTypeLabel case Widget label) label,
                    DecoratedBox(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Color(0xFF373E4E)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        child: Center(
                          child: Text('$classNumber пара', style: context.appTexts.small.copyWith(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(className, style: context.appTexts.body),
                const SizedBox(height: 8),
                Row(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(KubsuIcons.timer_1, size: 12, color: context.appColors.textTertiary),
                    Text(time, style: context.appTexts.small.copyWith(color: context.appColors.textTertiary)),
                  ],
                ),
                const SizedBox(height: 8),
                if (personalOrGroupChips != null)
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    runSpacing: 4,
                    children: [...personalOrGroupChips!, SizedBox(width: 70, height: 30)],
                  ),
              ],
            ),
            Positioned(bottom: 4, right: 0, child: _ClassRoomLabel(classRoom)),
          ],
        ),
      ),
    );
  }
}

class PersonalOrGroupChip extends StatelessWidget {
  const PersonalOrGroupChip({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Color(0xFFF5F8FF)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Icon(Icons.people_alt, color: context.appColors.textSecondaryAccent, size: 12),
            Text(title, style: context.appTexts.small.copyWith(color: context.appColors.textSecondaryAccent)),
          ],
        ),
      ),
    );
  }
}

class _ClassRoomLabel extends StatelessWidget {
  const _ClassRoomLabel(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Icon(Icons.location_on_rounded, color: context.appColors.surfaceAccent, size: 16),
        Text(title, style: context.appTexts.small.copyWith(color: context.appColors.surfaceAccent)),
      ],
    );
  }
}
