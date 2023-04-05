import 'package:flutter/material.dart';

class SpecialItem extends StatelessWidget {
  const SpecialItem({super.key});

  @override
  Widget build(BuildContext context) {
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
                        image: NetworkImage(
                            "https://cdn.linkumkm.id/library/7/8/9/7/2/78972_840x576.jpeg"),
                        fit: BoxFit.cover),
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
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
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
                        'Mie Gacoan',
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
                    'Mastrip, Jember',
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
