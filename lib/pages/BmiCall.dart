import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bmi_result_page.dart';

class BmiCallPage extends StatefulWidget {
  const BmiCallPage({Key? key}) : super(key: key);

  @override
  State<BmiCallPage> createState() => _BmiCallPageState();
}

class _BmiCallPageState extends State<BmiCallPage> {
  var _height = 150.0;
  var _isMaleSelected = true;
  var _weight = 60;
  var _age = 26;

  void _toggleGenderSelection(bool isMale) {
    setState(() {
      _isMaleSelected = isMale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   const Text(
            'BMI Calculator',
        ),
      ),
      bottomNavigationBar:
      SizedBox(
        height: 100,
        child: ElevatedButton(
          style: ButtonStyle(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BMIResultPage(
                  height: _height,
                  weight: _weight,
                  age: _age,
                  isMaleSelected: _isMaleSelected,
                ),
              ),
            );
          },
          child: const Text(
              'Calculate',

          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: SelectGenderWidget(
                      title: 'Male',
                      icon: Icons.male,
                      isSelected: _isMaleSelected,
                      onTap: () => _toggleGenderSelection(true),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SelectGenderWidget(
                      title: 'Female',
                      icon: Icons.female,
                      isSelected: !_isMaleSelected,
                      onTap: () => _toggleGenderSelection(false),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Card(
                  child: AspectRatio(
                    aspectRatio: 2 / 1.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 24.0, bottom: 5),
                          child: Text(
                            'Height',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff8B8C9E),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${_height.toInt()}',
                              style: const TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          value: _height,
                          min: 30.0,
                          max: 220.0,
                          inactiveColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              _height = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ChoseDetailsWidget(
                        title: 'Weight',
                        value: _weight,
                        increment: _incrementWeight,
                        decrement: _decrementWeight,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ChoseDetailsWidget(
                        title: 'Age',
                        value: _age,
                        increment: _incrementAge,
                        decrement: _decrementAge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _incrementWeight() {
    setState(() {
      _weight++;
    });
  }

  void _decrementWeight() {
    setState(() {
      if (_weight > 0) _weight--;
    });
  }

  void _incrementAge() {
    setState(() {
      _age++;
    });
  }

  void _decrementAge() {
    setState(() {
      if (_age > 0) _age--;
    });
  }
}

class SelectGenderWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectGenderWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1 / 1.2,
        child: Card(
          color: isSelected ? const Color(0xff333244) : const Color(0xff24263B),
          child: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 80,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 12),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8B8C9E),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChoseDetailsWidget extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback increment;
  final VoidCallback decrement;

  const ChoseDetailsWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.1,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff8B8C9E),
                ),
              ),
              Text(
                '$value',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 15),
                    child: IconButton(
                      onPressed: decrement,
                      icon: const Icon(Icons.remove_circle),
                      iconSize: 45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: IconButton(
                      onPressed: increment,
                      icon: const Icon(Icons.add_circle),
                      iconSize: 45,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
