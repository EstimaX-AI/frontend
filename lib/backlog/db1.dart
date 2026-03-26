// import 'package:flutter/material.dart';
// import 'package:untitled2/Bottomnavbar/uploadscreen.dart';
//
// class DashboardScreen1 extends StatelessWidget {
//   const DashboardScreen1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.cyanAccent,
//         child: const Icon(Icons.add, color: Colors.black),
//         onPressed: () {},
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF071B34),
//               Color(0xFF0A2A4F),
//               Color(0xFF071B34),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome Back 👋",
//                           style: TextStyle(
//                             color: Colors.white70,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           "EstiMax AI Dashboard",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const CircleAvatar(
//                       backgroundColor: Colors.cyanAccent,
//                       child: Icon(Icons.person, color: Colors.black),
//                     )
//                   ],
//                 ),
//                 // const SizedBox(height: 30),
//                 // Row(
//                 //   children: [
//                 //     _statCard("24", "Blueprints", Icons.picture_as_pdf),
//                 //     const SizedBox(width: 12),
//                 //     _statCard("18", "AI Processed", Icons.auto_graph),
//                 //     const SizedBox(width: 12),
//                 //     _statCard("₹ 12L", "Estimates", Icons.currency_rupee),
//                 //   ],
//                 // ),
//                 const SizedBox(height: 30),
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(24),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.cyanAccent.withOpacity(0.15),
//                         Colors.lightGreenAccent.withOpacity(0.15),
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.cyanAccent),
//                   ),
//                   child: Column(
//                     children: [
//                       const Icon(
//                         Icons.cloud_upload,
//                         size: 55,
//                         color: Colors.cyanAccent,
//                       ),
//                       const SizedBox(height: 15),
//                       const Text(
//                         "Upload Blueprint PDF",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         "AI will analyze and generate estimation",
//                         style: TextStyle(color: Colors.white54),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 15),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.cyanAccent,
//                           foregroundColor: Colors.black,
//                         ),
//                         onPressed: () {},
//                         child: const Text("Choose File"),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const Text(
//                   "Recent Projects",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 SizedBox(
//                   height: 160,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       _recentCard("p1.pdf", "₹000"),
//                       const SizedBox(width: 15),
//                       _recentCard("p2.pdf", "₹000"),
//                       const SizedBox(width: 15),
//                       _recentCard("p3.pdf", "₹000"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const Color(0xFF081E3A),
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.cyanAccent,
//         unselectedItemColor: Colors.white54,
//         onTap: (index) {
//           if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const UploadPage(),
//               ),
//             );
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.upload_file),
//             label: "Upload",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.analytics),
//             label: "Analysis",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings",
//           ),
//         ],
//       ),
//     );
//   }
//   static Widget _statCard(String value, String title, IconData icon) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: const Color(0xFF081E3A),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           children: [
//             Icon(icon, color: Colors.cyanAccent),
//             const SizedBox(height: 8),
//             Text(
//               value,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white54,
//                 fontSize: 12,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   static Widget _chip(String text) {
//     return Chip(
//       label: Text(
//         text,
//         style: const TextStyle(color: Colors.white),
//       ),
//       backgroundColor: Colors.cyanAccent.withOpacity(0.2),
//       side: const BorderSide(color: Colors.cyanAccent),
//     );
//   }
//   static Widget _recentCard(String fileName, String amount) {
//     return Container(
//       width: 180,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF081E3A),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Icon(Icons.picture_as_pdf, color: Colors.redAccent),
//           const SizedBox(height: 10),
//           Text(
//             fileName,
//             style: const TextStyle(color: Colors.white),
//             overflow: TextOverflow.ellipsis,
//           ),
//           const Spacer(),
//           Text(
//             amount,
//             style: const TextStyle(
//               color: Colors.lightGreenAccent,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }