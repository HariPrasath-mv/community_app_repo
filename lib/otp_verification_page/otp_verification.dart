import 'package:flutter/material.dart';
import 'otp_sms_verification.dart';

class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailOtpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter the OTP sent to your Email-ID",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailOtpController,
              decoration: const InputDecoration(
                labelText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MobileOTPVerificationPage(),
                    ),
                  );
                },
                child: const Text(
                  "Send via SMS",
                  style: TextStyle(color: Color(0xFF279AF1), fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileOTPVerificationPage extends StatefulWidget {
  const MobileOTPVerificationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileOTPVerificationPageState createState() =>
      _MobileOTPVerificationPageState();
}

class _MobileOTPVerificationPageState extends State<MobileOTPVerificationPage> {
  final TextEditingController _mobileNumberController = TextEditingController();
  String _selectedCountryCode = '+91';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
        centerTitle: true,
        backgroundColor: const Color(0xFFFDFDFD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter your mobile number to receive OTP"),
            const SizedBox(height: 10),
            Row(
              children: [
                DropdownButton<String>(
                  value: _selectedCountryCode,
                  onChanged: (String? newCode) {
                    setState(() {
                      _selectedCountryCode = newCode!;
                    });
                  },
                  items: <String>['+91', '+1', '+44', '+61']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: _mobileNumberController,
                    decoration: const InputDecoration(
                      labelText: "Mobile Number",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OTPSMSVerificationPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF279AF1),
              ),
              child: const Text(
                "Send SMS",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
