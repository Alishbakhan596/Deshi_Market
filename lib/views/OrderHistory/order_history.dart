// import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
// import 'package:flutter/material.dart';

// class OrderHistory extends StatefulWidget {
//   const OrderHistory({super.key});

//   @override
//   State<OrderHistory> createState() => _OrderHistoryState();
// }

// class _OrderHistoryState extends State<OrderHistory> {
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff019934),
//         title: Center(
//           child: Text(
//             "Order History",
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 children: [
//                   Text(
//                     'Order History',
//                     style: TextStyle(fontSize: 18),
//                   )
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 height: 100,
//                 width: 450,
//                 color: Colors.white,
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     height: 92,
//                     width: 76,
//                     color: const Color.fromARGB(45, 74, 193, 195),
//                     child: Icon(
//                       Icons.check_circle_rounded,
//                       color: Green,
//                       size: 35,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
