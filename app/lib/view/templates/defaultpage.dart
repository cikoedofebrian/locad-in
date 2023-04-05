import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key, required this.child, required this.isPop});

  final Column child;
  final bool isPop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    child: Container(
                      color: Colors.red,
                      height: 150,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  if (isPop)
                    Positioned(
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.navigate_before_rounded,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                      bottom: 60,
                      left: 15,
                    )
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  color: Colors.white,
                  child: child,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
