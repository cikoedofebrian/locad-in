import 'package:app/constant/appcolor.dart';
import 'package:flutter/material.dart';

class CustomNav extends StatefulWidget {
  const CustomNav({super.key, required this.onItemTapped});

  final Function(int) onItemTapped;

  @override
  State<CustomNav> createState() => _CustomNavState();
}

class _CustomNavState extends State<CustomNav> {
  int _choosenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 2, color: Colors.black12, spreadRadius: 3)
      ]),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        InkWell(
          onTap: () {
            _choosenIndex = 0;
            widget.onItemTapped(0);
          },
          child: SizedBox(
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _choosenIndex == 0
                    ? Container(
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.primary,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 3)
                          ],
                        ),
                      )
                    : const SizedBox(height: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_rounded,
                      size: 30,
                      color:
                          _choosenIndex == 0 ? AppColor.primary : Colors.grey,
                    ),
                    Text(
                      'Beranda',
                      style: TextStyle(
                          fontSize: 12,
                          color: _choosenIndex == 0
                              ? AppColor.primary
                              : Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _choosenIndex = 1;
            widget.onItemTapped(1);
          },
          child: SizedBox(
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _choosenIndex == 1
                    ? Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 3)
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 5,
                      ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_outline_rounded,
                      size: 30,
                      color:
                          _choosenIndex == 1 ? AppColor.primary : Colors.grey,
                    ),
                    Text(
                      'Favorit',
                      style: TextStyle(
                          fontSize: 12,
                          color: _choosenIndex == 1
                              ? AppColor.primary
                              : Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _choosenIndex = 2;
            widget.onItemTapped(2);
          },
          child: SizedBox(
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _choosenIndex == 2
                    ? Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 3)
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 5,
                      ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.history_rounded,
                      size: 30,
                      color:
                          _choosenIndex == 2 ? AppColor.primary : Colors.grey,
                    ),
                    Text(
                      'Riwayat',
                      style: TextStyle(fontSize: 12, color: AppColor.primary),
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _choosenIndex = 3;
            widget.onItemTapped(3);
          },
          child: SizedBox(
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _choosenIndex == 3
                    ? Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 3)
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 5,
                      ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_box_outlined,
                      size: 30,
                      color:
                          _choosenIndex == 3 ? AppColor.primary : Colors.grey,
                    ),
                    Text(
                      'Usul',
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            _choosenIndex == 0 ? AppColor.primary : Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
        // Icon(
        //   Icons.favorite_outline_rounded,
        //   size: 30,
        //   color: Colors.grey,
        // ),
        // Icon(
        //   Icons.history_rounded,
        //   size: 30,
        //   color: Colors.grey,
        // ),
        // Icon(
        //   Icons.add_box_outlined,
        //   size: 30,
        //   color: Colors.grey,
        // ),
      ]),
    );
  }
}
