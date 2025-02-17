import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<ProductController>(context, listen: false).getProductData();
  }

  @override
  Widget build(BuildContext context) {
    final productController =
        Provider.of<ProductController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText('My Orders', Colors.black, 30, FontWeight.bold),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  itemCount: productController.productList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final productInfo = productController.productList[index];
                    return Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: CustomText(
                            'Delivered', Colors.white, 15, FontWeight.bold),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: productController.isloading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: productController.productList.length,
                      itemBuilder: (context, index) {
                        final productData =
                            productController.productList[index];
                        return Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          margin: EdgeInsets.only(top: 20),
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText('Order n01947034', Colors.black,
                                      15, FontWeight.bold),
                                  Text(DateTime.now().toString())
                                ],
                              ),
                              CustomText('Tracking Number : IW34754553455',
                                  Colors.black54, 15, FontWeight.bold),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(' Quantity : 3', Colors.black, 15,
                                      FontWeight.bold),
                                  Row(
                                    children: [
                                      Text('Total Amount : '),
                                      Text(productData.price.toString())
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: CustomText('Details', Colors.black,
                                          15, FontWeight.bold),
                                    ),
                                  ),
                                  CustomText('Delivered', Colors.green, 12,
                                      FontWeight.bold)
                                ],
                              )
                            ],
                          ),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
