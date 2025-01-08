import 'package:cached_network_image/cached_network_image.dart';

import '../art_core.dart';
import 'app_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({super.key, this.urlImage, this.width, this.height,this.fit,this.color});
  final String? urlImage;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage ?? "",color: color,
      width: width,
      height: height,
      fit:fit,
      fadeInDuration: const Duration(seconds: 1),
      progressIndicatorBuilder: (context, url, downloadProgress) =>  const Center(
        child: SizedBox(
          height: 25,width: 25,
          child: CircularProgressIndicator(

            valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),

          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
