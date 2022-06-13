import 'package:developer_alex/network/apis/album.dart';
import 'package:developer_alex/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../entitys/album_entity.dart';
import '../../entitys/user_entity.dart';
import 'detail_page.dart';

class DetailController extends GetxController {

  /// The globale key for SliverAnimatedListState
  final GlobalKey<SliverAnimatedListState> animatedListKey = GlobalKey<SliverAnimatedListState>();

  /// Args
  late UserEntity user;

  /// The true means the list folded
  bool fold = false;

  /// List for display
  List<AlbumEntity> albums = <AlbumEntity>[];

  /// Original data source
  List<AlbumEntity> totalList = <AlbumEntity>[];

  @override
  void onInit() {
    super.onInit();
    user = Get.arguments;
    loadData();
  }

  /// Load albums from api
  Future<dynamic> loadData() async {
    try {
      List res = await AlbumApi.getAlbumList(userId: user.id ?? 0);
      totalList = res.map((e) => AlbumEntity.fromJson(e)).toList();
      for (int i=0;i<res.length;i++) {
        AlbumEntity album = AlbumEntity.fromJson(res[i]);
        albums.insert(i, album);
        animatedListKey.currentState?.insertItem(i);
      }
      update();
    }catch (e) {
      print('$e');
    }
  }

  /// On fold btn clicked
  void onFold() {
    fold = !fold;
    if (fold) {
      for (int i = totalList.length-1;i>=0;i--) {
        albums.removeAt(i);
        animatedListKey.currentState?.removeItem(i, (context, animation) => DetailAnimatedItem(index: i,controller: this, animation: animation,album: totalList[i],));
      }
    }else {
      for (int i=0;i<totalList.length;i++) {
        albums.insert(i, totalList[i]);
        animatedListKey.currentState?.insertItem(i);
      }
    }
    update();
  }

  /// To Album
  void toAlbumPage({required AlbumEntity data}) {
    Get.toNamed(AppRouter.album,arguments: data);
  }

}