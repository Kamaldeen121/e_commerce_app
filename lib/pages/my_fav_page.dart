import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavPage extends StatefulWidget {
  const MyFavPage({super.key});

  @override
  State<MyFavPage> createState() => _MyFavPageState();
}

class _MyFavPageState extends State<MyFavPage> {
  List<dynamic> favorite = [
    'summer',
    'T-shirt',
    'shirts',
    'Tops',
    'Trousers',
    'Shorts'
  ];
  int activeIndex = 0;
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
            CustomText('Favorites', Colors.black, 30, FontWeight.bold),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  itemCount: favorite.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    activeIndex = index;

                    final product = favorite[activeIndex];

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
                            favorite[index], Colors.white, 15, FontWeight.bold),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.filter_list),
                    CustomText('Filters', Colors.black, 13, FontWeight.w400)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.swap_vert),
                    CustomText('Price: lowest to high', Colors.black, 13,
                        FontWeight.w400)
                  ],
                ),
                Icon(Icons.grid_view_rounded)
              ],
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
                          margin: EdgeInsets.only(top: 20),
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Image.network(
                                productData.image.toString(),
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  10,
                                          height: MediaQuery.sizeOf(context)
                                                  .height /
                                              18,
                                          child: CustomText(
                                              productData.title.toString(),
                                              Colors.black54,
                                              15,
                                              FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 230,
                                        ),
                                        Icon(Icons.cancel_sharp)
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 250),
                                      child: CustomText(
                                          productData.id.toString(),
                                          Colors.black,
                                          15,
                                          FontWeight.bold),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 180),
                                      child: Row(
                                        children: [
                                          CustomText('color:', Colors.black54,
                                              10, FontWeight.w100),
                                          CustomText('Blue', Colors.black, 12,
                                              FontWeight.bold),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          CustomText('Size:', Colors.black54,
                                              10, FontWeight.w100),
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
                                        CustomText(productData.price.toString(),
                                            Colors.black, 15, FontWeight.bold),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        ...List.generate(5, (index) {
                                          return Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.amber,
                                          );
                                        })
                                      ],
                                    ),
                                  ],
                                ),
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
