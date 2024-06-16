import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tractian_app/app/core/app_fonts.dart';

class FilterFieldWidget extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String label;
  final Color selectedColor;
  bool isSelected;
  FilterFieldWidget(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.label,
      required this.selectedColor,
      this.isSelected = false});

  @override
  State<FilterFieldWidget> createState() => _FilterFieldWidgetState();
}

class _FilterFieldWidgetState extends State<FilterFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: !widget.isSelected ? Colors.grey : widget.selectedColor, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  widget.icon,
                  size: 16,
                  color: !widget.isSelected ? Colors.grey : widget.selectedColor,
                ),
              ),
              Text(
                widget.label,
                style: AppFonts.p_bold.merge(TextStyle(color: !widget.isSelected ? Colors.grey : widget.selectedColor)),
              )
            ],
          ),
        ),
      );
    });
  }
}
