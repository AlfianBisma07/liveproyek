import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LeaderboardController extends GetxController {
  var leaderboard = <Map<String, dynamic>>[].obs;
  final String apiUrl = 'http://127.0.0.1:3000/leaderboard';

  Future<void> fetchLeaderboard() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/leaderboard'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      leaderboard.value = List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load leaderboard');
    }
  }

  Future<void> addScore(String name, int score) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"name": name, "score": score}),
      );
      if (response.statusCode == 201) {
        fetchLeaderboard();
        Get.snackbar('Success', 'Score added successfully');
      } else {
        Get.snackbar('Error', 'Failed to add score');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchLeaderboard();
  }
}
