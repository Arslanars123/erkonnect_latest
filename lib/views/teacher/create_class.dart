import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

class CreateClassPage extends StatefulWidget {
  @override
  _CreateClassPageState createState() => _CreateClassPageState();
}

class _CreateClassPageState extends State<CreateClassPage> {
  final TextEditingController _classNameController = TextEditingController();
  String? _selectedSubject;
  bool _isLoading = true;
  bool _hasError = false;
  bool _noInternet = false;

  final List<String> _subjects = [];
  final List<String> _selectedSubjects = [];

  @override
  void initState() {
    super.initState();
    _fetchSubjects();
  }

  Future<void> _fetchSubjects() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
      _noInternet = false;
    });

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _noInternet = true;
        _isLoading = false;
      });
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://170.249.216.178/~filterba/schooling/public/api/subjects'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'schoolId': '1'}),  // Replace '1' with the actual school ID
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        List<dynamic> data = responseData['data'];
        print(data);
        setState(() {
          _subjects.clear();
          _subjects.addAll(data.map((item) => item['subject_name'].toString()));
          _isLoading = false;
          _hasError = false;
        });
      } else {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  void _showDropdownDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        if (_isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (_noInternet) {
          return Center(child: Text('No internet connection', style: GoogleFonts.barlow()));
        } else if (_hasError) {
          return Center(child: Text('Failed to load subjects', style: GoogleFonts.barlow()));
        } else if (_subjects.isEmpty) {
          return Center(child: Text('No subjects available', style: GoogleFonts.barlow()));
        } else {
          return ListView(
            children: _subjects.map((subject) {
              return ListTile(
                title: Text(subject, style: GoogleFonts.barlow()),
                onTap: () {
                  setState(() {
                    if (!_selectedSubjects.contains(subject)) {
                      _selectedSubjects.add(subject);
                    }
                    _selectedSubject = null;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button action
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dianne Russell',
              style: GoogleFonts.barlow(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Class incharge: Class 1',
              style: GoogleFonts.barlow(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your method from below',
              style: GoogleFonts.barlow(color: Colors.grey),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _classNameController,
              decoration: InputDecoration(
                labelText: 'Name of Class',
                labelStyle: GoogleFonts.barlow(),
                border: OutlineInputBorder(),
              ),
              style: GoogleFonts.barlow(),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _showDropdownDialog(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Subject',
                  labelStyle: GoogleFonts.barlow(),
                  border: OutlineInputBorder(),
                ),
                child: _selectedSubject == null
                    ? Text('Select a subject', style: GoogleFonts.barlow())
                    : Text(_selectedSubject!, style: GoogleFonts.barlow()),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              children: _selectedSubjects.map((subject) {
                return Chip(
                  label: Text(subject, style: GoogleFonts.barlow()),
                  onDeleted: () {
                    setState(() {
                      _selectedSubjects.remove(subject);
                    });
                  },
                );
              }).toList(),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFFd4af37), // Text color
                  backgroundColor: Colors.white, // Button color
                ),
                onPressed: () {
                  // Handle Create Class button action
                },
                child: Text('Create Class', style: GoogleFonts.barlow()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
