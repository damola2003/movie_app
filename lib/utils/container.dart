import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  final String image;
  final String title;
  const ContainerBox({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber,
        ),
        child: Stack(
          children: [
            Text(title),
            Text(image),
          ],
        ),
      ),
    );
  }
}
