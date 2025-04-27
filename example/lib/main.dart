import 'package:flutter/material.dart';
import 'package:kubsu_design_system/kubsu_design_system.dart';

void main() => runApp(ThemeScope(theme: LightTheme(), child: Example()));

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colors.surfacePrimary,
        appBar: AppBar(
          title: Text('KubSu UIKit'),
          backgroundColor: colors.surfacePrimary,
          surfaceTintColor: colors.surfacePrimary,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 20,
            children: [
              const KubsuLoader(),
              KubsuButton(title: 'Button', delegate: PrimaryDelegate(context: context, onTap: () {})),
              KubsuButton(
                title: 'Button',
                icon: Icon(KubsuIcons.trash, color: colors.textButtonPrimary),
                delegate: PrimaryDelegate(context: context),
              ),
              KubsuButton(title: 'Button', delegate: SecondaryDelegate(context: context, onTap: () {})),
              KubsuButton(
                title: 'Button',
                icon: Icon(KubsuIcons.trash, color: colors.textButtonSecondaryDisabled),
                delegate: SecondaryDelegate(context: context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KubsuIconButton(
                    delegate: DefaultDelegate(context: context, onTap: () {}),
                    icon: KubsuIcons.crossSmall,
                  ),
                  KubsuIconButton(
                    delegate: PrimaryDelegate(context: context, onTap: () {}),
                    icon: KubsuIcons.crossSmall,
                  ),
                  KubsuIconButton(
                    delegate: SecondaryDelegate(context: context, onTap: () {}),
                    icon: KubsuIcons.crossSmall,
                  ),
                  KubsuIconButton(delegate: ErrorDelegate(context: context, onTap: () {}), icon: KubsuIcons.crossSmall),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KubsuIconButton(
                    shape: BoxShape.rectangle,
                    delegate: DefaultDelegate(context: context, onTap: () {}),
                    icon: KubsuIcons.crossSmall,
                  ),
                  KubsuIconButton(
                    shape: BoxShape.rectangle,
                    delegate: PrimaryDelegate(context: context, onTap: () {}),
                    icon: KubsuIcons.crossSmall,
                  ),
                  KubsuIconButton(
                    shape: BoxShape.rectangle,
                    delegate: SecondaryDelegate(context: context, onTap: () {}),
                    icon: KubsuIcons.crossSmall,
                  ),
                  KubsuIconButton(
                    shape: BoxShape.rectangle,
                    delegate: ErrorDelegate(context: context, onTap: () {}),
                    icon: KubsuIcons.crossSmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  KubsuCheckBox(value: true, size: 50, onChange: (value) {}),
                  KubsuCheckBox(value: true, onChange: (value) {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KubsuSwitcher(value: false, onChange: (value) {}),
                  KubsuSwitcher(value: true, onChange: (value) {}),
                ],
              ),
              KubsuSearchInput(hasError: true, onInit: (controller) {}),
              KubsuSearchInput(onInit: (controller) {}, readOnly: true),
              const KubsuTextInput(hasError: true, hintText: 'Описание'),
              const KubsuTextInput(hintText: 'Описание'),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  KubsuClassTypeLabel.lecture(),
                  KubsuClassTypeLabel.practice(),
                  KubsuClassTypeLabel.seminar(),
                  KubsuClassTypeLabel.laboratory(),
                ],
              ),
              for (final (i, item)
                  in [
                    'Математический анализ и линейная алгебра',
                    'Английский язык',
                    'Программирования на C++',
                    'Основы баз данных',
                  ].indexed)
                KubsuClassTile(
                  classNumber: i + 1,
                  className: item,
                  classRoom: '300С',
                  classTypeLabel: switch (i + 1) {
                    1 => const KubsuClassTypeLabel.lecture(),
                    2 => const KubsuClassTypeLabel.seminar(),
                    3 => const KubsuClassTypeLabel.laboratory(),
                    4 => const KubsuClassTypeLabel.practice(),
                    _ => throw UnimplementedError(),
                  },
                  time: '8:30 - 10:00',
                  personalOrGroupChips: const [PersonalOrGroupChip(title: 'Лежнев В.В')],
                ),
              KubsuUserCard(name: 'Name Name', faculty: 'Faculty', imagePath: '', isTeacher: true, onTap: () {}),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
