import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/screens/product_check_out.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:ecom_app/config/helper.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    super.key,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  PanelController panelController = PanelController();
  PanelController signInController = PanelController();
  PanelController policyController = PanelController();

  List options = ["S", "M", "L", "XL", "XXL"];

  String selectedSize='S';

  List images = [
    AppImage.detailedProductImage,
    AppImage.detailedProductImage,
    AppImage.detailedProductImage
  ];

  int _index = 0;
  int tappedIndex = 0;

  Map<String, String?> selectedValues = {};
  Map<String, dynamic> variantData = {};

  bool forSignIn = true;
  bool isShowOpacity = false;
  bool isPanelOpen = false;
  bool isFav = false;
  bool isCart = false;
  bool isShow = true;
  bool isPro = false;
  bool isShip = false;
  bool isRefund = false;
  String price = "";

  late ScrollController refundC;

  late ScrollController shipC;

  @override
  void initState() {
    super.initState();
    initTask();
  }

  Future<void> initTask() async {
    refundC = ScrollController();
    shipC = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    refundC.dispose();
    shipC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                scrollDirection: Axis.vertical,
                viewportFraction: 1,
                height: size.height,
                onPageChanged: (index, _) {
                  setState(() {
                    _index = index;
                  });
                }),
            items: [
              for (var i in images)
                Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            i,
                          ),
                          fit: BoxFit.cover)),
                )
            ],
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.back();
                  },
                  child: Card(
                    color: Colors.transparent,
                    margin: EdgeInsets.zero,
                    shadowColor: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          alignment: Alignment.center,
                          height: 41,
                          width: 41,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff).withOpacity(.45),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Card(
                              color: Colors.transparent,
                              margin: EdgeInsets.zero,
                              shadowColor: Colors.transparent,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(10),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 41,
                                    width: 41,
                                    decoration: BoxDecoration(
                                      // color: Colors.transparent,
                                      color: const Color(0xffffffff)
                                          .withOpacity(.45),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.favorite,
                              color: (isFav)
                                  ? const Color(0xffF04E4E)
                                  : Colors.transparent,
                              size: 25,
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.black.withOpacity(.8),
                              size: 26,
                            ),
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
          )),
          Positioned(
            bottom: size.height / 4,
            right: size.width / 16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  images.length,
                  (i) => Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: i == _index ? 15 : 6.5,
                          height: i == _index ? 15 : 6.5,
                          decoration: BoxDecoration(
                            color: i == _index
                                ? Colors.transparent
                                : AppColors.white,
                            shape: BoxShape.circle,
                            border: i != _index
                                ? null
                                : Border.all(
                                    width: 1.5,
                                    color: AppColors.white,
                                  ),
                          ),
                        ),
                      )),
            ),
          ),
          SlidingUpPanel(
            isDraggable: true,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            backdropTapClosesPanel: true,
            backdropEnabled: true,
            backdropOpacity: 0,
            controller: panelController,
            color: Colors.transparent,
            minHeight: size.height / 5.5,
            maxHeight: size.height / 1.37,
            panel: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: kDefaultPaddingX(context)),
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  color: Color(0xff0B0D17)),
              child: SingleChildScrollView(
                physics: ((Get.height <= 670.0))
                    ? const ClampingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (isPanelOpen) {
                          panelController.close();
                          setState(() {});
                        } else {
                          panelController.open();
                          setState(() {
                            isPanelOpen = true;
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 6,
                                width: 50,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF707070),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: ClipOval(
                            child: Image.asset(AppImage.sazoLogo),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width / 2,
                              child: const Text(
                                "OUT OF SERVICE CO-ORD SET - FULL SET",
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '₹ ${removeCurrencySymbolAndDecimals("7,599")}',
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(0.8999999761581421),
                                fontSize: 20,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.20,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 62,
                          width: 62,
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.antiAlias,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(1),
                                          width: 1.2,
                                          strokeAlign:
                                              BorderSide.strokeAlignOutside)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 3.5),
                                    child: Image.asset(
                                      AppIcon.cartIcon,
                                      scale: 3.8,
                                      fit: BoxFit.cover,
                                      color: Colors.white.withOpacity(1),
                                    ),
                                  ),
                                ),
                              ),
                              (isCart)
                                  ? Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff3D7EFF)),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    if (isShow)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  truncateString("Size", 20),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: const ScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: options.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            tappedIndex = i;
                                            selectedSize=options[tappedIndex];
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          alignment: Alignment.center,
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xffffffff)
                                                .withOpacity(0.1),
                                            border: Border.all(
                                                color: (tappedIndex == i)
                                                    ? AppColors.primary
                                                    : Colors
                                                        .transparent // Active color,
                                                ),
                                          ),
                                          child: Text(
                                            options[i],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Gilroy-SemiBold',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Get.to(()=>ProductCheckOut(size: selectedSize,));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xFF3D7EFF),
                                  border: Border.all(
                                      color: const Color(0xFF3D7EFF),
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                      width: 0.5)),
                              child: const Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 20, left: 22, right: 22, bottom: 20),
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    const Color(0xffffffff).withOpacity(.08)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    isPro = true;
                                    policyController.open();
                                    setState(() {});
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'About the Product',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontWeight: FontWeight.w400,
                                          height: 0.07,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                DottedLine(
                                  dashGapLength: 4,
                                  dashLength: 7,
                                  lineThickness: 2,
                                  direction: Axis.horizontal,
                                  dashColor:
                                      const Color(0xffffffff).withOpacity(0.1),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    isRefund = true;
                                    policyController.open();
                                    setState(() {});
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Returns & Refund Policy',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontWeight: FontWeight.w400,
                                          height: 0.07,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                DottedLine(
                                  dashGapLength: 4,
                                  dashLength: 7,
                                  lineThickness: 2,
                                  direction: Axis.horizontal,
                                  dashColor:
                                      const Color(0xffffffff).withOpacity(0.1),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    isShip = true;
                                    policyController.open();
                                    setState(() {});
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Shipping Policy',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontWeight: FontWeight.w400,
                                          height: 0.07,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            onPanelSlide: (val) {
              if (val >= 0.05) {
                isShow = true;
                setState(() {});
              } else {
                isShow = false;
                setState(() {});
              }
            },
            onPanelClosed: () {
              setState(() {
                isPanelOpen = false;
              });
            },
          ),
          SlidingUpPanel(
            isDraggable: true,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            backdropTapClosesPanel: true,
            backdropEnabled: true,
            backdropOpacity: 0,
            color: Colors.transparent,
            minHeight: 0,
            maxHeight:
                (Get.height <= 670.0) ? Get.height / 1.4 : Get.height / 1.3,
            controller: policyController,
            panel: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: const Color(0xff0B0D17).withOpacity(1),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      )),
                  child: Column(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          policyController.close();
                        },
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 6,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF707070),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                      if (isPro)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'About the Product',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        policyController.close();
                                        setState(() {});
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 22,
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Sazo is a brand of independent creators that draws inspiration from all that the human eye can witness! Born during the pandemic in 2020, it is an outcome of abstract involuntary creativity, which explores all aspects of curiosity, driven by a strong urge to create.",
                              style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 14,
                                fontFamily: 'Gilroy-Medium',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.28,
                              ),
                            )
                          ],
                        ),
                      if (isRefund)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Returns & Refund\nPolicy',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        policyController.close();
                                        setState(() {});
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 22,
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: Get.height / 1.8,
                              width: Get.width,
                              child: RawScrollbar(
                                thumbVisibility: true,
                                thumbColor: const Color(0xff3E3E3E),
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26)),
                                interactive: true,
                                trackVisibility: true,
                                thickness: 5,
                                trackColor: Colors.transparent,
                                controller: refundC,
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.zero,
                                  physics: const ClampingScrollPhysics(),
                                  controller: refundC,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      sazoReturnAndRefundPolicy(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (isShip)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Shipping Policy',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        policyController.close();
                                        setState(() {});
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 22,
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: Get.height / 1.8,
                              width: Get.width,
                              child: RawScrollbar(
                                thumbVisibility: true,
                                thumbColor: const Color(0xff3E3E3E),
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26)),
                                interactive: true,
                                trackVisibility: true,
                                thickness: 5,
                                trackColor: Colors.transparent,
                                controller: shipC,
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.zero,
                                  physics: const ClampingScrollPhysics(),
                                  controller: shipC,
                                  child: Column(
                                    children: [wholeShippingPolicy()],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            onPanelClosed: () {
              isPro = false;
              isShip = false;
              isRefund = false;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Column wholeShippingPolicy() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "WholeSquared is a curated marketplace where brands and buyers connect on our platform through our website. WholeSquared does not ship, own, or make any of the products listed on the website. Each product you purchase on our website is sent directly to you by the brands. Brands at WholeSquared are committed to deliver your order in good quality packaging. We ship throughout the week except Sundays & public holidays. Shipping within India is FREE for all orders above Rs.5,000.\n\nWe believe each product has its own creation lifecycle due to the nature of artisanal brands and hence the shipping timelines would vary. Orders are usually dispatched within 7 working days. Most orders are delivered within 4 to 6 working days from the date of dispatch. Delivery of all orders will be duly done to the shipping address as mentioned by you at the time of placing the order.\n\nOur logistic partners will be able to deliver your order between Monday-Saturday - 9am to 7pm. Delivery time is subject to factors beyond our control including unexpected travel delays from our logistic partners and transporters due to weather conditions and strikes.",
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 14,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.28,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
            text:
                "If you think you have received the product in a bad condition please email us at ",
            style: TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: 14,
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.28,
            ),
          ),
          TextSpan(
            text: "contact@thewholesquared.com ",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.28,
            ),
          ),
          TextSpan(
            text:
                "mentioning your Order ID & attach the images of the product. Please make sure that the original product label and packing is intact when you send us the product back.",
            style: TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: 14,
              fontFamily: 'Gilroy-Medium',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.28,
            ),
          ),
        ])),
        SizedBox(
          height: 35,
        ),
        Text(
          'Product Disclaimer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Gilroy-SemiBold',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Handmade Products',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Gilroy-SemiBold',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.20,
          ),
        ),
        Text(
          "Several products on WholeSquared are handcrafted. Handcrafting process means it is one-of-a-kind piece for you and there may be small variations from what is shown in the image on website. This wouldn’t be considered as a defect.",
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 14,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.28,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Colour Variations',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Gilroy-SemiBold',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.20,
          ),
        ),
        Text(
          "Due to the many variations in computers, smartphones, and browsers, colors may appear slightly different on different electronic screens. As a result, slight shade variance between the product images on the website and the product should be expected.",
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 14,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.28,
          ),
        ),
      ],
    );
  }

  Column sazoReturnAndRefundPolicy() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Return',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Gilroy-SemiBold',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.20,
          ),
        ),
        Text(
          "Products purchased at sazo are not eligible for returns of any kind",
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 14,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.28,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Exchange',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Gilroy-SemiBold',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.20,
          ),
        ),
        Text(
          "Your order is eligible for exchange only if\n• An incorrect order/size was sent to you (in this case a reverse shipment will be scheduled by us from your address to ours and the correct order will be shipped to you).\n• If the product is damaged or has any manufacturing defect.\n• Customized/made to order  products and products purchased on discount /sale are not eligible for exchange unless an incorrect order/damaged product was sent to you",
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 14,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.28,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Procedure for Exchange –',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Gilroy-SemiBold',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.20,
          ),
        ),
        Text(
          "• Within 3 days of receiving the shipment, write to us at sazo.info@gmail.com mentioning your order number and reason for exchange.\n• Our team will get back to you in a day or two and arrange a pick up for the product to be exchanged. Cost of the courier sent to us will be borne by you. Cost of shipping the exchanged garment to you will be borne by us.\n• The product to be exchanged must be dispatched to our studio within 3 days of acceptance of exchange.\n• Please ensure that the product you return is unused and unworn with the original tags intact. Once we receive the product, please allow us a few days to inspect it for any signs of wear and tear, following which we will process your exchange.",
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 14,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.28,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Please Note : ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Gilroy-SemiBold',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.20,
          ),
        ),
        Text(
          "Products exchanged once will not be exchanged a second time. International orders aren't eligible for returns or exchanges due to logistical reasons.",
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 14,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.28,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Order Cancellations',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Gilroy-SemiBold',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.20,
          ),
        ),
        Text(
          "Once the order is placed and confirmed by us, the order cannot be cancelled unless the above reasons apply.\nSazo holds every right to cancel an order, at any point of time/for any reason whatsoever, in which case a refund will be issued to the customer. The time taken for the refunded amount to reflect in your account varies according to your bank/geographical location.\nCustomized orders and orders purchased on sale/discount cannot be cancelled.",
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 14,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.28,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Disclaimer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Gilroy-SemiBold',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.20,
          ),
        ),
        Text(
          "• Products purchased on sale/discount are not eligible for returns or exchanges as they are final sale.\n• Customized/made to order products once made cannot be exchanged or returned. In case of any issues with your customized order, please mail us with necessary information and our production team will help you.\n• Pieces to be exchanged will only be accepted after discussing the same on mail sazo.info@gmail.com. Any outfits sent to us without prior discussion on mail will not be accepted, and the piece would have to be picked up by the customer.",
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 14,
            fontFamily: 'Gilroy-Medium',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.28,
          ),
        ),
      ],
    );
  }
}
