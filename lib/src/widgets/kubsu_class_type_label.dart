import 'package:flutter/material.dart';
import 'package:kubsu_design_system/kubsu_design_system.dart';

sealed class KubsuClassTypeLabel extends StatelessWidget {
  const KubsuClassTypeLabel._({super.key});

  const factory KubsuClassTypeLabel.lecture({Key? key}) = _LectureLabel;

  const factory KubsuClassTypeLabel.practice({Key? key}) = _PracticeLabel;

  const factory KubsuClassTypeLabel.seminar({Key? key}) = _SeminarLabel;

  const factory KubsuClassTypeLabel.laboratory({Key? key}) = _LaboratoryLabel;

  Widget buildChild(TextStyle style, Color color, String title) {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: color),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Center(child: Text(title, style: style)),
      ),
    );
  }
}

final class _LectureLabel extends KubsuClassTypeLabel {
  const _LectureLabel({super.key}) : super._();

  @override
  Widget build(BuildContext context) => buildChild(
    context.appTexts.small.copyWith(color: Colors.white),
    context.appColors.surfaceOnlineIndicator,
    'Лекция',
  );
}

final class _SeminarLabel extends KubsuClassTypeLabel {
  const _SeminarLabel({super.key}) : super._();

  @override
  Widget build(BuildContext context) =>
      buildChild(context.appTexts.small.copyWith(color: Colors.white), context.appColors.surfaceIndicator, 'Семинар');
}

final class _PracticeLabel extends KubsuClassTypeLabel {
  const _PracticeLabel({super.key}) : super._();

  @override
  Widget build(BuildContext context) => buildChild(
    context.appTexts.small.copyWith(color: Colors.white),
    context.appColors.textInputPrimaryPlaceholderError,
    'Практика',
  );
}

final class _LaboratoryLabel extends KubsuClassTypeLabel {
  const _LaboratoryLabel({super.key}) : super._();

  @override
  Widget build(BuildContext context) =>
      buildChild(context.appTexts.small.copyWith(color: Colors.white), context.appColors.surfaceAccent, 'Лабораторная');
}
