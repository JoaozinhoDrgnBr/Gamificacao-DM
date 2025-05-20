import 'package:flutter/material.dart';
import '../../../../shared/constants/constants.dart';

class LoginTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;

  const LoginTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.labelText,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
  }) : super(key: key);

  @override
  State<LoginTextFormField> createState() => _LoginTextFormFieldState();
}

class _LoginTextFormFieldState extends State<LoginTextFormField> {
  bool _isHovered = false;
  bool _isFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  Color get borderColor {
    if (_isFocused) return AppColors.primary;
    if (_isHovered) return AppColors.primary.withOpacity(0.6);
    return AppColors.lightGrey;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.cardLight,
          border: Border.all(color: borderColor, width: 1.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          focusNode: _focusNode,
          controller: widget.controller,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autocorrect: false,
          enableSuggestions: false,
          onChanged: widget.onChanged,

          decoration: InputDecoration(
            icon: Container(child: Icon(widget.icon, color: AppColors.primary)),
            hintText: widget.hintText,
            labelText: widget.labelText,
            border: InputBorder.none,
            fillColor: AppColors.cardLight,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            errorStyle: const TextStyle(color: AppColors.error, fontSize: 14),
          ),
          validator: (value) {
            // Prioriza o validador customizado se existir
            if (widget.validator != null) {
              return widget.validator!(value);
            }
            return null;
          },
        ),
      ),
    );
  }
}
