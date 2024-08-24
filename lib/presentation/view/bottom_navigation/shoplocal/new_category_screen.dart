import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:ecom_app/config/helper.dart';
import 'package:ecom_app/models/shoplocal_product_model.dart';
import 'package:ecom_app/models/shoplocal_storeInfo_model.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/shoplocal/products/product_detail.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/shoplocal/store_product_screen.dart';

class NewCategoryDetailScreen extends StatefulWidget {
  final String category;

  const NewCategoryDetailScreen({super.key, required this.category});

  @override
  State<NewCategoryDetailScreen> createState() =>
      _NewCategoryDetailScreenState();
}

class _NewCategoryDetailScreenState extends State<NewCategoryDetailScreen> {
  bool isShop = true;
  bool isSearch = false;
  bool isShow = false;
  late TextEditingController searchData;
  FocusNode searchNode = FocusNode();

  @override
  void initState() {
    super.initState();
    initTask();
  }

  Future<void> initTask() async {
    searchData = TextEditingController();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    searchNode.dispose();
    searchData.dispose();
  }

  bool isOutOfStock(Map product) {
    return ((product["variants"]
                .every((element) => element["inventory_quantity"] == 0) ??
            true) ||
        (product["options"] == null || product["options"].isEmpty));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight((!isShop)
              ? (Get.height <= 670)
                  ? size.height / 6
                  : size.height / 7.5
              : 70),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  left: kDefaultPaddingX(context),
                  right: kDefaultPaddingX(context),
                  top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 22,
                                )),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.category,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                '2 "Brands" in the category',
                                style: TextStyle(
                                  color: Color(0xFF889BC1),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 71,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(.1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  isShop = true;
                                  setState(() {});
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: (isShop)
                                        ? AppColors.primary
                                        : Colors.transparent),
                                child: SvgPicture.asset(AppSvg.categoryIcon,
                                    colorFilter: ColorFilter.mode(
                                        (isShop)
                                            ? Colors.white
                                            : const Color(0xff8B8B8B),
                                        BlendMode.srcIn)),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  isShop = false;
                                  setState(() {});
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: (!isShop)
                                        ? AppColors.primary
                                        : Colors.transparent),
                                child: SvgPicture.asset(
                                  AppSvg.clothIcon,
                                  colorFilter: ColorFilter.mode(
                                      (!isShop)
                                          ? Colors.white
                                          : const Color(0xff8B8B8B),
                                      BlendMode.srcIn),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  if (!isShop)
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.only(left: 15),
                      height: 45,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.5),
                        color: const Color(0xffffffff).withOpacity(.1),
                      ),
                      child: TextField(
                        onTap: () {
                          isShow = true;
                          setState(() {});
                        },
                        controller: searchData,
                        focusNode: searchNode,
                        onChanged: (text) {
                          if (text.length >= 3) {
                            setState(() {
                              isSearch = true;
                            });
                          } else {
                            setState(() {
                              isSearch = false;
                            });
                          }
                        },
                        onSubmitted: (text) {
                          if (text.isEmpty) {
                            setState(() {
                              isShow = false;
                            });
                          }
                        },
                        textAlignVertical: TextAlignVertical.center,
                        keyboardAppearance: Brightness.dark,
                        showCursor: true,
                        cursorColor: const Color(0xFFAEAEAE),
                        style: const TextStyle(
                          color: Color(0xFFAEAEAE),
                          fontSize: 15,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Products...",
                            hintStyle: const TextStyle(
                              color: Color(0xFFAEAEAE),
                              fontSize: 15,
                              fontFamily: 'Gilroy-SemiBold',
                              fontWeight: FontWeight.w400,
                            ),
                            suffixIconConstraints: const BoxConstraints(
                              minHeight: 18,
                            ),
                            suffixIcon: (isShow)
                                ? InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      searchData.text = "";
                                      isSearch = false;
                                      isShow = false;
                                      FocusScope.of(context).unfocus();
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 15,
                                      ),
                                      child: Icon(
                                        CupertinoIcons.clear,
                                        color: const Color(0xffAEAEAE)
                                            .withOpacity(.5),
                                        size: 18,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      fit: BoxFit.cover,
                                      AppIcon.newSearchIcon,
                                      height: 18,
                                      color: const Color(0xffAEAEAE)
                                          .withOpacity(.5),
                                    ),
                                  )),
                      ),
                    )
                ],
              ),
            ),
          )),
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppColors.backgroundColor,
        child: SafeArea(
            child: (isShop)
                ? SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPaddingX(context)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  padding: EdgeInsets.all(Get.width * 0.05),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: storeInfoList[index]
                                          .storeColor
                                          .withOpacity(.1),
                                      border: Border.all(
                                          color:
                                              storeInfoList[index].storeColor,
                                          width: 1,
                                          style: BorderStyle.solid,
                                          strokeAlign:
                                              BorderSide.strokeAlignOutside)),
                                  height: 220,
                                  width: Get.width,
                                  child: Column(
                                    children: [
                                      GridView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: storeInfoList[index]
                                            .productImages
                                            .length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 5,
                                                childAspectRatio: 1),
                                        itemBuilder:
                                            (BuildContext context, int ind) {
                                          return Material(
                                            elevation: 5,
                                            color: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          storeInfoList[index]
                                                                  .productImages[
                                                              ind]),
                                                      fit: BoxFit.cover)),
                                            ),
                                          );
                                        },
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: Get.width * 0.14,
                                                height: Get.width * 0.14,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors
                                                        .storeMainColor,
                                                    boxShadow:
                                                        kElevationToShadow[2]),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            70),
                                                    child: Image.asset(
                                                      storeInfoList[index]
                                                          .storeLogo,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    storeInfoList[index]
                                                        .storeName
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                      color:
                                                          storeInfoList[index]
                                                              .storeColor,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Gilroy-SemiBold',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.18,
                                                      letterSpacing: 0.79,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 3.0),
                                                  SizedBox(
                                                    width: Get.width - 215,
                                                    child: Text(
                                                      storeInfoList[index]
                                                          .storeTagLine,
                                                      maxLines: 3,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'Gilroy-Medium',
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                              size: 15,
                                              color: storeInfoList[index]
                                                  .storeColor)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Products on offer for you..',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Gilroy-SemiBold',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.52,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GridView.builder(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            clipBehavior: Clip.antiAlias,
                            addAutomaticKeepAlives: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 5,
                                    childAspectRatio: .7),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(()=>const ProductDetail());
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            shoplocalProduct[index]
                                                .productImage),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      shoplocalProduct[index]
                                          .productTitle
                                          .toUpperCase(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Gilroy-SemiBold',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.20,
                                          ),
                                    ),
                                    const SizedBox(height: 2.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "₹",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
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
                                          removeCurrencySymbolAndDecimals(
                                              shoplocalProduct[index]
                                                  .productPrice),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
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
                          ),
                          if (widget.category == "Sustainable Life")
                            Container(
                              alignment: Alignment.center,
                              height: 500,
                              width: Get.width,
                              child: SvgPicture.asset(
                                AppSvg.sustainableFashion,
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (widget.category == "Street & Active Wear")
                            Container(
                              alignment: Alignment.center,
                              height: 500,
                              width: Get.width,
                              child: Image.asset(
                                AppImage.streetNewIcon,
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (widget.category == "Women Owned")
                            Container(
                              alignment: Alignment.center,
                              height: 500,
                              width: Get.width,
                              child: SvgPicture.asset(
                                AppSvg.womenOwned,
                                fit: BoxFit.cover,
                              ),
                            )
                        ],
                      ),
                    ),
                  )
                : Padding(
                  padding: EdgeInsets.only(
                      left: kDefaultPaddingX(context),
                      right: kDefaultPaddingX(context),
                      top: kDefaultPaddingX(context)),
                  child: GridView.builder(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    clipBehavior: Clip.antiAlias,
                    addAutomaticKeepAlives: false,
                    shrinkWrap: true,
                    itemCount: shoplocalProduct.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 5,
                            childAspectRatio: .7),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Get.to(()=>const ProductDetail());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                    shoplocalProduct[index].productImage),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              shoplocalProduct[index]
                                  .productTitle
                                  .toUpperCase(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
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
                                  removeCurrencySymbolAndDecimals(
                                      shoplocalProduct[index].productPrice),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
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
                  ),
                )),
      ),
    );
  }
}
