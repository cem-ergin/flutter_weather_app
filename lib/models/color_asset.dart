// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'color_asset.g.dart';

@JsonSerializable()
class ColorAsset {
  ColorAsset({required this.status, required this.divider, required this.background});
  factory ColorAsset.fromJson(Map<String, dynamic> json) => _$ColorAssetFromJson(json);

  final String status;
  final String divider;
  final String background;
}
