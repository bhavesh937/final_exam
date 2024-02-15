import 'package:app_mania/Model/cartmodel.dart';
import 'package:app_mania/Model/modalclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class DetailsScreen extends StatefulWidget {
  final Items itemData;
  final hotsale;
  final md1;

  DetailsScreen({super.key, required this.itemData, this.hotsale, this.md1});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int qnt = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButton: Align(
        alignment: Alignment(0.35, -0.5),
        child: Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey,
                offset: const Offset(
                  2.0,
                  4.0,
                ),
                blurRadius: 70.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 1.0,
                spreadRadius: 0.0,
              ),
            ],
            image: DecorationImage(
              image: AssetImage(
                widget.itemData.img.toString(),
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          backgroundColor: Colors.blueGrey,
          title: Center(
            child: Text(
              "_ . .",
              style: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                CupertinoIcons.suit_heart,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: Container(
        width: 430,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 170.0),
                child: Container(
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Color(0000),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (qnt > 1) {
                                qnt--;
                              }
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '$qnt',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              qnt++;
                            });
                          },
                          child: Icon(Icons.add, size: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.itemData.name.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.itemData.dis.toString(),
                      style: GoogleFonts.poppins(
                        color: CupertinoColors.systemGrey,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: "Read More",
                      style: GoogleFonts.poppins(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        ' 4.5',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department_sharp,
                        color: Colors.orange,
                      ),
                      Text(
                        ' ',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.alarm,
                        color: Colors.red,
                      ),
                      Text(
                        ' 5-10 Min',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  CartModel cart = CartModel(
                      qty: qnt,
                      img: widget.itemData.img,
                      name: widget.itemData.name,
                      price: widget.itemData.price,
                      dis: widget.itemData.dis,
                      star: widget.itemData.star,
                      Kcal: widget.itemData.Kcal,
                      min: widget.itemData.min);

                  cartList.add(cart);
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Add To Cart",
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF37474F),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
