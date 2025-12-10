import 'package:flutter/material.dart';
import 'api/api_service.dart';
import 'models/fruit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameCtrl = TextEditingController();

  Future<List<Fruit>>? fruitList;

  @override
  void initState() {
    super.initState();
    fruitList = ApiService.getData();
  }

  refreshData() {
    setState(() {
      fruitList = ApiService.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fruit App")),

      body: Column(
        children: [
          // 🔹 Input
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                hintText: "Enter Fruit",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // 🔹 Insert Button
          ElevatedButton(
            onPressed: () async {
              bool ok =
              await ApiService.insertData(Fruit(name: nameCtrl.text));

              if (ok) {
                nameCtrl.clear();
                refreshData();
              }
            },
            child: Text("Add Fruit"),
          ),

          Expanded(
            child: FutureBuilder(
              future: fruitList,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var fruits = snapshot.data!;

                return ListView.builder(
                  itemCount: fruits.length,
                  itemBuilder: (context, index) {
                    Fruit frt = fruits[index];

                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(frt.name),
                        subtitle: Text("ID: ${frt.id}"),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            // 🔹 UPDATE BUTTON
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () async {
                                nameCtrl.text = frt.name;

                                bool ok = await ApiService.updateData(
                                  Fruit(id: frt.id, name: nameCtrl.text),
                                );

                                if (ok) refreshData();
                              },
                            ),

                            // 🔹 DELETE BUTTON
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                bool ok = await ApiService.deleteData(frt.id!);

                                if (ok) refreshData();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
