import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/leaderboard/controllers/LeaderboardController.dart';

class LeaderboardPage extends StatelessWidget {
  final LeaderboardController leaderboardController =
      Get.put(LeaderboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
      body: Obx(() {
        if (leaderboardController.leaderboard.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: leaderboardController.leaderboard.length,
            itemBuilder: (context, index) {
              final entry = leaderboardController.leaderboard[index];
              return ListTile(
                title: Text(entry['name']),
                trailing: Text('Score: ${entry['score']}'),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          leaderboardController.addScore("New Player", 120);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
