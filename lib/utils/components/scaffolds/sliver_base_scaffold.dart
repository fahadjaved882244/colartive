import 'package:colartive2/core_packages.dart';

class SliverBaseScaffold extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Widget? header;
  final Widget sliver;
  final PreferredSizeWidget? bottom;

  const SliverBaseScaffold({
    Key? key,
    required this.sliver,
    this.title,
    this.header,
    this.titleWidget,
    this.centerTitle,
    this.actions,
    this.bottom,
  })  : assert(title != null || titleWidget != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: titleWidget ?? CustomText(title!),
            centerTitle: centerTitle,
            actions: actions,
            bottom: bottom,
          ),
          if (header != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(Paddings.sm),
                child: header,
              ),
            ),
          sliver,
        ],
      ),
    );
  }
}
