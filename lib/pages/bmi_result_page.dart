import 'package:flutter/material.dart';

class BMIResultPage extends StatelessWidget {
  final double height;
  final int weight;
  final int age;
  final bool isMaleSelected;

  const BMIResultPage({
    Key? key,
    required this.height,
    required this.weight,
    required this.age,
    required this.isMaleSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate BMI
    double bmi;
    if (isMaleSelected) {
      bmi = calculateBMIMale(height, weight);
    } else {
      bmi = calculateBMIFemale(height, weight);
    }

    // Determine BMI category
    String bmiCategory = getBMICategory(bmi);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI is: ${bmi.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Category: $bmiCategory',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  double calculateBMIMale(double height, int weight) {
    return weight / ((height / 100) * (height / 100));
  }

  double calculateBMIFemale(double height, int weight) {
    // Adjust the formula for females
    return weight / ((height / 100) * (height / 100)) * 0.95;
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
