import 'package:app/constant/appcolor.dart';
import 'package:app/provider/menuprov.dart';
import 'package:app/provider/userprov.dart';
import 'package:app/view/widgets/recommendeditem.dart';
import 'package:app/view/widgets/specialitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeEx extends StatelessWidget {
  const HomeEx({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          Provider.of<MenuProvider>(context, listen: false).fetchFavoriteData(
              Provider.of<UserProvider>(context, listen: false).getToken),
          Provider.of<MenuProvider>(context, listen: false).fetchMenuData()
        ]),
        builder: (context, snapshot) {
          return Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: AppColor.primary),
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: false,
                    backgroundColor: AppColor.primary,
                    expandedHeight: MediaQuery.of(context).size.height * 0.22,
                    pinned: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: CustomAppBar(), //Images.network
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Content(),
                      childCount: 1,
                    ),
                  )
                ],
              )
            ],
          );
        });
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // alignment: Alignment.bottomCenter,
        // height: 18,
        color: AppColor.primary,
        padding: EdgeInsets.only(left: 40, right: 40, top: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // print('sscs');
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile.png"),
                    radius: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, Ciko!',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Mau makan apa hari ini?',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        size: 18,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Jember',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.formColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mie Ayam Wono...',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Icon(
                          Icons.search_rounded,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
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
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 10),
                    child: Text(
                      'Recommendation',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  // RecommendedItem(),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      itemBuilder: (context, index) => RecommendedItem(),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...menuProvider.list
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
            ),
          ],
        ),
      ],
    );
  }
}
