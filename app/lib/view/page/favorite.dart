import 'package:app/constant/appcolor.dart';
import 'package:app/view/widgets/recommendeditem.dart';
import 'package:app/view/widgets/specialitem.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: AppColor.primary,
            expandedHeight: MediaQuery.of(context).size.height * 0.14,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomAppBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Content(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(left: 40, right: 40, bottom: 15),
        child: Text(
          'Favorit',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // RecommendedItem(),
                  SizedBox(
                    height: 20,
                  ),
                  ...List.generate(
                    10,
                    (index) => Column(children: [
                      SpecialItem(),
                      SizedBox(
                        height: 20,
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}
