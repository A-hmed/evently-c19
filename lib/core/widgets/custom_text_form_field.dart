import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final String hintText;
  final String? lableText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final bool isPassword;
  final int maxLines;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.validator,
    required this.hintText,
    this.lableText,
    this.suffixIcon,
    this.prefixIcon,
    this.isPassword = false,
    this.maxLines = 1,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isShowPaasowrd = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      enableSuggestions: true,
      controller: widget.controller,
      cursorRadius: Radius.circular(16),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: isShowPaasowrd,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      maxLines: widget.maxLines,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.lableText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: !widget.isPassword
            ? widget.suffixIcon
            : IconButton(
                onPressed: () {
                  setState(() {
                    isShowPaasowrd = !isShowPaasowrd;
                  });
                },
                icon: Icon(
                  isShowPaasowrd
                      ? IconsaxPlusLinear.eye_slash
                      : IconsaxPlusLinear.eye,
                ),
              ),
      ),
    );
  }
}
