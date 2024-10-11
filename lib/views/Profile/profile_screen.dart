import 'package:e_commerce_fruits_app/Utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // File? _image;
  // final _auth = FirebaseAuth.instance;
  // final _firestore = FirebaseFirestore.instance;
  // final _storage = FirebaseStorage.instance;

  // Future<void> _pickImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     }
  //   });
  // }

  // Future<String> _uploadImage(File image) async {
  //   final ref = _storage
  //       .ref()
  //       .child('user_images')
  //       .child('${_auth.currentUser!.uid}.jpeg');

  //   await ref.putFile(image);
  //   return await ref.getDownloadURL();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff019934),
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/Images/boy.jpg"),
                              ),
                            )),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Mr. Nitish Kumar",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Nitish833@gmail.com",
                        style: TextStyle(
                          color: Grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color: const Color(0xff0199034),
                      child: Container(
                        height: 100,
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.folder,
                                    size: 25, color: Colors.white),
                                Text(
                                  "Orders",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            Column(
                              children: [
                                const Icon(Icons.credit_card,
                                    size: 25, color: Colors.white),
                                Text(
                                  "Payments",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            Column(
                              children: [
                                const Icon(Icons.location_on_outlined,
                                    size: 25, color: Colors.white),
                                Text(
                                  "Address",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                        color: const Color.fromARGB(239, 71, 144, 25),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.person,
                            size: 27,
                          ),
                        )),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 19)),
                const Text(
                  "Users Detail",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                        color: const Color.fromARGB(239, 71, 144, 25),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.settings,
                            size: 27,
                          ),
                        )),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 19)),
                const Text(
                  "Settings",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                        color: const Color.fromARGB(239, 71, 144, 25),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.help,
                            size: 27,
                          ),
                        )),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 19)),
                const Text(
                  "Help & Supports",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                        color: const Color.fromARGB(239, 71, 144, 25),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.language_sharp,
                            size: 27,
                          ),
                        )),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 19)),
                const Text(
                  "Change & Language",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                        color: const Color.fromARGB(239, 71, 144, 25),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.logout,
                            size: 27,
                          ),
                        )),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 19)),
                const Text(
                  "Logout",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
