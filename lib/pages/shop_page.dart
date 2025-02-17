import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<ProductController>(context, listen: false).getProductData();
    Provider.of<ProductController>(context, listen: false).getCategoryData();
    Provider.of<ProductController>(context, listen: false).getJewelryData();
    Provider.of<ProductController>(context, listen: false).getElectronicsData();

    Provider.of<ProductController>(context, listen: false).getWomensData();
    Provider.of<ProductController>(context, listen: false).getMensData();
  }

  @override
  Widget build(BuildContext context) {
    final womensController =
        Provider.of<ProductController>(context, listen: false);
    final mensController =
        Provider.of<ProductController>(context, listen: false);
    final jeweleryController =
        Provider.of<ProductController>(context, listen: false);
    final electronicsController =
        Provider.of<ProductController>(context, listen: false);

    final productController =
        Provider.of<ProductController>(context, listen: false);
    final categoryController =
        Provider.of<ProductController>(context, listen: false);
    final tabController = TabController(
        length: categoryController.categoryList.length, vsync: this);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText('Categories', Colors.black, 20, FontWeight.bold),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: SingleChildScrollView(
          child: Column(
            children: [
              categoryController.isloading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : TabBar(
                      automaticIndicatorColorAdjustment: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.red,
                      controller: tabController,
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(left: 20, right: 20),
                      tabs: List.generate(
                        categoryController.categoryList.length,
                        (index) {
                          final categoryName =
                              categoryController.categoryList[index];
                          return CustomText(categoryName.toString(),
                              Colors.black, 15, FontWeight.bold);
                        },
                      )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: categoryController.isloading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : TabBarView(controller: tabController, children: [
                        //Tab1 jewelry

                        SingleChildScrollView(
                          child: Column(children: [
                            Stack(alignment: Alignment.center, children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                height: 200,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText('SUMMER SALES', Colors.white, 30,
                                      FontWeight.bold),
                                  CustomText('up to 50% off', Colors.white, 20,
                                      FontWeight.bold),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            ]),
                            productController.isloading == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: electronicsController
                                        .electronicList.length,
                                    itemBuilder: (context, index) {
                                      final electronicsPicker =
                                          electronicsController
                                              .electronicList[index];

                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        height: 100,
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: SizedBox(
                                                width: 200,
                                                child: CustomText(
                                                  electronicsPicker.description
                                                      .toString(),
                                                  Colors.black,
                                                  15,
                                                  FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Image.network(electronicsPicker
                                                .image
                                                .toString())
                                          ],
                                        ),
                                      );
                                    })
                          ]),
                        ),

                        //Tab2 electronics

                        SingleChildScrollView(
                          child: Column(children: [
                            Stack(alignment: Alignment.center, children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                height: 200,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText('SUMMER SALES', Colors.white, 30,
                                      FontWeight.bold),
                                  CustomText('up to 50% off', Colors.white, 20,
                                      FontWeight.bold),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            ]),
                            productController.isloading == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        jeweleryController.jewelryList.length,
                                    itemBuilder: (context, index) {
                                      final jeweleryPicker =
                                          jeweleryController.jewelryList[index];

                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        height: 100,
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: SizedBox(
                                                width: 200,
                                                child: CustomText(
                                                  jeweleryPicker.description
                                                      .toString(),
                                                  Colors.black,
                                                  15,
                                                  FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Image.network(
                                                jeweleryPicker.image.toString())
                                          ],
                                        ),
                                      );
                                    })
                          ]),
                        ),

                        //Tab3 womensClothings
                        SingleChildScrollView(
                          child: Column(children: [
                            Stack(alignment: Alignment.center, children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                height: 200,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText('SUMMER SALES', Colors.white, 30,
                                      FontWeight.bold),
                                  CustomText('up to 50% off', Colors.white, 20,
                                      FontWeight.bold),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            ]),
                            productController.isloading == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        mensController.mensClothingList.length,
                                    itemBuilder: (context, index) {
                                      final menPicker = mensController
                                          .mensClothingList[index];

                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        height: 100,
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: SizedBox(
                                                width: 200,
                                                child: CustomText(
                                                  menPicker.description
                                                      .toString(),
                                                  Colors.black,
                                                  15,
                                                  FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Image.network(
                                                menPicker.image.toString())
                                          ],
                                        ),
                                      );
                                    }),
                          ]),
                        ),

                        //Tab4 Mens clothing
                        SingleChildScrollView(
                          child: Column(children: [
                            Stack(alignment: Alignment.center, children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                height: 200,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText('SUMMER SALES', Colors.white, 30,
                                      FontWeight.bold),
                                  CustomText('up to 50% off', Colors.white, 20,
                                      FontWeight.bold),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            ]),
                            productController.isloading == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: womensController
                                        .womensClothingList.length,
                                    itemBuilder: (context, index) {
                                      final womensPicker = womensController
                                          .womensClothingList[index];

                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        height: 100,
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: SizedBox(
                                                width: 200,
                                                child: CustomText(
                                                  womensPicker.description
                                                      .toString(),
                                                  Colors.black,
                                                  15,
                                                  FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Image.network(
                                                womensPicker.image.toString())
                                          ],
                                        ),
                                      );
                                    })
                          ]),
                        )
                      ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
