import 'package:flutter/material.dart';
import 'success_screen.dart';
import '../../validators.dart';

class StepThree extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String dob;
  final String satisfaction;
  final String courseLoad;
  final String teachingQuality;

  const StepThree({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.dob,
    required this.satisfaction,
    required this.courseLoad,
    required this.teachingQuality,
  });

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  final Set<String> _selectedFacilities = {};
  final _otherController = TextEditingController();

  final List<String> _facilities = [
    'Library',
    'Computer Labs',
    'Sports Facilities',
    'Cafeteria',
    'Study Rooms',
    'Student Lounge',
    'Parking',
    'Wi-Fi',
  ];

  bool get isFormValid => _selectedFacilities.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '3 of 3',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Campus Facilities',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Which campus facilities do you use regularly?',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ..._facilities.map((facility) => CheckboxListTile(
                          title: Text(
                            facility,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          value: _selectedFacilities.contains(facility),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value ?? false) {
                                _selectedFacilities.add(facility);
                              } else {
                                _selectedFacilities.remove(facility);
                              }
                            });
                          },
                          activeColor: Theme.of(context).primaryColor,
                          contentPadding: EdgeInsets.zero,
                        )),
                    TextField(
                      controller: _otherController,
                      decoration: InputDecoration(
                        hintText: 'Other facilities (Optional)',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                        border: const UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: isFormValid
                      ? () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuccessScreen(
                                name: widget.name,
                              ),
                            ),
                            (route) => false,
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 