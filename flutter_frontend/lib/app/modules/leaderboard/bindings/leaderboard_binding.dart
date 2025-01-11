import 'package:get/get.dart';

import '../../../modules/leaderboard/controllers/LeaderboardController.dart';

class LeaderboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaderboardController>(
      () => LeaderboardController(),
    );
  }
}
