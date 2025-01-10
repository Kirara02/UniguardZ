import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uniguard_z/presentation/extensions/build_context_extension.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';

class UGTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool readOnly;
  final void Function(String)? onFieldSubmitted;

  const UGTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.readOnly = false,
    this.onFieldSubmitted,
  });

  @override
  State<UGTextField> createState() => _UGTextFieldState();
}

class _UGTextFieldState extends State<UGTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: colorScheme.outline),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        readOnly: widget.readOnly,
        style: textTheme.bodySmall!.copyWith(color: colorScheme.onSurface),
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        maxLines: 1,
        cursorColor: colorScheme.onSurface,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: textTheme.labelMedium!.copyWith(
            color: AppColors.hintText,
            fontWeight: FontWeight.w500,
          ),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: textTheme.bodySmall!.copyWith(
            color: colorScheme.tertiary,
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: SvgPicture.asset(
                    _obscureText
                        ? 'assets/icons/hide.svg'
                        : 'assets/icons/show.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  onPressed: _toggleObscureText,
                )
              : widget.suffixIcon,
        ),
      ),
    );
  }
}
