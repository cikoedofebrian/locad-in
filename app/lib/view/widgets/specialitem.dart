import 'package:app/provider/menuprov.dart';
import 'package:app/provider/userprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecialItem extends StatelessWidget {
  const SpecialItem(
      {super.key,
      required this.id,
      required this.title,
      required this.location,
      required this.imageUrl,
      required this.isFavorite});

  final String id;
  final String title;
  final String location;
  final String imageUrl;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserProvider>(context, listen: false).getToken;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: InkWell(
                    onTap: () {
                      print("tested");
                      Provider.of<MenuProvider>(context, listen: false)
                          .addToFavorite(token, id);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite == false ? Colors.grey : Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title.toUpperCase(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              '4.4',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            width: 15,
                            // height: 30,
                            child: Icon(
                              Icons.star_rate_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                  Text(
                    location,
                    style: TextStyle(
                        fontSize: 12,
                        // fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 10,
                        child: Icon(
                          Icons.attach_money_rounded,
                          size: 20,
                        ),
                      ),
                      ...List.generate(
                        4,
                        (index) => Container(
                          width: 10,
                          child: Icon(
                            Icons.attach_money,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ])),
    );
  }
}
