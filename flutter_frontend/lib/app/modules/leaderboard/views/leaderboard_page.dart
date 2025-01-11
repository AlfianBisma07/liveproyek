import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/leaderboard/controllers/LeaderboardController.dart';

class LeaderboardPage extends StatelessWidget {
  final LeaderboardController leaderboardController =
      Get.put(LeaderboardController());

  @override
  Widget build(BuildContext context) {
    leaderboardController.fetchLeaderboard();
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaderboard"),
      ),
      body: Obx(() {
        if (leaderboardController.leaderboard.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: leaderboardController.leaderboard.length,
          itemBuilder: (context, index) {
            var item = leaderboardController.leaderboard[index];
            return ListTile(
              title: Text(item['name']),
              subtitle: Text('Score: ${item['score']}'),
            );
          },
        );
      }),
    );
  }
}
