import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../modules/leaderboard/controllers/LeaderboardController.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LeaderboardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LeaderboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
