import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:string_art/constants/assets/constants.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/app_text.dart';
import 'package:string_art/utils/custom_appbar.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final List<String> imageUrls = [
    'https://www.onevasco.com/ind/en/assets/img/home/destinations/Switzerland.jpg',
    'https://www.onevasco.com/ind/en/assets/img/home/vasco-works.jpg',
    'https://ctbstorage.blob.core.windows.net/dev/1729158125763_pxfuel.jpg',
    'https://www.onevasco.com/ind/en/assets/img/home/review/Laila-Ahmad-Thumb.png',
    'https://www.onevasco.com/ind/en/assets/img/home/destinations/germany.jpg',
    'https://ctbstorage.blob.core.windows.net/dev/1729158125763_pxfuel.jpg',
    'https://www.onevasco.com/ind/en/assets/img/home/vasco-works.png',
    'https://www.onevasco.com/ind/en/assets/img/home/review/Analiza-Tapungot-Thumb.png',
    'https://www.onevasco.com/ind/en/assets/img/home/destinations/Switzerland.jpg',
    'https://www.onevasco.com/ind/en/assets/img/home/TravelExpGirl.png',
    ConstantImage.appLogo,
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: texts.album,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: screenWidth > 600 ? 6 : 4,
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: appColors.appWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: boxShadow(),
                border: Border.all(width: 1, color: appColors.lightColor),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: imageUrls[index],
                  placeholder: (context, url) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      ConstantImage.appLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  errorWidget: (context, url, error) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      ConstantImage.appLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
      ),
    );
  }
}
