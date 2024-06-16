import 'package:flutter/widgets.dart';
import 'package:tractian_app/app/core/app_spacing.dart';
import 'package:tractian_app/app/shared/widgets/tv_scaffold.dart';

class TvLayoutColumn extends StatelessWidget {
  final List<Widget> children;
  bool? usePadding = true;
  Color backgroundColor;

  TvLayoutColumn({
    super.key,
    this.children = const <Widget>[],
    this.usePadding = true,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TvScaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: usePadding! ? AppSpacing.defaultSmall : 0,
              right: usePadding! ? AppSpacing.defaultSmall : 0,
              bottom: usePadding! ? AppSpacing.defaultLarge : 0,
              top: usePadding! ? AppSpacing.defaultMedium : 0,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
