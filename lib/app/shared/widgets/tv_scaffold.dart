import 'package:flutter/material.dart';
import 'package:tractian_app/app/core/app_colors.dart';

class TvScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;

  const TvScaffold({
    super.key,
    required this.body,
    this.backgroundColor = AppColors.white0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: body,
    );
  }
}
