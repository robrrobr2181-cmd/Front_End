import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final dob = TextEditingController();
  final blood = TextEditingController();
  final address1 = TextEditingController();
  final address2 = TextEditingController();
  final pincode = TextEditingController();

  String gender = "";

  void confirmCheck() {
    if (firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        gender.isNotEmpty &&
        dob.text.isNotEmpty &&
        blood.text.isNotEmpty &&
        address1.text.isNotEmpty &&
        address2.text.isNotEmpty &&
        pincode.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Successful ✅")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all details")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8E2C2C), 
                     Color(0xFFB03A3A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Image.asset("assets/logo.png", height: 80),
              const SizedBox(height: 30),

              /// CARD
              Container(
                height: 800,
                margin: const EdgeInsets.symmetric(horizontal: 500),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    input("First Name", firstName),
                    input("Last Name", lastName),

                    const SizedBox(height: 10),
                    const Text("Gender"),
                    Row(
                      children: [
                        genderBox("Male"),
                        genderBox("Female"),
                        genderBox("Others"),
                      ],
                    ),

                    input("Date of Birth", dob, hint: "dd/mm/yyyy"),
                    input("Blood Group", blood),

                    input("House / Street", address1),
                    input("Area / City", address2),
                    input("Pin Code", pincode),

                    const SizedBox(height: 20),

                    Center(
                      child: ElevatedButton(
                        onPressed: confirmCheck,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8E2C2C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          child: Text("CONFIRM",
                          style: TextStyle(color:Colors.white)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                    const Center(child: Text("SKIP FOR NOW")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget input(String label, TextEditingController controller,
      {String? hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(label),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget genderBox(String value) {
    return Row(
      children: [
        Checkbox(
          value: gender == value,
          onChanged: (_) {
            setState(() => gender = value);
          },
        ),
        Text(value),
      ],
    );
  }
}
