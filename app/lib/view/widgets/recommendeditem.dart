import 'package:flutter/material.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Container(
            height: 160,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.linkumkm.id/library/7/8/9/7/2/78972_840x576.jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            height: 160,
            width: 140,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Mie Gacoan Sumbersari Jember Yummy",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [
                  0.0,
                  0.4,
                  0.6,
                  1.0,
                ],
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}
