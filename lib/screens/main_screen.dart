import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funfacts/screens/setting_screen.dart';
import 'package:dio/dio.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<dynamic> facts = [];
  bool isLoading = true;
  
  Future<void> getData() async {
    try{
      Response response = await Dio().get('https://raw.githubusercontent.com/hastik07/flutter_dummy_api/main/facts.json');
      facts = jsonDecode(response.data);
      isLoading = false;
      setState(() {});
    } catch(e) {
      isLoading = false;
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fun Facts'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
              },
              child: const Icon(
                  Icons.settings
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: isLoading ? const Center(child: CircularProgressIndicator()) : PageView.builder(
                scrollDirection: Axis.horizontal, //This is not necessary, if i swipe left without adding this property then my screen swipe left.
                itemCount: facts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: Text(
                          facts[index],
                          style: const TextStyle(
                              fontSize: 35,
                          ),
                          textAlign: TextAlign.center,
                        )
                    );
                  }
              ),
            ),
            const SizedBox(height: 10,),
            const Text('Swipe left for more')
          ],
        ),
      ),
    );
  }
}
