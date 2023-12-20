import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key,
      required this.categoryName,
      required this.image,
      required this.onTap});
  final Function()? onTap;
  final String image;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            // height: ,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black38,
                width: 0.75,
              ),
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: SvgPicture.asset(image)),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          categoryName,
          style: const TextStyle(color: Colors.black38),
        ),
      ],
    );
  }
}
