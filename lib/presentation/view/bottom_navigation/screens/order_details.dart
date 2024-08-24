import 'dart:developer';
import 'dart:ui';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecom_app/config/app_colors.dart';
import 'package:ecom_app/config/app_constant.dart';
import 'package:ecom_app/config/app_image.dart';
import 'package:ecom_app/config/helper.dart';
import 'package:ecom_app/models/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Map orderDetail;

  const OrderDetailsScreen({super.key, required this.orderDetail});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  PanelController extraData = PanelController();
  Map<String, dynamic> orderPlaced = {};
  Map<String, dynamic> pickup = {};
  List<Map<String, dynamic>> inTransit = [];
  Map<String, dynamic> outForDelivery = {};
  Map<String, dynamic> delivered = {};
  bool isExpanded = false;
  double totalSum = 0;

  List<Map<String, String>> trackingDetails = [
    {
      "step": "Order Placed",
      "status": "order_placed",
    },
    {
      "step": "Ready for Pickup",
      "status": "ready_for_pickup",
    },
    {
      "step": "In Transit",
      "status": "in_transit",
    },
    {
      "step": "Order Delivered",
      "status": "order_delivered",
    },
  ];

  final GlobalKey _expandedKey = GlobalKey();
  double expandedHeight = 0.0;

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  String getFirstThreeWords(String input) {
    List<String> words = input.split(" ");
    if (words.length >= 3) {
      return words.sublist(0, 3).join(" ");
    } else {
      return input;
    }
  }

  void measureExpandedHeight() {
    final RenderBox renderBox =
        _expandedKey.currentContext!.findRenderObject() as RenderBox;
    final height = renderBox.size.height;

    setState(() {
      expandedHeight = height;
      log("qwerty:$expandedHeight");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: const Color(0xff111111),
        child: Stack(
          children: [
            Container(
              height: Get.height / 1.8,
              width: Get.width,
              foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xff111111).withOpacity(0),
                const Color(0xff111111).withOpacity(.65),
                const Color(0xff111111),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppImage.mapOne,
                      ),
                      fit: BoxFit.cover)),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                alignment: Alignment.topCenter,
                height: Get.height,
                width: Get.width,
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      surfaceTintColor: Colors.transparent,
                      leadingWidth: 0,
                      titleSpacing: 0,
                      centerTitle: false,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Order details',
                                    style: TextStyle(
                                      color: Color(0xFFFAFAFA),
                                      fontSize: 20,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    capitalizeFirstLetter('sazo'),
                                    style: const TextStyle(
                                      color: Color(0xFF6297FF),
                                      fontSize: 14,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 41,
                                  width: 41,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffffffff)
                                          .withOpacity(.10),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: kElevationToShadow[6]),
                                  child: Image.asset(
                                    AppImage.shareIcon,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 41,
                                  width: 41,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff333333),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: kElevationToShadow[6]),
                                  child: const Icon(
                                    Icons.more_horiz_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      expandedHeight: Get.height / 2.6,
                      collapsedHeight: Get.height / 2.6,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          height: Get.height / 2.6,
                          width: Get.width,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SlidingUpPanel(
              isDraggable: false,
              defaultPanelState: PanelState.OPEN,
              controller: extraData,
              minHeight: 0.0,
              maxHeight: Get.height / 1.4,
              panel: Container(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: kElevationToShadow[2]),
                                child: Image.asset(
                                  AppImage.orderTruck,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Order status',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      alignment: Alignment.center,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: const Color(0xfff3f3f3)
                                            .withOpacity(.22),
                                      ),
                                      child: const Text(
                                        'Paid',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Gilroy-Bold',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      alignment: Alignment.center,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: const Color(0xffA8FFD0)
                                              .withOpacity(.2)),
                                      child: Text(
                                        capitalizeFirstLetter('placed'),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Color(0xffA8FFD0),
                                          fontSize: 12,
                                          fontFamily: 'Gilroy-Bold',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8),
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (orderPlaced.isNotEmpty)
                                  Container(
                                    alignment: Alignment.center,
                                    height: 28,
                                    width: 28,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primary),
                                    child: const Icon(
                                      CupertinoIcons.checkmark_alt,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (orderPlaced.isNotEmpty)
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Order Placed"),
                                        Text(
                                          "jaipur, 22 August, 2024",
                                          style: TextStyle(
                                            color: Color(0xFF959499),
                                            fontSize: 12,
                                            fontFamily: 'Gilroy-Medium',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  if (orderPlaced.isNotEmpty)
                                    const SizedBox(
                                      height: 25,
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const DottedLine(
                        direction: Axis.horizontal,
                        lineLength: double.infinity,
                        lineThickness: 1,
                        dashLength: 5,
                        dashColor: Color(0xff5A5A5A),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: kElevationToShadow[2]),
                                    child: Image.asset(
                                      AppImage.orderBag,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Text(
                                    'Order summary',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1,
                            dashLength: 5,
                            dashColor: Color(0xff5A5A5A),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            height: 60,
                            width: Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              widget.orderDetail["image"]),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      truncateString(
                                          widget.orderDetail["title"], 20),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Gilroy-SemiBold',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Variant:  ${widget.orderDetail["size"]}',
                                      style: const TextStyle(
                                        color: Color(0xFFD6D6D6),
                                        fontSize: 12,
                                        fontFamily: 'Gilroy-Medium',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rs ${removeCurrencySymbolAndDecimals(widget.orderDetail["price"])}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xFFFAFAFA),
                                        fontSize: 16,
                                        fontFamily: 'Gilroy-SemiBold',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${widget.orderDetail["qty"]} unit',
                                      style: const TextStyle(
                                        color: Color(0xFFD6D6D6),
                                        fontSize: 12,
                                        fontFamily: 'Gilroy-Medium',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1,
                            dashLength: 5,
                            dashColor: Color(0xff5A5A5A),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Rs.${widget.orderDetail["price"]}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Paid Amount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Rs.${widget.orderDetail["price"]}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1,
                            dashLength: 5,
                            dashColor: Color(0xff5A5A5A),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: kElevationToShadow[2]),
                                    child: Image.asset(
                                      AppImage.orderRupees,
                                      height: 15,
                                      width: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Text(
                                    'Payment Details',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      alignment: Alignment.center,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xfff3f3f3)
                                            .withOpacity(.22),
                                      ),
                                      child: const Text(
                                        'Paid',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Gilroy-Bold',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1,
                            dashLength: 5,
                            dashColor: Color(0xff5A5A5A),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Payment method',
                                style: TextStyle(
                                  color: Color(0xFF9C9C9C),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'UPI',
                                style: TextStyle(
                                  color: Color(0xFF9C9C9C),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Paid via',
                                style: TextStyle(
                                  color: Color(0xFF9C9C9C),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                  height: 0.11,
                                ),
                              ),
                              Text(
                                "G-Pay",
                                style: TextStyle(
                                  color: Color(0xFF9C9C9C),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1,
                            dashLength: 5,
                            dashColor: Color(0xff5A5A5A),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Shipping address',
                                style: TextStyle(
                                  color: Color(0xFFFAFAFA),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$userName,",
                                style: const TextStyle(
                                  color: Color(0xFF9C9C9C),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: Get.width - 50,
                                child: Text(
                                  '${widget.orderDetail["shippingAddress"]}.',
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Color(0xFF9C9C9C),
                                    fontSize: 14,
                                    fontFamily: 'Gilroy-Medium',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              const Text(
                                'Billing address',
                                style: TextStyle(
                                  color: Color(0xFFFAFAFA),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Same as shipping address',
                                style: TextStyle(
                                  color: Color(0xFF959499),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
