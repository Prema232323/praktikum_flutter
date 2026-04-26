import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfile extends StatefulWidget {
  final Profile profile;
  const EditProfile({super.key, required this.profile});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.profile.name);
    _bioController = TextEditingController(text: widget.profile.bio);
    _descController = TextEditingController(text: widget.profile.desc56);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nama", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bioController,
                decoration: const InputDecoration(labelText: "Bio", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: "Desc", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                  Profile updatedData = Profile(
                    id: widget.profile.id,
                    name: _nameController.text,
                    bio: _bioController.text,
                    desc56: _descController.text,
                  );
                  Navigator.pop(context, updatedData);
                },

                child: const Text("Update Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}