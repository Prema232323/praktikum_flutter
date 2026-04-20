import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/edit_profile.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({super.key, required this.profile});

  final Profile profile;

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profile'),
        backgroundColor: Color.fromARGB(255, 156, 3, 3),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/0d/7c/65/0d7c651b6d35482fa451b383fe1ece98.jpg',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.profile.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.profile.bio,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Phone Number : ${widget.profile.phone}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                textAlign: TextAlign.justify,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "Button ini belum memiliki fungsi");
              },
              child: Text("Klik Saya"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
            ElevatedButton(
              onPressed: () async {
                final Profile? updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(profile: widget.profile),
                  ),
                );

                if (updatedProfile != null) {
                  setState(() {
                    widget.profile.name = updatedProfile.name;
                    widget.profile.bio = updatedProfile.bio;
                    widget.profile.phone = updatedProfile.phone;
                  });
                  Fluttertoast.showToast(msg: "Profile berhasil diperbarui");
                }
              },
              child: const Text("Edit Profile"),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}