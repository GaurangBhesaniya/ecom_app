import 'package:flutter/material.dart';


class ProfileCard extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String icon;

  const ProfileCard(
      {super.key, this.onTap, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      color: Colors.transparent,
                      elevation: 5,
                      child: Container(
                        alignment: Alignment.center,
                        width: 32,
                        height: 32,
                        decoration: ShapeDecoration(
                          color: const Color(0xff0B0C16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: LinearGradient(
                              begin: const Alignment(-0.15, 0.99),
                              end: const Alignment(0.15, -0.99),
                              colors: [
                                const Color(0xFF0B0C16).withOpacity(.5),
                                const Color(0xFF20345F).withOpacity(.5),
                                const Color(0xFF2F5092).withOpacity(.5)
                              ],
                            ),
                          ),
                          child: ImageIcon(AssetImage(icon),
                              color: const Color(0xff3D7EFF), size: 17),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Gilroy-Medium',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                if(title != "Sign Out")
                const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 14,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(
              color: (title == "Sign Out")
                  ? Colors.transparent
                  : const Color(0x4C6297FF),
              thickness: 0.75,
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
