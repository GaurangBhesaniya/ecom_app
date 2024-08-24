import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:ecom_app/config/helper.dart';
import 'package:ecom_app/models/shoplocal_product_model.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/shoplocal/products/product_detail.dart';

class StoreProductScreen extends StatefulWidget {
  const StoreProductScreen({
    super.key,
  });

  @override
  State<StoreProductScreen> createState() => _StoreProductScreenState();
}

class _StoreProductScreenState extends State<StoreProductScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: (Get.height <= 670.0) ? 15 : 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddingX(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0.2, 0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                            color: const Color(0xff111111).withOpacity(0.1),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Image.asset(
                            AppImage.sazoLogo,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Sazo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Gilroy-SemiBold',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: size.width - 150,
                      child: const Text(
                        "A fun-filled world of the bizarre, in our merch you’ll be star",
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(
                          color: Color(0xFFE1E1E1),
                          fontSize: 15,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddingX(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'All Products',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.center,
                          height: 40,
                          width: 71,
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: kElevationToShadow[6]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AppIcon.newSearchIcon,
                                height: 18,
                                width: 18,
                              ),
                              Image.asset(
                                AppIcon.newFilterIcon,
                                height: 18,
                                width: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  clipBehavior: Clip.antiAlias,
                  addAutomaticKeepAlives: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: shoplocalProduct.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:15,
                      mainAxisSpacing:5,
                    childAspectRatio:.7
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Get.to(()=>const ProductDetail());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(shoplocalProduct[index].productImage),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            shoplocalProduct[index].productTitle.toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Gilroy-SemiBold',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.20,
                            ),
                          ),
                          const SizedBox(height: 2.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "₹",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.20,
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                removeCurrencySymbolAndDecimals(shoplocalProduct[index].productPrice),
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.20,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
