import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MybagPage extends StatefulWidget {
  const MybagPage({super.key});

  @override
  State<MybagPage> createState() => _MybagPageState();
}

class _MybagPageState extends State<MybagPage> {
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
            child: Icon(Icons.search_outlined),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText('My Bag', const Color.fromARGB(255, 150, 57, 57), 25,
                FontWeight.bold),
            Expanded(
              child: productController.isloading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: productController.productList.length,
                      itemBuilder: (context, index) {
                        final productInfo =
                            productController.productList[index];
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 150,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Image.network(
                                productInfo.image.toString(),
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                7,
                                        height:
                                            MediaQuery.sizeOf(context).height /
                                                11,
                                        child: CustomText(
                                            productInfo.title.toString(),
                                            Colors.black,
                                            15,
                                            FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 210,
                                      ),
                                      PopupMenuButton(
                                          itemBuilder: (context) =>
                                              <PopupMenuEntry>[])
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 200),
                                    child: Row(
                                      children: [
                                        CustomText('color:', Colors.black54, 10,
                                            FontWeight.w100),
                                        CustomText('Black', Colors.black, 12,
                                            FontWeight.bold),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CustomText('Size:', Colors.black54, 10,
                                            FontWeight.w100),
                                        CustomText('L', Colors.black, 12,
                                            FontWeight.bold),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderOnForeground: true,
                                        elevation: 9.5,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomText('1', Colors.black, 15,
                                            FontWeight.bold),
                                      ),
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderOnForeground: true,
                                        elevation: 9.5,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.remove),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 180,
                                      ),
                                      CustomText(productInfo.price.toString(),
                                          Colors.black, 10, FontWeight.bold)
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
