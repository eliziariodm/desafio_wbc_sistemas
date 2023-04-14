import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool isSearch;

  const UiTextFormField({
    Key? key,
    required this.label,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.isSearch = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.name,
      inputFormatters: inputFormatters,
      validator: validator,
      cursorColor: Theme.of(context).colorScheme.primary,
      style: Theme.of(context).textTheme.headlineSmall,
      decoration: InputDecoration(
        prefixIcon: isSearch
            ? Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.primary,
              )
            : null,
        errorStyle: const TextStyle(height: 0),
        contentPadding: const EdgeInsets.only(left: 10),
        label: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
      ),
    );
  }
}
