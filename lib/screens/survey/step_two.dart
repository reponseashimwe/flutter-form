import 'package:flutter/material.dart';
import 'step_three.dart';

/// Second step of the survey collecting academic experience feedback.
/// Handles satisfaction ratings and course evaluations.
class StepTwo extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String dob;

  const StepTwo({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.dob,
  });

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  String? _satisfaction;
  String? _courseLoad;
  String? _teachingQuality;

  bool get isFormValid =>
      _satisfaction != null && _courseLoad != null && _teachingQuality != null;

  Widget _buildRadioGroup({
    required String title,
    required String? groupValue,
    required void Function(String?) onChanged,
    required List<String> options,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ...options.map((option) => RadioListTile(
              title: Text(
                option,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              value: option,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: EdgeInsets.zero,
            )),
        const Divider(),
      ],
    );
  }

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
                '2 of 3',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Academic Experience',
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildRadioGroup(
                      title: 'How satisfied are you with your overall academic experience?',
                      groupValue: _satisfaction,
                      onChanged: (value) => setState(() => _satisfaction = value),
                      options: ['Very Satisfied', 'Satisfied', 'Neutral', 'Dissatisfied', 'Very Dissatisfied'],
                    ),
                    const SizedBox(height: 24),
                    _buildRadioGroup(
                      title: 'How do you find the current course load?',
                      groupValue: _courseLoad,
                      onChanged: (value) => setState(() => _courseLoad = value),
                      options: ['Too Heavy', 'Appropriate', 'Too Light'],
                    ),
                    const SizedBox(height: 24),
                    _buildRadioGroup(
                      title: 'How would you rate the teaching quality?',
                      groupValue: _teachingQuality,
                      onChanged: (value) => setState(() => _teachingQuality = value),
                      options: ['Excellent', 'Good', 'Average', 'Poor', 'Very Poor'],
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StepThree(
                                name: widget.name,
                                email: widget.email,
                                phone: widget.phone,
                                address: widget.address,
                                dob: widget.dob,
                                satisfaction: _satisfaction!,
                                courseLoad: _courseLoad!,
                                teachingQuality: _teachingQuality!,
                              ),
                            ),
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
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 