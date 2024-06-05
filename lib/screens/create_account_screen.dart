import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding_flow/constants/gaps.dart';
import 'package:twitter_onboarding_flow/constants/sizes.dart';
import 'package:twitter_onboarding_flow/screens/customize_experience_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  bool _isNameValid = false;
  bool _isEmailValid = false;

  Map<String, String> formData = {};

  DateTime initialDate = DateTime.now();

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTap() {
    if (_isNameValid && _isEmailValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CustomizeExperienceScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        DateTime tempPickedDate = initialDate;
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime dateTime) {
                    tempPickedDate = dateTime;
                  },
                ),
              ),
              CupertinoButton(
                child: const Text('Done'),
                onPressed: () {
                  Navigator.of(context).pop(tempPickedDate);
                },
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != initialDate) {
      setState(() {
        initialDate = pickedDate;
        _setTextFieldDate(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: FaIcon(
            FontAwesomeIcons.twitter,
            size: Sizes.size20,
            color: Theme.of(context).primaryColor,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            key: _formKey,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v32,
              const Text(
                "Create Your account",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v32,
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: _isNameValid
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  hintText: "Name",
                ),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData['name'] = newValue;
                  }
                },
                onChanged: (value) {
                  setState(() {
                    _isNameValid = value.isNotEmpty;
                  });
                },
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v24,
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: _isEmailValid
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  hintText: "Email addresss",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Type in your email address';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Type in your valid email address';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData['email'] = newValue;
                  }
                },
                cursorColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  setState(() {
                    _isEmailValid =
                        RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
                  });
                },
              ),
              Gaps.v24,
              GestureDetector(
                onTap: _selectDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _birthdayController,
                    decoration: const InputDecoration(
                      hintText: "Date of birth",
                    ),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['birthday'] = newValue;
                      }
                    },
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Gaps.h10,
              const Text(
                "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                style: TextStyle(color: Colors.black54, fontSize: Sizes.size16),
              ),
              Gaps.v96,
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: _onNextTap,
                  child: Container(
                    height: 40,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _isNameValid && _isEmailValid
                          ? Colors.black
                          : Colors.black87,
                    ),
                    child: const Center(
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
