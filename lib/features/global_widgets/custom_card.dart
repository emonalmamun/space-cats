import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';

class CustomCard extends StatelessWidget {
  final IconData? myIcon;
  final String? svgString;
  final String title;
  const CustomCard({Key? key, this.svgString, required this.title, this.myIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 1,
      child: Container(
        height: size.height*0.18,
        width: size.width*0.280,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Stack(
          children: [
            Positioned(
               top: 30,
               left: 0,
               right: 0,
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(color: AppColors.yellow100, shape: BoxShape.circle),
                child: svgString != null ?
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(svgString!, alignment: Alignment.center, color: AppColors.primaryColor,),
                )
                    :
                Icon(myIcon!,size: 48,color: AppColors.primaryBlue,),
              )
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom:5,
              child: Text(title,overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.primaryColor, fontSize: AppSizes.size12),textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}
