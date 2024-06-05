import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding_flow/constants/gaps.dart';
import 'package:twitter_onboarding_flow/constants/sizes.dart';
import 'package:twitter_onboarding_flow/screens/create_account_screen.dart';
import 'package:twitter_onboarding_flow/widgets/color_button.dart';
import 'package:twitter_onboarding_flow/widgets/sns_button.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _isPolicyAgreed = false;

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size20,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            children: [
              Gaps.h24,
              const Text(
                "Customize your experience",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v32,
              const Text(
                "Track where you see Twitter content across the web",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.h16,
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                  Switch(
                    value: _isPolicyAgreed,
                    onChanged: (value) {
                      setState(() {
                        _isPolicyAgreed = value; // 스위치 상태를 업데이트합니다.
                      });
                    },
                    activeTrackColor: Colors.green, // 스위치가 켜져 있을 때의 트랙 색상
                    activeColor: Colors.white, // 스위치가 켜져 있을 때의 썸 색상
                  ),
                ],
              ),
              Gaps.v60,
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: "By signing up, you agree to our ",
                      style: TextStyle(
                          color: Colors.black, fontSize: Sizes.size14),
                    ),
                    TextSpan(
                      text: "Terms",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size14),
                    ),
                    const TextSpan(
                      text: ", ",
                      style: TextStyle(
                          color: Colors.black, fontSize: Sizes.size14),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size14),
                    ),
                    const TextSpan(
                      text: ", and ",
                      style: TextStyle(
                          color: Colors.black, fontSize: Sizes.size14),
                    ),
                    TextSpan(
                      text: "Cookie Use",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size14),
                    ),
                    const TextSpan(
                      text: ".",
                      style: TextStyle(
                          color: Colors.black, fontSize: Sizes.size14),
                    ),
                  ],
                ),
              ),
              Gaps.v96,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: GestureDetector(
          onTap: _onNextTap,
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: ColorButton(color: Colors.black, text: "Next"),
          ),
        ),
      ),
    );
  }
}
