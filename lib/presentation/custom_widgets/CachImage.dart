import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/image_place_holder.dart';

class CachImage extends StatelessWidget {
  final String url;
//  final String errorImage;
  final double raduce;
  final double? width;
  final double? hight;
  final BoxFit? boxFit;

  const CachImage({
    Key? key,
    required this.url,
   //  this.errorImage='lib/assets/placeholder.jpg',
      this.raduce =0,
    this.width,
    this.hight,
    this.boxFit,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      imageUrl: url,

      imageBuilder: (context, imageProvider) {

       return Container(
          height: hight,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(raduce),
            // color: Colors.red,
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit ?? BoxFit.fill,
            ),
          ),
        );



      },
      placeholder: (context, url) =>  ImagePlaceHolder(width: width),
      errorWidget: (context, url, error) => Container(

        height: hight,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduce),
         // color: Colors.black,
          image: DecorationImage(
            image: AssetImage('lib/assets/images/png/Placeholder.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}