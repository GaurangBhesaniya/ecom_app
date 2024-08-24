import 'dart:ui';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:ecom_app/config/helper.dart';
import 'package:ecom_app/presentation/common_widgets/custom_slider_button.dart';
import 'package:ecom_app/presentation/view/bottom_navigation/screens/payment_done.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductCheckOut extends StatefulWidget {
  final String size;

  const ProductCheckOut({
    super.key,
    required this.size,
  });

  @override
  State<ProductCheckOut> createState() => _ProductCheckOutState();
}

class _ProductCheckOutState extends State<ProductCheckOut> {
  int qty = 1;
  int gstCharges = 0;
  int shippingCharges = 60;
  int couponDiscount = 50;
  double totalPayable = 7599.0;
  bool isCount = false;
  List<Map<String, dynamic>> orderItems = [];
  List<Map<String, dynamic>> transactions = [];

  bool isValidate = false;
  List searchAddType = [];
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: Get.height,
            width: Get.width,
            color: AppColors.backgroundColor,
            child: SafeArea(
              child: CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  if (!isShow)
                    SliverAppBar(
                      primary: false,
                      surfaceTintColor: Colors.transparent,
                      pinned: true,
                      centerTitle: false,
                      backgroundColor: AppColors.backgroundColor,
                      elevation: 0,
                      leadingWidth: 10,
                      titleSpacing: 20,
                      leading: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      title: const Text(
                        'Checkout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Gilroy-SemiBold',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isShow)
                          const SizedBox(
                            height: 50,
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Shipping Address',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Gilroy-SemiBold',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                            letterSpacing: 0.68,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            width: Get.width,
                            height: 105,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(.08)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      capitalizeFirstLetter("home"),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontWeight: FontWeight.w400,
                                          height: 0),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: Get.width / 1.45,
                                      child: Text(
                                        capitalizeFirstLetter(
                                            "20, Anand Nagar, Near Purvi Soc, Hirabaug, Varachha Road, Surat."),
                                        maxLines: 3,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Gilroy-Regular',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(bottom: 25),
                                  height: 36,
                                  width: 36,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff0d0e1a)),
                                  child: SvgPicture.asset(
                                      AppSvg.addressEditIcon,
                                      fit: BoxFit.cover,
                                      height: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Order List ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: '(1)',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-Regular',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 91,
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      pop(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 85,
                                      width: 64,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          AppImage.productOne,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'SAZO',
                                        style: TextStyle(
                                          color: Color(0xE5899CC1),
                                          fontSize: 12,
                                          fontFamily: 'Gilroy-Medium',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.20,
                                        ),
                                      ),
                                      SizedBox(
                                          width: Get.width / 2,
                                          child: Text.rich(TextSpan(children: [
                                            TextSpan(
                                              text:
                                                  'OUT OF SERVICE CO-ORD SET - FULL SET'
                                                      .toUpperCase(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: 'Gilroy-SemiBold',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " (${widget.size})",
                                              style: const TextStyle(
                                                color: Color(0xFF6297FF),
                                                fontSize: 14,
                                                fontFamily: 'Gilroy-SemiBold',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ]))),
                                      const SizedBox(height: 3),
                                      Text(
                                        'Rs ${removeCurrencySymbolAndDecimals("${(totalPayable * qty)}")}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Color(0xFFBBBBBB),
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: 32,
                                width: 62,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white.withOpacity(.08),
                                ),
                                child: PopupMenuButton<int>(
                                  constraints: const BoxConstraints(
                                      minWidth: 62, maxHeight: 250),
                                  offset: const Offset(0, 25),
                                  position: PopupMenuPosition.under,
                                  color: AppColors.backgroundColor,
                                  initialValue: 1,
                                  onSelected: (int value) {
                                    setState(() {
                                      qty = value;
                                    });
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return List.generate(5, (index) {
                                      return PopupMenuItem<int>(
                                        value: index + 1,
                                        child: Center(
                                          child: Text(
                                            '${index + 1}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        qty.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-Medium',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.blue,
                                        // Change to your desired color
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          height: 255,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.08)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Amount',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Gilroy-Medium',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.68,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '₹ ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'SF Pro',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.68,
                                          ),
                                        ),
                                        TextSpan(
                                          text: (totalPayable * qty)
                                              .toString()
                                              .replaceAll(RegExp(r'\.0+$'), ''),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Gilroy-SemiBold',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.68,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'GST charges',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Gilroy-Medium',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.68,
                                    ),
                                  ),
                                  Text(
                                    '$gstCharges%',
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.68,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Shipping (Regular)',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Gilroy-Medium',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.68,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '₹',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'SF Pro',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.68,
                                          ),
                                        ),
                                        TextSpan(
                                          text: removeCurrencySymbolAndDecimals(
                                              shippingCharges.toString()),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Gilroy-SemiBold',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.68,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Coupon discount',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Gilroy-Medium',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.68,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: ' - ₹',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'SF Pro',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.68,
                                          ),
                                        ),
                                        TextSpan(
                                          text: removeCurrencySymbolAndDecimals(
                                              couponDiscount.toString()),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Gilroy-SemiBold',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.68,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: DottedLine(
                                    dashColor: Colors.white.withOpacity(.8),
                                  ))
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Gilroy-Medium',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.68,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '₹ ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'SF Pro',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.68,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ((totalPayable * qty) +
                                                  gstCharges.toDouble() +
                                                  shippingCharges.toDouble() -
                                                  couponDiscount.toDouble())
                                              .toString()
                                              .replaceAll(RegExp(r'\.0+$'), ''),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Gilroy-SemiBold',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.68,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 7,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            width: Get.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: AppColors.backgroundColor),
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.transparent,
              width: Get.width,
              child: CustomSliderButton(
                bgColor: const Color(0xff3D7EFF),
                innerRad: 12,
                outerRad: 16,
                sliderWidth: 137,
                sliderColor: const Color(0xff1F2531),
                onSlide: () {
                  Get.to(() => const PaymentProcessingDialog(),
                      fullscreenDialog: true);
                  Future.delayed(const Duration(seconds: 3), () {
                    Get.off(() => PaymentDoneScreen(
                          size: widget.size,
                          price:
                              "${(totalPayable * qty) + gstCharges.toDouble() + shippingCharges.toDouble() - couponDiscount.toDouble()}",
                          qty: qty.toString(),
                        ));
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Payable",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Gilroy-Bold',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "₹ ${(totalPayable * qty) + gstCharges.toDouble() + shippingCharges.toDouble() - couponDiscount.toDouble()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Gilroy-Regular',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: !isShow,
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {},
            child: AnimatedOpacity(
                opacity: isShow ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 60),
                    alignment: Alignment.topLeft,
                    height: Get.height,
                    width: Get.width,
                    color: Colors.black.withOpacity(0.2),
                    child: Row(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Gilroy-SemiBold',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ],
    ));
  }
}
