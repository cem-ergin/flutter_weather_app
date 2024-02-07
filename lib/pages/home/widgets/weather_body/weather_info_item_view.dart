import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherInfoItemView extends StatelessWidget {
  const WeatherInfoItemView({
    required this.assetName,
    required this.title,
    required this.description,
    super.key,
  });

  final String assetName;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(assetName, width: Theme.of(context).iconTheme.size),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(description),
          ),
        ),
      ],
    );
  }
}
