import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:ecom_app/config/helper.dart';
import 'package:ecom_app/models/shoplocal_carousal_model.dart';
import 'package:ecom_app/models/shoplocal_category_model.dart';
import 'package:ecom_app/models/shoplocal_selectedProduct_model.dart';
import 'package:ecom_app/models/shoplocal_storeInfo_model.dart';
import 'package:ecom_app/models/shoplocal_store_model.dart';
import 'package:ecom_app/presentation/common_widgets/new_carousal_card.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/shoplocal/products/product_detail.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/shoplocal/store_product_screen.dart';

import 'new_category_screen.dart';

class NewShopLocalScreen extends StatefulWidget {
  const NewShopLocalScreen({super.key});

  @override
  State<NewShopLocalScreen> createState() => _NewShopLocalScreenState();
}

class _NewShopLocalScreenState extends State<NewShopLocalScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode search = FocusNode();

  bool searchOn = false;
  bool isShow = false;
  bool isVisible = false;

  List<String> recentSearches = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // log("deviceSize:${size.height}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      extendBodyBehindAppBar: true,
      body: Container(
          height: size.height,
          width: size.width,
          color: AppColors.backgroundColor,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    CarouselView(
                      onTap: () {
                        searchOn = true;
                        isShow = true;
                        FocusScope.of(context).requestFocus(search);
                        setState(() {});
                      },
                      carousal: carousalList,
                    ),
                    const SizedBox(height: 37),
                    Padding(
                      padding: EdgeInsets.only(left: kDefaultPaddingX(context)),
                      child: Row(
                        children: [
                          Text(
                            "Shop By Category",
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(0.8999999761581421),
                              fontSize: 20,
                              fontFamily: 'Gilroy-SemiBold',
                              fontWeight: FontWeight.w400,
                              height: 1,
                              letterSpacing: 0.52,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 23),
                    _getCategory(),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Just For You",
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(0.8999999761581421),
                              fontSize: 20,
                              fontFamily: 'Gilroy-SemiBold',
                              fontWeight: FontWeight.w400,
                              height: 1,
                              letterSpacing: 0.52,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _justForYou(),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kDefaultPaddingX(context)),
                      child: Row(
                        children: [
                          Text(
                            "Stores we want you to explore..",
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(0.8999999761581421),
                              fontSize: 20,
                              fontFamily: 'Gilroy-SemiBold',
                              fontWeight: FontWeight.w400,
                              height: 1,
                              letterSpacing: 0.52,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    _getStore(),
                    const SizedBox(
                      height: 38,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPaddingX(context)),
                      child: Text(
                        "Life is not perfect but your outfit can be!",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8999999761581421),
                          fontSize: 20,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          height: 1.10,
                          letterSpacing: 0.52,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    _getStoreInfo()
                  ],
                ),
              ),
              IgnorePointer(
                ignoring: (!searchOn) ? true : false,
                child: AnimatedOpacity(
                  opacity: (searchOn) ? 1 : 0,
                  duration: const Duration(microseconds: 1),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (searchController.text.isEmpty) {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          searchOn = false;
                        });
                      }
                    },
                    child: SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: Get.height,
                            width: Get.width,
                            color: const Color(0xff111111).withOpacity(.6),
                            child: SafeArea(
                              child: CustomScrollView(
                                primary: true,
                                physics: const ClampingScrollPhysics(),
                                slivers: [
                                  SliverAppBar(
                                    scrolledUnderElevation: 10,
                                    foregroundColor: Colors.transparent,
                                    clipBehavior: Clip.antiAlias,
                                    automaticallyImplyLeading: false,
                                    centerTitle: false,
                                    surfaceTintColor: Colors.transparent,
                                    titleSpacing: 0,
                                    leadingWidth: 0,
                                    elevation: 0,
                                    title: ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 2, sigmaY: 2),
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          height: 45,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: const Color(0xff404040)),
                                          child: TextField(
                                            keyboardAppearance: Brightness.dark,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            onSubmitted: (txt) {
                                              if (txt.isEmpty) {
                                                setState(() {
                                                  isShow = false;
                                                });
                                              }
                                            },
                                            onChanged: (text) async {
                                              if (text.isEmpty) {
                                                isShow = false;
                                                setState(() {});
                                              } else {
                                                isShow = true;
                                                setState(() {});
                                                if (text.length >= 3) {
                                                  isVisible = true;
                                                  setState(() {});
                                                } else {
                                                  isVisible = false;
                                                  setState(() {});
                                                }
                                              }
                                            },
                                            textInputAction:
                                                TextInputAction.search,
                                            controller: searchController,
                                            focusNode: search,
                                            cursorColor: AppColors.primary,
                                            decoration: InputDecoration(
                                                suffixIconConstraints:
                                                    const BoxConstraints(
                                                  minHeight: 16,
                                                ),
                                                hintText: "Search here..",
                                                hintStyle: TextStyle(
                                                    color:
                                                        const Color(0xffffffff)
                                                            .withOpacity(.5)),
                                                border: InputBorder.none,
                                                suffixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15),
                                                  child: (!isShow)
                                                      ? Image.asset(
                                                          fit: BoxFit.cover,
                                                          AppIcon.newSearchIcon,
                                                          height: 16,
                                                          color: const Color(
                                                                  0xffAEAEAE)
                                                              .withOpacity(.5),
                                                        )
                                                      : InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            searchController
                                                                .text = "";
                                                            isVisible = false;
                                                            searchOn = false;
                                                            isShow = false;
                                                            setState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.close,
                                                            size: 20,
                                                            color: const Color(
                                                                    0xffffffff)
                                                                .withOpacity(
                                                                    0.5),
                                                          )),
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    primary: true,
                                    pinned: true,
                                  ),
                                  SliverToBoxAdapter(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        if (recentSearches.isNotEmpty &&
                                            search.hasFocus)
                                          Column(
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Recent Searches',
                                                    style: TextStyle(
                                                      color: Color(0xFFE4E4E4),
                                                      fontSize: 18,
                                                      fontFamily: 'Gilroy',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                padding: EdgeInsets.zero,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    recentSearches.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 5,
                                                            right: 14),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () {
                                                            isVisible = true;
                                                            setState(() {});
                                                          },
                                                          child: Text(
                                                            truncateString(
                                                                recentSearches[
                                                                    index],
                                                                35),
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xFFCDCDCD),
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () {},
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      .5),
                                                              size: 20,
                                                            ))
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  SizedBox _justForYou() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: justForYouProduct.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Get.to(() => const ProductDetail());
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              height: 250,
              width: 180,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withOpacity(0.1),
                        const Color(0xff3C3FD1).withOpacity(0.1),
                        AppColors.primary.withOpacity(0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: AlignmentDirectional.bottomEnd),
                  border: Border.all(color: AppColors.primary.withOpacity(.6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 135,
                    width: 135,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xffFEFDFC), width: 1.5),
                        image: DecorationImage(
                            image: AssetImage(
                                justForYouProduct[index].productImage),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            justForYouProduct[index].storeName,
                            style: const TextStyle(
                              color: Color(0xFF889BC1),
                              fontSize: 13,
                              fontFamily: 'Gilroy-SemiBold',
                              fontWeight: FontWeight.w400,
                              height: 1.27,
                              letterSpacing: 0.79,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            (justForYouProduct[index]
                                        .productTitle
                                        .toString()
                                        .length >
                                    14)
                                ? "${justForYouProduct[index].productTitle.toString().substring(0, 11)}..."
                                : justForYouProduct[index]
                                    .productTitle
                                    .toString(),
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(0.8999999761581421),
                              fontSize: 14,
                              fontFamily: 'Gilroy-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 1.27,
                              letterSpacing: 0.79,
                            ),
                          ),
                          Text(
                            "₹ ${removeCurrencySymbolAndDecimals(justForYouProduct[index].productPrice.toString())}",
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(0.800000011920929),
                              fontSize: 14,
                              fontFamily: 'Gilroy-Medium',
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                              letterSpacing: 0.63,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _getStore() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        addRepaintBoundaries: false,
        addAutomaticKeepAlives: false,
        itemCount: storeList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: kDefaultPaddingX(context)),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Get.to(() => const StoreProductScreen());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    elevation: 5,
                    color: Colors.transparent,
                    type: MaterialType.circle,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(storeList[index].storeLogo),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    storeList[index].storeName.toString().toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF889BC1),
                      fontSize: 13,
                      fontFamily: 'Gilroy-SemiBold',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.79,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ListView _getCategory() {
    return ListView.builder(
      addRepaintBoundaries: false,
      addAutomaticKeepAlives: false,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingX(context)),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(() => NewCategoryDetailScreen(
                  category: (index == 0)
                      ? 'Sustainable Life'
                      : (index == 1)
                          ? "Street & Active Wear"
                          : "Women Owned",
                ));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: Material(
              elevation: 5,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: EdgeInsets.only(
                    left: kDefaultPaddingX(context),
                    bottom: kDefaultPaddingX(context) - 4),
                height: 175,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(categoryList[index].categoryImage),
                        fit: BoxFit.cover,
                        opacity: 0.7),
                    border: Border.all(
                        color: (categoryList[index].categoryName.toString() ==
                                "Sustainable Life")
                            ? const Color(0xffB0AD9E)
                            : (categoryList[index].categoryName.toString() ==
                                    "Street & Active Wear")
                                ? const Color(0xff99A2B2)
                                : const Color(0xff7E392C),
                        width: 1.5,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        style: BorderStyle.solid)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      categoryList[index].categoryName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Gilroy-SemiBold',
                        fontWeight: FontWeight.w400,
                        height: 0.92,
                        letterSpacing: 0.79,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        clipBehavior: Clip.antiAlias,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            height: 40,
                            width: 140,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 0.2),
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Text(
                              'View Collection',
                              style: TextStyle(
                                color: Color(0xFF1F2531),
                                fontSize: 14,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ListView _getStoreInfo() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: storeInfoList.length,
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(() => const StoreProductScreen());
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(Get.width * 0.05),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: storeInfoList[index].storeColor.withOpacity(.1),
                border: Border.all(
                    color: storeInfoList[index].storeColor,
                    width: 1,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignOutside)),
            height: 220,
            width: Get.width,
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: storeInfoList[index].productImages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1),
                  itemBuilder: (BuildContext context, int ind) {
                    return Material(
                      elevation: 5,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(
                                    storeInfoList[index].productImages[ind]),
                                fit: BoxFit.cover)),
                      ),
                    );
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: Get.width * 0.14,
                          height: Get.width * 0.14,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.storeMainColor,
                              boxShadow: kElevationToShadow[2]),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Image.asset(
                                storeInfoList[index].storeLogo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              storeInfoList[index].storeName.toUpperCase(),
                              style: TextStyle(
                                color: storeInfoList[index].storeColor,
                                fontSize: 14,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                                height: 1.18,
                                letterSpacing: 0.79,
                              ),
                            ),
                            const SizedBox(height: 3.0),
                            SizedBox(
                              width: Get.width - 215,
                              child: Text(
                                storeInfoList[index].storeTagLine,
                                maxLines: 3,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                  height: 1.08,
                                  letterSpacing: 0.50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_sharp,
                        size: 15, color: storeInfoList[index].storeColor)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CarouselView extends StatefulWidget {
  final List<ShoplocalCarousal> carousal;
  final void Function()? onTap;

  const CarouselView({super.key, required this.carousal, this.onTap});

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1,
                height: 525,
                onPageChanged: (index, _) {
                  setState(() {
                    _index = index;
                  });
                }),
            items: [
              for (ShoplocalCarousal i in widget.carousal)
                NewCarouselCard(
                  logoTap: () {
                    Get.to(() => const StoreProductScreen());
                  },
                  carousel: i,
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 45, 18, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop Local',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Gilroy-Bold',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Explore the world of homegrown labels',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Gilroy-Medium',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: widget.onTap,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: const Color(0x00ffffff).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          AppIcon.newSearchIcon,
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 32,
            right: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  widget.carousal.length,
                  (i) => Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: Container(
                          width: i == _index ? 15 : 7,
                          height: i == _index ? 15 : 7,
                          decoration: BoxDecoration(
                            color: i == _index
                                ? Colors.transparent
                                : AppColors.white.withOpacity(0.6),
                            shape: BoxShape.circle,
                            border: i != _index
                                ? null
                                : Border.all(
                                    width: 2.0,
                                    color: AppColors.white,
                                  ),
                          ),
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
