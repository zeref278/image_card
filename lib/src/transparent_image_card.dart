import 'package:flutter/material.dart';

import 'image_card_content.dart';

class TransparentImageCard extends StatelessWidget {
  const TransparentImageCard({
    Key? key,
    this.width,
    this.height,
    this.contentMarginTop,
    this.borderRadius = 6,
    this.contentPadding,
    required this.imageProvider,
    this.tags,
    this.title,
    this.description,
    this.footer,
    this.startColor,
    this.endColor,
    this.tagSpacing,
    this.tagRunSpacing,
  }) : super(key: key);

  /// card width
  final double? width;

  /// card height
  final double? height;

  /// padding from top of card to content
  final double? contentMarginTop;

  /// border radius value
  final double borderRadius;

  /// spacing between tag
  final double? tagSpacing;

  /// run spacing between line tag
  final double? tagRunSpacing;

  /// content padding
  final EdgeInsetsGeometry? contentPadding;

  /// image provider
  final ImageProvider imageProvider;

  /// list of widgets
  final List<Widget>? tags;

  /// color gradient start, default [0xff575757] with opacity 0
  final Color? startColor;

  /// color gradient end, default [0xff000000]
  final Color? endColor;

  /// widget title of card
  final Widget? title;

  /// widget description of card
  final Widget? description;

  /// widget footer of card
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final Widget content = ImageCardContent(
      contentPadding: contentPadding,
      tags: tags,
      title: title,
      footer: footer,
      description: description,
      tagSpacing: tagSpacing,
      tagRunSpacing: tagRunSpacing,
    );

    return _buildBody(content);
  }

  Widget _buildBody(Widget content) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: ShaderMask(
            shaderCallback: (bound) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  startColor ?? const Color(0xff575757).withOpacity(0),
                  endColor ?? const Color(0xff000000),
                ],
                //tileMode: TileMode.,
              ).createShader(bound);
            },
            blendMode: BlendMode.srcOver,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                //tileMode: TileMode.,
              ),
              padding: EdgeInsets.only(top: contentMarginTop ?? 100),
              child: content,
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Colors.transparent,
            ),
            padding: EdgeInsets.only(top: contentMarginTop ?? 100),
            child: content,
          ),
        ),
      ],
    );
  }

}
