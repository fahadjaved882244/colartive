import '../../../../../core_packages.dart';
import 'beacon_painter.dart';

const List<NavigationItem> navItems = [
  NavigationItem(0, Icons.home_outlined, AppStrings.home),
  NavigationItem(1, Icons.search_outlined, AppStrings.search),
  NavigationItem(2, Icons.dashboard_outlined, AppStrings.showCase),
  NavigationItem(3, Icons.account_circle_outlined, AppStrings.profile),
];

class NavigationItem {
  final int id;
  final IconData icon;
  final String title;
  final Color color;
  const NavigationItem(this.id, this.icon, this.title,
      {this.color = AppColors.primary});
}

class CustomNavigationItem extends StatefulWidget {
  final NavigationItem item;
  final int selectedIndex;
  final Function(int) onTap;
  final bool extended;
  const CustomNavigationItem({
    super.key,
    required this.item,
    required this.selectedIndex,
    required this.onTap,
    this.extended = false,
  });

  @override
  State<CustomNavigationItem> createState() => _CustomNavigationItemState();
}

class _CustomNavigationItemState extends State<CustomNavigationItem>
    with SingleTickerProviderStateMixin {
  double beaconRadius = 1;
  double maxBeaconRadius = 24;
  double iconScale = 1;
  late AnimationController controller;
  late Animation<double> curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: AppTimes.sl, vsync: this);
    curve = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear))
      ..addListener(() {
        setState(() {
          beaconRadius = maxBeaconRadius * curve.value;
          if (beaconRadius == maxBeaconRadius) {
            beaconRadius = 1;
            controller.reset();
          }
          if (curve.value == 0) {
            iconScale = 1;
          } else if (curve.value <= 0.5) {
            iconScale = 1.3 + curve.value;
          } else {
            iconScale = 1.8 - curve.value + (curve.value * 0.2);
          }
        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inActiveColor = context.colors.onSurfaceVariant;
    final isSelected = widget.selectedIndex == widget.item.id;
    if (widget.extended) {
      return _HortNavItem(
        item: widget.item,
        beaconRadius: beaconRadius,
        isSelected: isSelected,
        maxBeaconRadius: maxBeaconRadius,
        iconScale: iconScale,
        inActiveColor: inActiveColor,
        curve: curve,
        onTap: (i) {
          widget.onTap(i);
          controller.forward();
        },
      );
    } else {
      return _VertNavItem(
        item: widget.item,
        beaconRadius: beaconRadius,
        isSelected: isSelected,
        maxBeaconRadius: maxBeaconRadius,
        iconScale: iconScale,
        inActiveColor: inActiveColor,
        curve: curve,
        onTap: (i) {
          widget.onTap(i);
          controller.forward();
        },
      );
    }
  }
}

class _HortNavItem extends StatelessWidget {
  const _HortNavItem({
    required this.item,
    required this.beaconRadius,
    required this.isSelected,
    required this.maxBeaconRadius,
    required this.iconScale,
    required this.inActiveColor,
    required this.curve,
    required this.onTap,
  });

  final NavigationItem item;
  final double beaconRadius;
  final bool isSelected;
  final double maxBeaconRadius;
  final double iconScale;
  final Color inActiveColor;
  final Animation<double> curve;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(8, 4, 16, 4),
        dense: true,
        onTap: () {
          if (!isSelected) {
            onTap(item.id);
          }
        },
        leading: _BeaconIcon(
          item: item,
          beaconRadius: beaconRadius,
          isSelected: isSelected,
          maxBeaconRadius: maxBeaconRadius,
          iconScale: iconScale,
          inActiveColor: inActiveColor,
          curve: curve,
        ),
        title: CustomText(
          item.title,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: context.textTheme.bodyLarge!.copyWith(
            color: Color.lerp(
              isSelected ? item.color : inActiveColor.withOpacity(0.7),
              inActiveColor.withOpacity(0.7),
              curve.value,
            ),
            fontFamily: "SummerPixel",
          ),
        ),
      ),
    );
  }
}

class _VertNavItem extends StatelessWidget {
  const _VertNavItem({
    required this.item,
    required this.beaconRadius,
    required this.isSelected,
    required this.maxBeaconRadius,
    required this.iconScale,
    required this.inActiveColor,
    required this.curve,
    required this.onTap,
  });

  final NavigationItem item;
  final double beaconRadius;
  final bool isSelected;
  final double maxBeaconRadius;
  final double iconScale;
  final Color inActiveColor;
  final Animation<double> curve;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isSelected) {
          onTap(item.id);
        }
      },
      child: Column(
        children: [
          _BeaconIcon(
            item: item,
            beaconRadius: beaconRadius,
            isSelected: isSelected,
            maxBeaconRadius: maxBeaconRadius,
            iconScale: iconScale,
            inActiveColor: inActiveColor,
            curve: curve,
          ),
          if (isSelected)
            CustomText(
              item.title,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: context.textTheme.labelSmall!.copyWith(
                color: Color.lerp(
                  isSelected ? item.color : inActiveColor.withOpacity(0.7),
                  inActiveColor.withOpacity(0.7),
                  curve.value,
                ),
                fontFamily: "SummerPixel",
              ),
            )
        ],
      ),
    );
  }
}

class _BeaconIcon extends StatelessWidget {
  const _BeaconIcon({
    required this.item,
    required this.beaconRadius,
    required this.isSelected,
    required this.maxBeaconRadius,
    required this.iconScale,
    required this.inActiveColor,
    required this.curve,
  });

  final NavigationItem item;
  final double beaconRadius;
  final bool isSelected;
  final double maxBeaconRadius;
  final double iconScale;
  final Color inActiveColor;
  final Animation<double> curve;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: CustomPaint(
        painter: BeaconPainter(
          beaconRadius,
          isSelected ? maxBeaconRadius : 0,
          item.color,
          isActive: isSelected,
          offset: const Offset(18, 18),
          bgColor: context.colors.surface,
        ),
        child: Transform.scale(
          scale: isSelected ? iconScale : 1,
          child: Icon(
            item.icon,
            size: 28,
            color: Color.lerp(
              isSelected ? item.color : inActiveColor.withOpacity(0.7),
              inActiveColor.withOpacity(0.7),
              curve.value,
            ),
          ),
        ),
      ),
    );
  }
}
