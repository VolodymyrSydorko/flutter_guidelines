import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextUrlLauncher extends StatelessWidget {
  const TextUrlLauncher({required  this.text,required this.url,
    Key? key,
  }) : super(key: key);
  final String url;
  final String text;
  void _launchURL(String url) async => {
        await canLaunch(url) ? await launch(url) : throw 'Could not launch $url'
      };
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(text,
            style: const TextStyle(fontSize: 12,color: Colors.white)),
      ),
    );
  }
}