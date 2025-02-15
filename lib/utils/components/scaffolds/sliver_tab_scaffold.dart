import 'package:colartive2/extensions/context_x.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_image_view.dart';
import '../widgets/custom_loader.dart';

class SliverTabScaffold extends StatelessWidget {
  final String imagePath;
  final double expandedHeight;
  final Widget expandedWidget;
  final TabController tabController;
  final bool isScrollable;
  final List<Widget> tabs;
  final List<Widget> children;
  final Widget? floatingActionButton;
  final List<Widget>? actions;
  final bool isLoading;
  const SliverTabScaffold({
    Key? key,
    required this.imagePath,
    required this.expandedHeight,
    required this.expandedWidget,
    required this.tabController,
    required this.tabs,
    required this.children,
    this.floatingActionButton,
    this.isScrollable = false,
    this.isLoading = false,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double imageHeight = 230;
    if (isLoading) {
      return const CustomLoader();
    } else {
      return Scaffold(
        floatingActionButton: floatingActionButton,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: expandedHeight + imageHeight,
                elevation: 3,
                pinned: true,
                forceElevated: true,
                leading: IconButton.filledTonal(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
                actions: actions,
                flexibleSpace: FlexibleSpaceBar(
                  background: ListView(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      CustomImageView(
                        height: imageHeight,
                        imagePath: imagePath,
                      ),
                      expandedWidget,
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize:
                      const Size(double.maxFinite, AppSizes.tabHeight),
                  child: Container(
                    width: double.maxFinite,
                    color: context.colors.surface,
                    margin: const EdgeInsets.only(left: Paddings.xs),
                    child: TabBar(
                      controller: tabController,
                      indicatorWeight: 3,
                      isScrollable: isScrollable,
                      indicatorColor: context.colors.primary,
                      labelStyle: context.textTheme.titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                      tabs: tabs,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: children,
          ),
        ),
      );
    }
  }
}
