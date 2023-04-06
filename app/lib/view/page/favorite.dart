import 'package:app/constant/appcolor.dart';
import 'package:app/provider/menuprov.dart';
import 'package:app/provider/userprov.dart';
import 'package:app/view/widgets/recommendeditem.dart';
import 'package:app/view/widgets/specialitem.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.5,
          color: AppColor.primary),
      CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
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
    ]);
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
    final menuProvider = Provider.of<MenuProvider>(context);
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

                  ...menuProvider.favoriteList
                      .map(
                        (e) => Column(
                          children: [
                            SpecialItem(
                              title: e.namaMenu,
                              location: e.deskripsi,
                              imageUrl: e.thumbnail,
                              id: e.id.toString(),
                              isFavorite:
                                  menuProvider.isFavorite(e.id.toString()),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      )
                      .toList(),
                  SizedBox(
                    height: 100,
                  ),
                  if (menuProvider.favoriteList.isEmpty)
                    Container(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.hourglass_empty_rounded,
                            size: 80,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "You don't have any favorite restaurant yet!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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
