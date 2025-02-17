import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<ProductController>(context, listen: false).getProductData();
  }

  @override
  Widget build(BuildContext context) {
    final productController =
        Provider.of<ProductController>(context, listen: true);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: productController.isloading == false
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    addSemanticIndexes: true,
                    itemCount: productController.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      final productData = productController.productList[index];

                      return Stack(
                        clipBehavior: Clip.hardEdge,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.network(
                            productData.image.toString(),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Container(
                            color: Colors.white,
                            child: CustomText(productData.title.toString(),
                                Colors.black, 15, FontWeight.bold),
                          )
                        ],
                      );
                    }),
          ),
        ),
      ),
    );
  }
}
