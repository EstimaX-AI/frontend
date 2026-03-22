import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../Bottomnavbar/custombottonnav.dart';
import 'analysis.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Future<void> _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      withData: true,
    );

    if (result != null) {
      final file = result.files.single;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnalysisScreen(
            fileName: file.name,
            fileBytes: file.bytes!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () => _pickFile(context),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF071B34), Color(0xFF0A2A4F), Color(0xFF071B34)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Welcome Back 👋",
                          style: TextStyle(color: Colors.white70),
                        ),

                        SizedBox(height: 5),

                        Text(
                          "EstiMax AI Dashboard",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    CircleAvatar(
                      backgroundColor: Colors.cyanAccent,
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.cyanAccent.withOpacity(0.15),
                        Colors.lightGreenAccent.withOpacity(0.15),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.cyanAccent),
                  ),

                  child: Column(
                    children: [
                      const Icon(
                        Icons.cloud_upload,
                        size: 55,
                        color: Colors.cyanAccent,
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Upload Blueprint PDF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "AI will analyze and generate estimation",
                        style: TextStyle(color: Colors.white54),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 15),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent,
                          foregroundColor: Colors.black,
                        ),

                        onPressed: () => _pickFile(context),

                        child: const Text("Choose File"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Recent Projects",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [SizedBox(width: 0)],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
    );
  }
}