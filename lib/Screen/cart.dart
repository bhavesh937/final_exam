import 'package:app_mania/Model/cartmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:printing/printing.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}
dynamic totalPtice(int a,int b) {
  // TODO: implement totalPtice
  throw UnimplementedError();
}


class _CartPageState extends State<CartPage> {
  int total = 0;

  List<CartModel>? get cartData => null;



  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("asset/images/background1.jpg"),
            fit: BoxFit.fitHeight,
            opacity: 0.6),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.keyboard_arrow_left_sharp,
                size: 35,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              "Cart",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.multiply,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), topLeft: Radius.circular(50)),
          ),
          child: Column(
            children: [
              Container(
                height: 350,
                width: 350,
                color: Colors.transparent,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: cartList.map((e) {
                        int total = 0;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            height: 100,
                            width: 350,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                e.img.toString(),
                                              ),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.name.toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              '\$' + e.price.toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.remove_circle_sharp,
                                              size: 23,
                                              color: Color(0XFF393939),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              e.qty.toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.add_circle_sharp,
                                              size: 23,
                                              color: Color(0XFF393939),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          '\$' +
                                              totalPrice(
                                                  e.price! as int, e.qty!)
                                                  .toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.grey.shade600),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.account_balance_wallet_sharp),
                    /*SizedBox(width: 10,),*/
                    Text(
                      "Promo Code",
                      style: GoogleFonts.poppins(
                          color: Colors.grey.shade700,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 40,
                      width: 90,
                      child: Center(
                        child: Text(
                          "Apply",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(50)),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 223,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 30, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '\$' + total.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black38,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600)),
                          Text(
                            '\$10',
                            style: GoogleFonts.poppins(
                                color: Colors.black38,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600)),
                          Text(
                            '\$' + totalFunc().toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: (){
                          pdfPreview(CartPage! as List<CartModel>, totalPrice.toString());
                        },
                        child: Container(
                          height: 60,
                          width: 350,
                          child: Center(
                            child: Text(
                              "CHECKOUT",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  pdfPreview(List<CartModel> cartData, total) async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            // crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text("Decathlon", style: pw.TextStyle(fontSize: 40)),
                pw.SizedBox(height: 20),
                pw.Table(
                  defaultColumnWidth: pw.FixedColumnWidth(120.0),
                  defaultVerticalAlignment: pw.TableCellVerticalAlignment.top,
                  border: pw.TableBorder.all(
                    // color:   pw.Colors.black,
                      style: pw.BorderStyle.solid,
                      width: 2),
                  children: [
                    pw.TableRow(
                      // verticalAlignment: pw.TableCellVerticalAlignment.,
                        children: [
                          pw.Column(children: [
                            pw.Text('Item', style: pw.TextStyle(fontSize: 20.0))
                          ]),
                          pw.Column(children: [
                            pw.Text('Quantity',
                                style: pw.TextStyle(fontSize: 20.0))
                          ]),
                          pw.Column(children: [
                            pw.Text('Price',
                                style: pw.TextStyle(fontSize: 20.0))
                          ]),
                        ]),
                    ...cartData
                        .map((e) => pw.TableRow(children: [
                      pw.Text(e.name!,
                          style: pw.TextStyle(fontSize: 20.0)),
                      pw.Text(e.qty.toString(),
                          style: pw.TextStyle(fontSize: 20.0)),
                      pw.Text(e.price.toString()!,
                          style: pw.TextStyle(fontSize: 20.0)),
                    ]))
                        .toList()
                  ],
                ),

                pw.SizedBox(height: 20),
                pw.Row(
                    children: [
                      pw.Spacer(),
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            pw.Text('Sub Total : \$${subTotalPrice().toString()}',
                                style: pw.TextStyle(fontSize: 20),
                                textAlign: pw.TextAlign.right),
                            pw.SizedBox(height: 20),
                            pw.Text('Delivery Charge : \$${3}',
                                style: pw.TextStyle(fontSize: 20),
                                textAlign: pw.TextAlign.right),
                            pw.SizedBox(height: 20),
                            pw.Text('Total Amount : \$${total}',
                                style: pw.TextStyle(fontSize: 20),
                                textAlign: pw.TextAlign.right),
                            pw.SizedBox(height: 20),
                            pw.Text('Thank You',
                                style: pw.TextStyle(fontSize: 20),
                                textAlign: pw.TextAlign.right),
                          ]
                      ),
                    ]
                )


              ]);
        }));
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      return pdf.save();
    });
  }



  totalFunc() {
    int t = total + 10;
    return t;
  }


  totalPrice(int a, int b) {
    int c = a * b;
    total = total + c;
    return c;
  }
}

subTotalPrice() {

}




