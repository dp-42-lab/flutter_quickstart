import 'package:flutter/material.dart';
import 'package:flutter_quickstart/shared/components/general/svg_icon.enum.dart';
import 'package:flutter_quickstart/shared/theme/color.utils.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({super.key, required this.iconName, this.size, this.color});

  final SvgIconType iconName;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(maxHeight: size ?? 16, maxWidth: size ?? 16),
        width: size ?? 16,
        height: size ?? 16,
        child: SvgPicture.asset(
          'assets/icons/${iconName.icon}',
          width: Size.infinite.width,
          height: Size.infinite.height,
          colorFilter: ColorFilter.mode(color ?? context.primary, BlendMode.srcIn),
        ),
      ),
    );
  }
}
