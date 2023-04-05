import 'package:app/constant/appcolor.dart';
import 'package:app/view/page/favorite.dart';
import 'package:app/view/page/history.dart';
import 'package:app/view/page/homeex.dart';
import 'package:app/view/page/request.dart';
import 'package:app/view/widgets/custom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;

  List _pageOption = [HomeEx(), FavoritePage(), History(), RequestPage()];
  void _onItemTapped(int newValue) {
    setState(() {
      _selectedIndex = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          _pageOption[_selectedIndex],
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: CustomNav(onItemTapped: _onItemTapped),
          )
        ]));
  }
}

// Widget get bottomNavigationBar {
//   return Container(
//     height: 100,
//     decoration: BoxDecoration(color: Colors.white, boxShadow: [
//       BoxShadow(blurRadius: 2, color: Colors.black12, spreadRadius: 3)
//     ]),
//     padding: const EdgeInsets.symmetric(
//       horizontal: 20,
//     ),
//     child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//       InkWell(
//         child: SizedBox(
//           width: 70,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 height: 5,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black12, spreadRadius: 2, blurRadius: 3)
//                   ],
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.home_rounded,
//                     size: 30,
//                     color: Colors.red,
//                   ),
//                   Text(
//                     'Beranda',
//                     style: TextStyle(fontSize: 12, color: Colors.red),
//                   ),
//                 ],
//               ),
//               const SizedBox(),
//             ],
//           ),
//         ),
//       ),
//       Icon(
//         Icons.favorite_outline_rounded,
//         size: 30,
//         color: Colors.grey,
//       ),
//       Icon(
//         Icons.history_rounded,
//         size: 30,
//         color: Colors.grey,
//       ),
//       Icon(
//         Icons.add_box_outlined,
//         size: 30,
//         color: Colors.grey,
//       ),
//     ]),
//   );
// }
