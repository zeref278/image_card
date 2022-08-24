import 'package:flutter/material.dart';

class ImageCardContent extends StatelessWidget {
  const ImageCardContent({
    Key? key,
    this.contentPadding,
    this.tags,
    this.title,
    this.description,
    this.footer,
    this.tagSpacing,
    this.tagRunSpacing,
  }) : super(key: key);

  final EdgeInsetsGeometry? contentPadding;
  final List<Widget>? tags;
  final double? tagSpacing;
  final double? tagRunSpacing;

  final Widget? title;
  final Widget? description;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding ??
          const EdgeInsets.only(top: 8, bottom: 12, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tags != null)
            Wrap(
              spacing: tagSpacing ?? 12,
              runSpacing: tagRunSpacing ?? 10,
              children: tags!,
            ),
          if (title != null || description != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) title!,
                  if (title != null && description != null)
                    const SizedBox(
                      height: 2,
                    ),
                  if (description != null) description!,
                ],
              ),
            ),
          if (footer != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: footer!,
            ),
        ],
      ),
    );
  }
}
