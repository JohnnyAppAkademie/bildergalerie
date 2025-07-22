import 'package:bildergalerie/logic/Widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MyProfil extends StatefulWidget {
  const MyProfil({super.key});

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  final ScrollController _scrollController = ScrollController();
  late Future<String> _fileContent;

  @override
  void initState() {
    super.initState();
    _fileContent = rootBundle.loadString('assets/files/t.txt');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _fileContent,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Profile",
            navPage: false,
            view: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/kaya.jpeg"),
                  radius: 100,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: false,
                    radius: const Radius.circular(10),
                    thickness: 8,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        snapshot.data ?? 'Loading...',
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
