import 'package:flutter/material.dart';
import 'package:kubsu_design_system/kubsu_design_system.dart';

class KubsuSearchInput extends StatefulWidget {
  const KubsuSearchInput({super.key, this.onInit, this.hasError = false});

  final void Function(TextEditingController)? onInit;
  final bool hasError;

  @override
  State<KubsuSearchInput> createState() => _KubsuSearchInputState();
}

class _KubsuSearchInputState extends State<KubsuSearchInput> {
  final _controller = TextEditingController();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.onInit?.call(_controller);
    _controller.addListener(_controllerListener);
  }

  void _controllerListener() {
    if (_controller.text.isNotEmpty) {
      setState(() => _showClearButton = true);
    } else {
      setState(() => _showClearButton = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KubsuTextInput(
      controller: _controller,
      prefixIconColor: context.appColors.iconInputPrimary,
      prefixIconConstraints: const BoxConstraints(maxWidth: 40, maxHeight: 24),
      hintText: 'Поиск...',
      hasError: widget.hasError,
      maxLines: 1,
      suffixIconColor: widget.hasError ? context.appColors.iconInputPrimaryError : context.appColors.iconInputPrimary,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 16),
        child:
            _showClearButton
                ? GestureDetector(
                  onTap: _clearHandler,
                  child: Icon(
                    KubsuIcons.cross,
                    color:
                        widget.hasError ? context.appColors.iconInputPrimaryError : context.appColors.iconInputPrimary,
                  ),
                )
                : Icon(Icons.search),
      ),
    );
  }

  void _clearHandler() {
    _controller.clear();
    setState(() {
      setState(() => _showClearButton = false);
    });
  }
}
