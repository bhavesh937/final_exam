import 'package:app_mania/Screen/cart.dart';
import 'package:app_mania/Model/cartmodel.dart';
import 'package:app_mania/Screen/details.dart';
import 'package:app_mania/Model/modalclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: "",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int Index = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Hi ",
                        style: GoogleFonts.poppins(
                            fontSize: 35, color: Colors.black)),
                    TextSpan(
                        text: "Jemis! ",
                        style: GoogleFonts.poppins(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "\nWhat Do You Want Do Order Today?",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.black))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                height: 50,
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    Text("Search your favourit food"),
                    Icon(
                      Icons.menu,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color(0XFFF4F4F4),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Special Pizza",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Index = 0;
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 110,
                    child: Center(
                      child: Text(
                        "Pizza",
                        style: GoogleFonts.poppins(
                            color: Index == 0 ? Colors.white : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Index == 0 ? Colors.blueGrey : Color(0XFFF4F4F4),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            IndexedStack(
              index: Index,
              children: [
                Container(
                  height: 420,
                  child: GridView.builder(
                    dragStartBehavior: DragStartBehavior.down,
                    itemCount: itemData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 240,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                itemData: itemData[index],
                                hotsale: hotsale[index],
                                md1: md1[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0XFFF4F4F4),
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Image.asset(
                                      itemData[index].img.toString(),
                                      height: 130,
                                      width: 120,
                                    ),
                                  ),
                                  Text(
                                    itemData[index].name.toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          itemData[index].min.toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Color(0XFFBDBDBD),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 22,
                                            ),
                                            Text(
                                              itemData[index].star.toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                color: Color(0XFFBDBDBD),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '\$' +
                                              itemData[index].price.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          CartModel cart = CartModel(
                                              qty: 1,
                                              img: itemData[index].img,
                                              name: itemData[index].name,
                                              price: itemData[index].price,
                                              dis: itemData[index].dis,
                                              star: itemData[index].star,
                                              Kcal: itemData[index].Kcal,
                                              min: itemData[index].min);
                                          cartList.add(cart);
                                          print(cartList.length);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 360,
                  child: GridView.builder(
                    itemCount: hotsale.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 240,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                itemData: hotsale[index],
                                hotsale: hotsale[index],
                                md1: md1[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0XFFF4F4F4),
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Image.asset(
                                      hotsale[index].img.toString(),
                                      height: 130,
                                      width: 120,
                                    ),
                                  ),
                                  Text(
                                    hotsale[index].name.toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          hotsale[index].min.toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Color(0XFFBDBDBD),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 22,
                                            ),
                                            Text(
                                              hotsale[index].star.toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                color: Color(0XFFBDBDBD),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          hotsale[index].price.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          CartModel cart = CartModel(
                                              qty: 1,
                                              img: itemData[index].img,
                                              name: itemData[index].name,
                                              price: itemData[index].price,
                                              dis: itemData[index].dis,
                                              star: itemData[index].star,
                                              Kcal: itemData[index].Kcal,
                                              min: itemData[index].min);
                                          cartList.add(cart);
                                          print(cartList.length);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 360,
                  child: GridView.builder(
                    itemCount: md1.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 240,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                itemData: md1[index],
                                hotsale: hotsale[index],
                                md1: md1[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0XFFF4F4F4),
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Image.asset(
                                      md1[index].img.toString(),
                                      height: 130,
                                      width: 120,
                                    ),
                                  ),
                                  Text(
                                    md1[index].name.toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          md1[index].min.toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Color(0XFFBDBDBD),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 22,
                                            ),
                                            Text(
                                              md1[index].star.toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                color: Color(0XFFBDBDBD),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          md1[index].price.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          CartModel cart = CartModel(
                                              qty: 1,
                                              img: md1[index].img,
                                              name: md1[index].name,
                                              price: md1[index].price,
                                              dis: md1[index].dis,
                                              star: md1[index].star,
                                              Kcal: md1[index].Kcal,
                                              min: md1[index].min);
                                          cartList.add(cart);
                                          print(cartList.length);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      CupertinoIcons.heart,
                                      color: Colors.grey.shade600,
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
