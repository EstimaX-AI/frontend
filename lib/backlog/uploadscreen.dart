// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart' as http;
//
// class UploadPage extends StatefulWidget {
//   const UploadPage({super.key});
//
//   @override
//   State<UploadPage> createState() => _UploadPageState();
// }
//
// class _UploadPageState extends State<UploadPage> {
//
//   File? selectedFile;
//   bool isUploading = false;
//   String? uploadStatus;
//
//   Future<void> pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//
//     if (result != null) {
//       setState(() {
//         selectedFile = File(result.files.single.path!);
//         uploadStatus = null;
//       });
//     }
//   }
//
//   Future<void> uploadFile() async {
//     if (selectedFile == null) return;
//
//     setState(() {
//       isUploading = true;
//       uploadStatus = null;
//     });
//
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse("https://yourbackend.com/upload"),
//     );
//
//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'file',
//         selectedFile!.path,
//       ),
//     );
//
//     try {
//       var response = await request.send();
//
//       if (response.statusCode == 200) {
//         setState(() {
//           uploadStatus = "Upload Successful ✅";
//         });
//       } else {
//         setState(() {
//           uploadStatus = "Upload Failed ❌";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         uploadStatus = "Error: $e";
//       });
//     }
//
//     setState(() {
//       isUploading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//
//           const Icon(
//             Icons.cloud_upload,
//             size: 70,
//             color: Colors.cyanAccent,
//           ),
//
//           const SizedBox(height: 20),
//
//           ElevatedButton(
//             onPressed: pickFile,
//             child: const Text("Choose PDF"),
//           ),
//
//           const SizedBox(height: 10),
//
//           if (selectedFile != null)
//             Text(
//               selectedFile!.path.split('/').last,
//               style: const TextStyle(color: Colors.white),
//             ),
//
//           const SizedBox(height: 20),
//
//           ElevatedButton(
//             onPressed: uploadFile,
//             child: const Text("Upload to Server"),
//           ),
//
//           if (isUploading)
//             const Padding(
//               padding: EdgeInsets.only(top: 15),
//               child: LinearProgressIndicator(),
//             ),
//
//           if (uploadStatus != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: Text(
//                 uploadStatus!,
//                 style: const TextStyle(color: Colors.lightGreenAccent),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }