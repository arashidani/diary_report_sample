import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;

  const CustomAvatar({super.key, required this.imageUrl, this.radius = 30});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      // URLがnullまたは空ならデフォルト表示
      return _defaultAvatar();
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: radius,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => CircleAvatar(
        radius: radius,
        child: const CircularProgressIndicator(strokeWidth: 2),
      ),
      errorWidget: (context, url, error) => _defaultAvatar(),
    );
  }

  Widget _defaultAvatar() {
    return CircleAvatar(
      radius: radius,
      child: const Icon(Icons.person),
    );
  }
}
