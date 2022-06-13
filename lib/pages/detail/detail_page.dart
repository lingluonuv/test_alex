import 'package:developer_alex/common/Themes/colors.dart';
import 'package:developer_alex/common/extensions/color.dart';
import 'package:developer_alex/common/layout/spacing.dart';
import 'package:developer_alex/common/widgets/clear_app_bar.dart';
import 'package:developer_alex/entitys/album_entity.dart';
import 'package:developer_alex/pages/detail/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ThemeColors.white,
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [

                  ///top area
                  SliverToBoxAdapter(
                    child: _topWidget(controller),
                  ),

                  ///section title
                  SliverToBoxAdapter(
                    child: _sectionTitleWidget(controller),
                  ),

                  ///albums
                  SliverAnimatedList(
                    key: controller.animatedListKey,
                    initialItemCount: controller.albums.length,
                    itemBuilder: (context, index, animation) =>
                        DetailAnimatedItem(index:index, controller:controller, animation:animation,album: controller.albums[index],),
                  ),

                  ///
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        'Height Indicator',
                        style: ThemeColors.ff0500ff.ts(12),
                      ),
                    ),
                  ),
                ],
              ),
              const ClearAppBar(),
            ],
          ),
        );
      },
    );
  }


  /// Section title
  Padding _sectionTitleWidget(DetailController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Row(
        children: [
          Text(
            'Album',
            style: ThemeColors.dark.ts(18, fontWeight: FontWeight.bold),
          ),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: controller.onFold,
            child: Icon(
              controller.fold ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined,
              color: ThemeColors.ff969797,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  /// Top area
  Stack _topWidget(DetailController controller) {
    return Stack(
      children: [
        _coverWidget(),
        Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 127 + Get.mediaQuery.padding.top,
                ),
                Container(
                  width: Get.width,
                  height: 180,
                  decoration: const BoxDecoration(
                      color: ThemeColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 97 + Get.mediaQuery.padding.top,
                ),
                _userInfoWidget(controller)
              ],
            ),
          ],
        )
      ],
    );
  }

  /// User Info
  Container _userInfoWidget(DetailController controller) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRect(
                child: Image.asset(
                  'assets/images/user_avatar.png',
                  height: 72,
                  width: 72,
                  fit: BoxFit.cover,
                ),
              ),
              Spacing.hs(10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing.vs(28 + 8),
                  Text(
                    controller.user.name ?? '',
                    style: ThemeColors.dark.ts(16, fontWeight: FontWeight.bold),
                  ),
                  Spacing.vs(2),
                  Text(
                    controller.user.email ?? '',
                    style: ThemeColors.ffa4a4a4.ts(12),
                  ),
                ],
              )),
            ],
          ),
          Spacing.vs(16),
          Text(
            '${controller.totalList.length}',
            style: ThemeColors.dark.ts(48, fontWeight: FontWeight.bold),
          ),
          Spacing.vs(8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
            decoration: BoxDecoration(
              color: ThemeColors.ffefefef,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Total Albums',
              style: ThemeColors.ff8d8d8d.ts(12),
            ),
          ),
        ],
      ),
    );
  }

  /// Cover
  Widget _coverWidget() {
    return SizedBox(
      height: 186 + Get.mediaQuery.padding.top,
      width: Get.width,
      child: Image.asset(
        'assets/images/detail_cover.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class DetailAnimatedItem extends StatelessWidget {

  const DetailAnimatedItem({required this.index,required this.controller,required this.animation,required this.album,Key? key}) : super(key:key);

  final int index;
  final DetailController controller;
  final Animation<double> animation;
  final AlbumEntity album;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: _item(album: album),
    );
  }

  /// Item of album list
  Widget _item({required AlbumEntity album}) {
    return InkWell(
      onTap: () {
        controller.toAlbumPage(data: album);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 21),
        decoration: BoxDecoration(
          color: ThemeColors.fff8f8f8,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                album.title ?? '',
                style: ThemeColors.dark.ts(12, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacing.hs(10),
            const Icon(
              Icons.more_horiz,
              color: ThemeColors.ff969797,
              size: 10,
            ),
          ],
        ),
      ),
    );
  }

}
