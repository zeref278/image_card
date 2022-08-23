import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

class ImageCardDemoPage extends StatelessWidget {
  const ImageCardDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text('Image card demo'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FillImageCard(
                      width: 200,
                      heightImage: 140,
                      imageProvider: AssetImage('assets/mockup.png'),
                      tags: [_tag('Category', () {}), _tag('Product', () {})],
                      title: _title(),
                      description: _content(),
                    ),
                    const SizedBox(width: 12),
                    FillImageCard(
                      width: 200,
                      heightImage: 140,
                      imageProvider: AssetImage('assets/mockup.png'),
                      tags: [_tag('Category', () {}), _tag('Product', () {})],
                      title: _title(),
                      description: _content(),
                    ),
                    const SizedBox(width: 12),
                    FillImageCard(
                      width: 200,
                      heightImage: 140,
                      imageProvider: AssetImage('assets/mockup.png'),
                      description: _content(),
                    ),
                    const SizedBox(width: 12),
                    FillImageCard(
                      width: 200,
                      heightImage: 140,
                      imageProvider: AssetImage('assets/mockup.png'),
                      tags: [_tag('Category', () {})],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FillImageCard(
                      width: 200,
                      heightImage: 140,
                      imageProvider: AssetImage('assets/mockup.png'),
                      tags: [_tag('Category', () {})],
                      title: _title(),
                      description: _content(),
                      footer: _footer(),
                    ),
                    const SizedBox(width: 12),
                    FillImageCard(
                      width: 200,
                      heightImage: 140,
                      imageProvider: AssetImage('assets/mockup.png'),
                      tags: [_tag('Category', () {})],
                      title: _title(),
                      description: _content(),
                      footer: _footer(),
                    ),
                    const SizedBox(width: 12),
                    FillImageCard(
                      width: 200,
                      heightImage: 140,
                      imageProvider: AssetImage('assets/mockup.png'),
                      tags: [
                        _tag('Category', () {}),
                        _tag('Product', () {})
                      ],
                      footer: _footer(),
                    ),
                    const SizedBox(width: 12),
                    FillImageCard(
                      width: 200,
                      heightImage: 140,
                      imageProvider: AssetImage('assets/mockup.png'),
                      footer: _footer(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TransparentImageCard(
                      width: 200,
                      imageProvider: AssetImage('assets/mockup.png'),
                      tags: [
                        _tag('Product', () {}),
                      ],
                      title: _title(color: Colors.white),
                      description: _content(color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    TransparentImageCard(
                      width: 200,
                      imageProvider: AssetImage('assets/mockup.png'),
                      tags: [
                        _tag('Product', () {}),
                        _tag('Gift', () {}),
                      ],
                      title: _title(color: Colors.white),
                      description: _content(color: Colors.white),
                      footer: _footer(color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    TransparentImageCard(
                      width: 200,
                      imageProvider: AssetImage('assets/mockup.png'),
                      tags: [
                        _tag('Product', () {}),
                        _tag('Gift', () {}),
                        _tag('Category', () {}),
                      ],
                      footer: _footer(color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    TransparentImageCard(
                      width: 200,
                      imageProvider: AssetImage('assets/mockup.png'),
                      title: _title(color: Colors.white),
                      description: _content(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          )
        ),
      ),
    );
  }


  Widget _title({Color? color}) {
    return Text(
      'Card title',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color),
    );
  }
  

  Widget _content({Color? color}) {
    return Text(
      'This a card description',
      style: TextStyle(color: color),
    );
  }

  Widget _footer({Color? color}) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            'assets/avatar.png',
          ),
          radius: 12,
        ),
        const SizedBox(width: 4,),
        Expanded(
            child: Text(
              'Super user',
              style: TextStyle(color: color),
            )),
        IconButton(onPressed: () {}, icon: Icon(Icons.share))
      ],
    );
  }

  Widget _tag(String tag, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.green),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          tag,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
