import 'package:coolmovies/presentation/widgets/generic_error_widget.dart';
import 'package:coolmovies/presentation/widgets/generic_loading_widget.dart';
import 'package:flutter/material.dart';

class CardImage extends StatefulWidget {
  final String imageUrl;
  final String placeholder;
  final VoidCallback? onTap;

  const CardImage({
    super.key,
    required this.imageUrl,
    required this.placeholder,
    this.onTap,
  });

  @override
  State<CardImage> createState() => _ImageCardState();
}

class _ImageCardState extends State<CardImage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: widget.onTap,
      child: AspectRatio(
        aspectRatio: 11 / 16,
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: <Widget>[
              Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => GenericErrorWidget(
                  message: widget.placeholder,
                  icon: Icons.image,
                ),
                loadingBuilder: (_, child, loader) =>
                loader != null ? const GenericLoadingWidget() : child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
