
import "package:flutter/material.dart";

import 'colors.dart';
import 'drawerMenu.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  double transformX = 0.0;
  double transformY = 0.0;
  double transformZ = 0;
  double transformScale = 1;
  bool toggle = false;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState

    _animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        DrawerMenu(),
        AnimatedContainer(
          transform: Matrix4.translationValues(transformX, transformY, 0)
            ..scale(transformScale),
          duration: Duration(milliseconds: 800),
          child: ClipRRect(
            // ignore: dead_code
            borderRadius:
                (toggle) ? BorderRadius.circular(20) : BorderRadius.circular(0),
            child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      color: Colors.black,
                      progress: _animationController,
                    ),
                    // Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      toggle == false ? splashScreen() : splashScreen2();
                      toggle = !toggle;
                      // setState(() {
                      //   toggle = !toggle;
                      //   print("toggle-->## $toggle");

                      //   if (toggle == false) {
                      //     toggle = true;
                      //     transformX = 200;
                      //     transformY = 80;
                      //     transformScale = 0.8;
                      //     _animationController.forward();
                      //     // print("toggle--> $toggle");
                      //     // print("transformX $transformX");
                      //     // print("transformY $transformY");
                      //     // print("transformScale $transformScale");
                      //   } else {
                      //     toggle = false;
                      //     transformX = 0.0;
                      //     transformY = 0.0;
                      //     transformScale = 1;
                      //     _animationController.reverse();
                      //     // print("toggle--> - $toggle");
                      //     // print("transformX - $transformX");
                      //     // print("transformY - $transformY");
                      //     // print("transformScale - $transformScale");
                      //   }
                      // });
                    },
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery to",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: Colors.blue),
                      ),
                      InkWell(
                        onTap: () {
                          print("clicked");
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Location Update",
                              // style: TextStyle(fontSize: 12, color: Colors.black12),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.black, fontSize: 15),
                            ),
                            const Icon(Icons.keyboard_arrow_down_outlined,
                                color: primaryColor)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {},
                                  child: Container(
                                    // margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 35,
                                    child: Row(
                                      children: const [
                                        Icon(Icons.search),
                                        Text("search here"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    print("filter clicked");
                                  },
                                  icon: const Icon(Icons.filter))
                            ],
                          ),
                        ),
                        title_wid(context, "Category"),
                        Category_wid(),
                        title_wid(context, "Popular"),
                        SizedBox(
                          height: 10,
                          width: screen_width,
                        ),
                        Popular_wid(),
                        // for (int i = 0; i < food_list.length; i++) ...{
                        //   Container(
                        //     // height: screen_height / 2,
                        //     child: ListView.builder(
                        //         shrinkWrap: true,
                        //         scrollDirection: Axis.vertical,
                        //         // physics: NeverScrollableScrollPhysics(),
                        //         itemCount: food_list.length,
                        //         itemBuilder: (context, index) {
                        //           return Column(
                        //             children: [
                        //               Padding(
                        //                 padding: const EdgeInsets.all(8.0),
                        //                 child: Container(
                        //                   margin: EdgeInsets.symmetric(
                        //                       horizontal: 2, vertical: 10),
                        //                   height: 250,
                        //                   width: screen_width,
                        //                   decoration: BoxDecoration(
                        //                       color: Colors.white,
                        //                       borderRadius: BorderRadius.circular(10),
                        //                       boxShadow: [
                        //                         BoxShadow(
                        //                           color: Colors.black12,
                        //                           blurRadius: 2,
                        //                           spreadRadius: 3,
                        //                         )
                        //                       ]),
                        //                   child: Column(
                        //                     children: [
                        //                       Column(
                        //                         crossAxisAlignment:
                        //                             CrossAxisAlignment.start,
                        //                         children: [
                        //                           Container(
                        //                             height: 200,
                        //                             decoration: BoxDecoration(
                        //                               borderRadius: BorderRadius.only(
                        //                                   topLeft: Radius.circular(10),
                        //                                   topRight: Radius.circular(10)),
                        //                               image: DecorationImage(
                        //                                 image: NetworkImage(
                        //                                     food_list[i].image_url),
                        //                                 fit: BoxFit.cover,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           Padding(
                        //                             padding: const EdgeInsets.all(5),
                        //                             child: Text(
                        //                               "Food name",
                        //                               style: Theme.of(context)
                        //                                   .textTheme
                        //                                   .subtitle1
                        //                                   ?.copyWith(
                        //                                       color: Colors.black87),
                        //                             ),
                        //                           ),
                        //                           Padding(
                        //                             padding: const EdgeInsets.symmetric(
                        //                                 horizontal: 5),
                        //                             child: Row(
                        //                               children: [
                        //                                 Text("Star"),
                        //                                 Text("4.5 (128 Rating)"),
                        //                                 Spacer(),
                        //                                 Text("cafe western food \$" +
                        //                                     "${food_list[i].price}")
                        //                               ],
                        //                             ),
                        //                           )
                        //                         ],
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           );
                        //         }),
                        //   )
                        // }
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Padding title_wid(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Colors.black87, fontSize: 18),
      ),
    );
  }

  splashScreen() {
    // return Text(
    //   "SHOW SPLASH SCREEN",
    //   style: TextStyle(fontSize: 50, color: Colors.red),
    // );
    setState(() {
      print("true");
      transformX = 200;
      transformY = 80;
      transformScale = 0.8;
      _animationController.forward();
    });
  }

  splashScreen2() {
    // return Text(
    //   "SHOW SPLASH SCREEN",
    //   style: TextStyle(fontSize: 50, color: Colors.red),
    // );
    setState(() {
      print("false");
      transformX = 0.0;
      transformY = 0.0;
      transformScale = 1;
      _animationController.reverse();
    });
  }
}

