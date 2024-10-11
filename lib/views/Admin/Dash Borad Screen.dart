import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashBoard(),
  ];

  void _onTapp(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: height,
            width: 200,
            color: Greens,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(children: [
                    Image.asset("assets/Logo/Group 33.png"),
                    const Column(children: [
                      Row(
                        children: [
                          Text(
                            "DESHI",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff00CA44),
                                fontWeight: FontWeight.bold),
                          ),
                          //  horizontalSpaceTiny,
                          Text(
                            "   MART",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "Desh ka market",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ]),
                  ]),
                  SizedBox(height: 40),
                  buildMenuItem(
                    text: "Dashboard",
                    icon: Iconsax.shop,
                    index: 0,
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      _onTapp(0);
                    },
                  ),
                  SizedBox(height: 40),
                  buildMenuItem(
                    text: "Products",
                    icon: Icons.shopping_bag_sharp,
                    index: 1,
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      _onTapp(1);
                    },
                  ),
                  SizedBox(height: 40),
                  buildMenuItem(
                    text: "Category",
                    icon: Iconsax.element_2,
                    index: 2,
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      _onTapp(2);
                    },
                  ),
                  SizedBox(height: 40),
                  buildMenuItem(
                    text: "Coupon Code",
                    icon: Icons.discount_sharp,
                    index: 3,
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      _onTapp(3);
                    },
                  ),
                  SizedBox(height: 40),
                  buildMenuItem(
                    text: "Orders",
                    icon: Icons.receipt_outlined,
                    index: 4,
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      _onTapp(4);
                    },
                  ),
                  SizedBox(height: 40),
                  buildMenuItem(
                    text: "Settings",
                    icon: Icons.settings,
                    index: 5,
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      _onTapp(5);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _screens[_selectedIndex],
          )
        ],
      ),
    );
  }
}

class buildMenuItem extends StatelessWidget {
  final String text;
  final int index;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;

  const buildMenuItem({
    super.key,
    required this.text,
    required this.index,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: isSelected ? Colors.green[700] : Colors.transparent,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 34,
              color: isSelected ? Colors.white : Grey,
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                fontSize: 17,
                color: isSelected ? Colors.white : Green,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class Sidebar extends StatefulWidget {
//   const Sidebar({super.key});

//   @override
//   State<Sidebar> createState() => _SidebarState();
// }

// class _SidebarState extends State<Sidebar> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     // const DashboardScreen(),
//     // const AdminProductScreen(),
//     // const CategoryScreen(),
//     // const CouponScreen(),
//     // const AllOrdersScreen(),
//   ];

//   // Function to handle tab changes
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Row(
//         children: [
//           Container(
//             height: height,
//             width: 200,
//             color: Colors.green[50],
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 40),
//                   Row(
//                     children: [
//                       Image.asset("assets/Logo/Group 33.png"),
//                       const Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "DESHI",
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     color: Color(0xff00CA44),
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               // horizontalSpaceTiny,
//                               Text(
//                                 "MART",
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.orange,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             "Desh ka market",
//                             style: TextStyle(fontSize: 13, color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 40),
//                   SidebarItem(
//                     icon: Icons.dashboard,
//                     label: 'Dashboard',
//                     index: 0,
//                     isSelected: _selectedIndex == 0, // Check if selected
//                     onTap: () => _onItemTapped(0), // Switch to Dashboard
//                   ),
//                   const SizedBox(height: 20),
//                   SidebarItem(
//                     icon: Icons.shopping_bag,
//                     label: 'Products',
//                     index: 1,
//                     isSelected: _selectedIndex == 1, // Check if selected
//                     onTap: () => _onItemTapped(1), // Switch to Products
//                   ),
//                   const SizedBox(height: 20),
//                   SidebarItem(
//                     icon: Icons.category,
//                     label: 'Category',
//                     index: 2,
//                     isSelected: _selectedIndex == 2, // Check if selected
//                     onTap: () => _onItemTapped(2), // Switch to Category
//                   ),
//                   const SizedBox(height: 20),
//                   SidebarItem(
//                     icon: Icons.discount,
//                     label: 'Coupon Code',
//                     index: 3,
//                     isSelected: _selectedIndex == 3, // Check if selected
//                     onTap: () => _onItemTapped(3), // Switch to Settings
//                   ),
//                   const SizedBox(height: 20),
//                   SidebarItem(
//                     icon: Icons.receipt_long,
//                     label: 'Orders',
//                     index: 4,
//                     isSelected: _selectedIndex == 4, // Check if selected
//                     onTap: () => _onItemTapped(4), // Switch to Settings
//                   ),
//                   const SizedBox(height: 20),
//                   SidebarItem(
//                     icon: Icons.settings,
//                     label: 'Settings',
//                     index: 5,
//                     isSelected: _selectedIndex == 5, // Check if selected
//                     onTap: () => _onItemTapped(5), // Switch to Settings
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: _pages[_selectedIndex], // Display the selected page
//           )
//         ],
//       ),
//     );
//   }
// }

// class SidebarItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final int index;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const SidebarItem({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.index,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 8),
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.green[700] : Colors.transparent,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               size: 24,
//               color: isSelected ? Colors.white : Colors.grey,
//             ),
//             const SizedBox(width: 16),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: isSelected ? Colors.white : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
