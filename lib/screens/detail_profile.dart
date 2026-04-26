import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/edit_profile.dart'; 

class DetailProfile extends StatefulWidget {
  final Profile profile;
  const DetailProfile({super.key, required this.profile});

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {

  void _navigateToEdit() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfile(profile: widget.profile),
      ),
    );

    if (result != null && result is Profile) {
      setState(() {
        widget.profile.name = result.name;
        widget.profile.bio = result.bio;
        widget.profile.desc56 = result.desc56;
      });
      Fluttertoast.showToast(msg: "Data berhasil diperbarui!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profile'),
        backgroundColor: const Color.fromARGB(255, 216, 220, 168),
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
                    width: double.infinity,
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
                        'https://i.pinimg.com/736x/04/ee/ac/04eeac57d0650c2cf314fc433ffdb226.jpg',
                      ),
                ),
                  ),
                ],
              ),
            ),
            Text(
              widget.profile.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.profile.bio,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            Text(
              widget.profile.desc56,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _navigateToEdit,
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}