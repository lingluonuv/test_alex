import 'package:cached_network_image/cached_network_image.dart';
import 'package:developer_alex/common/Themes/colors.dart';
import 'package:developer_alex/common/extensions/color.dart';
import 'package:developer_alex/common/widgets/clear_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'album_controller.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlbumController>(
        init: AlbumController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: ThemeColors.white,
            body: Stack(
              children: <Widget>[
                CustomScrollView(
                  slivers: [
                    ///top area
                    SliverToBoxAdapter(
                      child: _topWidget(controller),
                    ),

                    ///photos area
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1, mainAxisSpacing: 12, crossAxisSpacing: 12),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(imageUrl: controller.dispalyPhotos[index].thumbnailUrl ?? ''),
                          );
                        }, childCount: controller.dispalyPhotos.length),
                      ),
                    ),
                  ],
                ),
                const ClearAppBar(),
              ],
            ),
          );
        });
  }

  /// Top area
  Stack _topWidget(AlbumController controller) {
    return Stack(
      children: [
        _coverWidget(),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              _titleWidget(controller),
              _sectionTitleWidget(controller),
            ],
          ),
        ),
      ],
    );
  }

  /// Section title
  Container _sectionTitleWidget(AlbumController controller) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Text(
        'Total photos count (${controller.photos.length})',
        style: ThemeColors.dark.ts(17, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Title
  Container _titleWidget(AlbumController controller) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: RichText(
        text: TextSpan(
          text: controller.album.title ?? '',
          style: ThemeColors.white.ts(20, fontWeight: FontWeight.bold),
          children: [
            WidgetSpan(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 10,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                decoration: BoxDecoration(
                  color: ThemeColors.ff484c5b,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Albums',
                  style: ThemeColors.ffb4b8c7.ts(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  /// Cover
  Widget _coverWidget() {
    return SizedBox(
      height: 300 + Get.mediaQuery.padding.top,
      width: Get.width,
      child: Image.asset(
        'assets/images/album_cover.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
