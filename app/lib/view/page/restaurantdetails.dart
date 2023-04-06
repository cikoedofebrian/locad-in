import 'package:app/constant/appcolor.dart';
import 'package:flutter/material.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({super.key});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          color: AppColor.primary,
        ),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              automaticallyImplyLeading: false,
              backgroundColor: AppColor.primary,
              expandedHeight: MediaQuery.of(context).size.height * 0.1,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(background: CustomAppBar()),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Content(),
                childCount: 1,
              ),
            )
          ],
        ),
      ]),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isFavorite = false;

  void favorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // width: 60,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.navigate_before_rounded,
                size: 70,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () => favorite(),
                child: Icon(
                  !isFavorite
                      ? Icons.favorite_border_rounded
                      : Icons.favorite_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.share_rounded,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
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
              padding: EdgeInsets.symmetric(horizontal: 50),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Mie Gacoan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // RecommendedItem(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://cdn.linkumkm.id/library/7/8/9/7/2/78972_840x576.jpeg"),
                            fit: BoxFit.cover)),
                    height: 220,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                        child: Icon(
                          Icons.star_rate_rounded,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          '4.3',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text("Lihat semua ulasan (2)"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 30,
                          child: Icon(
                            Icons.chat_rounded,
                            size: 20,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text("Diskusi(2)"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                        child: Icon(
                          Icons.watch_later_outlined,
                          size: 24,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Buka',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text("09:00 - 23:00"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 30, child: Icon(Icons.location_on_rounded)),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                            "Jl. Mastrip No.6-21, Krajan Barat, Sumbersari, Kec. Sumbersari, Kabupaten Jember"),
                      )
                    ],
                  ),
                  // ...List.generate(
                  //   10,
                  //   (index) => Column(children: [
                  //     SizedBox(
                  //       height: 20,
                  //     )
                  //   ]),
                  // ),
                  // SizedBox(
                  //   height: 100,
                  // ),
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
