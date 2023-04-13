import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final void Function()? onTap;
  final TextOverflow? overflow;

  const ButtonWidget({
    super.key,
    required this.iconData,
    required this.text,
    this.onTap,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Wrap(
            runSpacing: 5,
            alignment: WrapAlignment.center,
            children: [
              Icon(iconData),
              Text(
                text,
                overflow: overflow ?? TextOverflow.clip,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
