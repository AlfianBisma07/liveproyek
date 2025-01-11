import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/api_controller.dart';

class CategoryScreen extends StatelessWidget {
  final ApiController apiController = Get.put(ApiController());
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    apiController.fetchCategories();
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: idController,
                  decoration: InputDecoration(labelText: 'ID'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final id = int.tryParse(idController.text);
                    final name = nameController.text;

                    if (id != null) {
                      apiController.addCategory(id, name);
                    } else {
                      print("Invalid ID");
                    }
                  },
                  child: Text("Add Category"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (apiController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: apiController.categories.length,
                  itemBuilder: (context, index) {
                    final category = apiController.categories[index];
                    return ListTile(
                      title: Text(category.name),
                      subtitle: Text("ID: ${category.id}"),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
