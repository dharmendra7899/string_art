import 'package:flutter/material.dart';
import 'package:string_art/utils/app_text.dart';

class FancyCard extends StatelessWidget {
  const FancyCard({
    super.key,
    required this.image,
    required this.title,
  });

  final Image image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: ClipOval(child: image),
            ),
            appText(title: title, fontWeight: FontWeight.w500, fontSize: 16),
            OutlinedButton(
              child: const Text("Learn more"),
              onPressed: () => print("Button was tapped"),
            ),
          ],
        ),
      ),
    );
  }
}

class AwesomeInAppBanner {
  final String imgUrl;
  final String title;
  final Color color;

  const AwesomeInAppBanner(
      this.imgUrl,
      this.title,
      this.color,
      );
}

List<AwesomeInAppBanner> banners = <AwesomeInAppBanner>[
  AwesomeInAppBanner(
    'https://picsum.photos/id/123/1200/1800',
    'My awesome banner No.1',
    Colors.green.shade300,
  ),
  AwesomeInAppBanner(
    'https://picsum.photos/id/234/1200/1800',
    'My awesome banner No.2',
    Colors.red.shade300,
  ),
  AwesomeInAppBanner(
    'https://picsum.photos/id/345/1200/1800',
    'My awesome banner No.3',
    Colors.purple.shade300,
  ),
  AwesomeInAppBanner(
    'https://picsum.photos/id/456/1200/1800',
    'My awesome banner No.4',
    Colors.yellow.shade300,
  ),
  AwesomeInAppBanner(
    'https://picsum.photos/id/567/1200/1800',
    'My awesome banner No.5',
    Colors.blue.shade300,
  ),
  AwesomeInAppBanner(
    'https://picsum.photos/id/678/1200/1800',
    'My awesome banner No.6',
    Colors.orange.shade300,
  ),
];