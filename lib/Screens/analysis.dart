import 'package:flutter/material.dart';
import '../Bottomnavbar/custombottonnav.dart';
import '../services/api_service.dart';

class AnalysisScreen extends StatefulWidget {
  final String fileName;
  final List<int> fileBytes;

  const AnalysisScreen({
    super.key,
    required this.fileName,
    required this.fileBytes,
  });

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  bool isLoading = true;
  Map<String, dynamic>? result;

  @override
  void initState() {
    super.initState();
    analyzeBlueprint();
  }

  Future<void> analyzeBlueprint() async {
    var response = await ApiService.uploadBlueprint(
      widget.fileBytes,
      widget.fileName,
    );

    setState(() {
      result = response;
      isLoading = false;
    });
  }

  Widget resultCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF081E3A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF071B34), Color(0xFF0A2A4F), Color(0xFF071B34)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: isLoading
                ? const Center(
              child: CircularProgressIndicator(
                color: Colors.cyanAccent,
              ),
            )

                : LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Analysis Result for ${widget.fileName}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 25),

                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                            screenWidth > 600 ? 3 : 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 1,
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            final items = [
                              ["TOTAL SYMBOLS", result?["total"]],
                              ["45 RADIUS ELBOW", result?["elbow45"]],
                              ["90 RADIUS ELBOW", result?["elbow90"]],
                              ["RETURN AIR RISE", result?["returnAir"]],
                              ["SUPPLY AIR RISE", result?["supplyAir"]],
                              ["RETURN/EXHAUST DIFFUSER", result?["diffuser"]],
                            ];

                            return resultCard(
                              items[index][0].toString(),
                              items[index][1]?.toString() ?? "0",
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}