class Category_wid extends StatelessWidget {
  const Category_wid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: cat_list.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        cat_list[index].image_url,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Image.asset(
                  //   cat_list[index].image_url,
                  //   height: 50,
                  //   width: 50,
                  // ),
                ),
                Text(cat_list[index].image_title)
              ],
            );
          }),
    );
  }
}

class Popular_wid extends StatelessWidget {
  const Popular_wid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Container(
      // height: screen_height / 2,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: food_list.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    height: 250,
                    width: screen_width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            spreadRadius: 3,
                          )
                        ]),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(food_list[index].image_url),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                "Food name",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: Colors.black87),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.green,
                                    size: 15,
                                  ),
                                  Text(
                                    "4.5 ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            color: Colors.green, fontSize: 14),
                                  ),
                                  Text(
                                    "(128 Rating)",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            color: Colors.black, fontSize: 12),
                                  ),
                                  Spacer(),
                                  Text(
                                    "cafe western food \$" +
                                        "${food_list[index].price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            color: Colors.black, fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class Category_class {
  String image_url;
  String image_title;
  String remote_url;

  // Category_class(this.image_title, this.image_url,{this.remote_url});
  Category_class(
      {required this.image_title,
      required this.image_url,
      required this.remote_url});
}

List<Category_class> cat_list = [
  Category_class(
      image_title: "banner",
      image_url: "assets/images/chicken.jpeg",
      remote_url: "remote_url"),
  Category_class(
      image_title: "food_bg",
      image_url: "assets/images/food_bg.jpeg",
      remote_url: "remote_url"),
  Category_class(
      image_title: "banner",
      image_url: "assets/images/chicken.jpeg",
      remote_url: "remote_url"),
  Category_class(
      image_title: "food_bg",
      image_url: "assets/images/food_bg.jpeg",
      remote_url: "remote_url"),
  Category_class(
      image_title: "banner",
      image_url: "assets/images/chicken.jpeg",
      remote_url: "remote_url"),
  Category_class(
      image_title: "food_bg",
      image_url: "assets/images/food_bg.jpeg",
      remote_url: "remote_url"),
  Category_class(
      image_title: "banner",
      image_url: "assets/images/chicken.jpeg",
      remote_url: "remote_url"),
  Category_class(
      image_title: "food_bg",
      image_url: "assets/images/food_bg.jpeg",
      remote_url: "remote_url"),
];

class Foods_class {
  String image_url;
  String food_title;
  String price;

  // Foods_class(this.image_title, this.image_url,{this.remote_url});
  Foods_class(
      {required this.food_title, required this.image_url, required this.price});
}

List<Foods_class> food_list = [
  Foods_class(
      food_title: "banner",
      image_url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv3tVG5h3siBPnY5ZZT4jFYSOwbWIi9UsItQ&usqp=CAU",
      price: "12"),
  Foods_class(
      food_title: "banner",
      image_url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzsZIRZVeL1aoEGZJM3hfPqc3V5RdN1Buj6w&usqp=CAU",
      price: "23"),
  Foods_class(
      food_title: "banner",
      image_url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLODiwP2BRzjXbkjIbnzpwVvdnW5xq13BC_A&usqp=CAU",
      price: "14"),
  Foods_class(
      food_title: "banner",
      image_url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLODiwP2BRzjXbkjIbnzpwVvdnW5xq13BC_A&usqp=CAU",
      price: "54"),
];
