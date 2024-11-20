import 'package:flutter/material.dart';

class OTPSMSVerificationPage extends StatelessWidget {
  const OTPSMSVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController smsOtpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter OTP"),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter the 6-digit OTP sent to your mobile number",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: smsOtpController,
              decoration: const InputDecoration(
                labelText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (smsOtpController.text == "123456") {
                  // Simulating a successful OTP verification
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Success"),
                      content: const Text("OTP verification successful!"),
                    ),
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pushNamedAndRemoveUntil(
                        // ignore: use_build_context_synchronously
                        context,
                        '/main',
                        (route) => false);
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text("Error"),
                      content: Text("Invalid OTP. Please try again."),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF279AF1),
              ),
              child: const Text(
                "Verify OTP",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
