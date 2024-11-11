import 'package:flutter/material.dart';

void main() => runApp(SimpleInterestApp());

class SimpleInterestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Interest Calculator',
      home: InterestCalculatorScreen(),
      theme: ThemeData.light(),
    );
  }
}

class InterestCalculatorScreen extends StatefulWidget {
  @override
  _InterestCalculatorScreenState createState() => _InterestCalculatorScreenState();
}

class _InterestCalculatorScreenState extends State<InterestCalculatorScreen> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 187, 187),
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(principalController, 'Pokok pinjaman', Icons.attach_money),
              SizedBox(height: 20),
              _buildTextField(rateController, 'Bunga', Icons.percent),
              SizedBox(height: 20),
              _buildTextField(timeController, 'Banyak cicilan', Icons.calendar_today),
              SizedBox(height: 20),
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Calculate'),
                onPressed: _calculateInterest,
              ),
              SizedBox(height: 20),
              _buildInterestResult(result),
            ],
          ),
        ),
      ),
    );
  }
  

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.black),
    );
  }

  void _calculateInterest() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    double time = double.tryParse(timeController.text) ?? 0.0;

    double interest = principal * rate * time / 100;

    setState(() {
      result = 'Total Bunga: Rp ${interest.toStringAsFixed(2)},.-';
    });
  }

  Widget _buildInterestResult(String result) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.greenAccent, // Latar belakang hijau cerah
        borderRadius: BorderRadius.circular(20), // Sudut rounded
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Efek bayangan
            offset: Offset(4, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Text(
        result.isNotEmpty ? result : 'Hasil',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
