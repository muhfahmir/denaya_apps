import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/utils.dart';

Widget myShimmer({required Widget child}) {
  return Shimmer.fromColors(
    baseColor: const Color(0xFFEDF3F6).withOpacity(0.5),
    highlightColor: const Color(0xFFEDF3F6),
    child: child,
  );
}

Widget stripLoading(context, {required int height, int width = 0}) {
  return myShimmer(
    child: Container(
      height: height as double,
      width: MediaQuery.of(context).size.width / 2 - width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
      ),
    ),
  );
}

Widget roundedLoading(context, {required int height, int width = 0}) {
  return myShimmer(
    child: Container(
      height: height as double,
      width: width as double,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
      ),
    ),
  );
}

Widget baseCard(context,
    {required Widget? image,
    required Widget child,
    double marginHorizontal = 15}) {
  return Container(
    height: 90.0,
    decoration: BoxDecoration(
      color: Colors.green,
    ),
    margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal, vertical: 20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
            color: DenayaColors.lightPrimary,
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: image ?? const SizedBox(),
        ),
        const SizedBox(
          width: 18.0,
        ),
        Expanded(
          child: child,
        ),
      ],
    ),
  );
}

class MyCardLoader extends StatelessWidget {
  final int lenghtItem;
  const MyCardLoader({super.key, this.lenghtItem = 2});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lenghtItem,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: DenayaColors.lightPrimary,
            borderRadius: BorderRadius.circular(2 as double),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: const Color(0xFF323247).withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 4,
              )
            ],
          ),
          child: myShimmer(
            child: baseCard(
              context,
              image: null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stripLoading(context, height: 15, width: 100)
                      .addMarginBottom(1),
                  stripLoading(context, height: 15, width: 120)
                      .addMarginBottom(10),
                  stripLoading(context, height: 15, width: 50),
                ],
              ),
            ),
          ),
        ).addMarginBottom(10);
      },
    );
  }
}

class MyCardLoaderList extends StatelessWidget {
  final int lenghtItem;
  const MyCardLoaderList({super.key, this.lenghtItem = 2});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lenghtItem,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            roundedLoading(context, height: 40, width: 40)
                .addMarginOnly(right: 10 as double),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  myShimmer(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        color: DenayaColors.lightPrimary,
                        borderRadius: BorderRadius.circular(2 as double),
                      ),
                    ),
                  ).addMarginBottom(10 as double),
                  stripLoading(context, height: 30, width: 50)
                      .addMarginBottom(20 as double),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
