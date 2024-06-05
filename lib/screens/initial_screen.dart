import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding_flow/constants/gaps.dart';
import 'package:twitter_onboarding_flow/constants/sizes.dart';
import 'package:twitter_onboarding_flow/screens/create_account_screen.dart';
import 'package:twitter_onboarding_flow/widgets/color_button.dart';
import 'package:twitter_onboarding_flow/widgets/sns_button.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  void onLoginTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateAccountScreen(),
      ),
    );
  }

  void onCreateAccountButtonTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size14,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            children: [
              Gaps.v80,
              const Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v96,
              const SnsButton(
                brand: "Google",
                brandIcon: FontAwesomeIcons.google,
              ),
              Gaps.v10,
              const SnsButton(
                  brand: "Apple", brandIcon: FontAwesomeIcons.apple),
              Gaps.v10,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                    color: Colors.black,
                    thickness: Sizes.size10,
                  ),
                  Gaps.h5,
                  Text('or'),
                  Gaps.h5,
                  Divider(
                    color: Colors.black,
                    thickness: Sizes.size10,
                  ),
                ],
              ),
              GestureDetector(
                onTap: onCreateAccountButtonTap,
                child: const ColorButton(
                  color: Colors.black,
                  text: "Create account",
                ),
              ),
              Gaps.v14,
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
              Gaps.v32,
              Row(
                children: [
                  const Text(
                    "Have an account already?",
                    style: TextStyle(
                        color: Colors.black54, fontSize: Sizes.size14),
                  ),
                  Gaps.h3,
                  TextButton(
                    onPressed: onLoginTap,
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size14),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
