import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_app/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: const Center(child: Login()),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';
  String otp = '';

  var otpController = List.generate(6, (index) => TextEditingController());
  var otpFocusNode = List.generate(6, (index) => FocusNode());

  bool _isObscure = true;

  switchObscure({required isObscure}) {
    setState(() {
      isObscure = !isObscure;
    });
  }

  String updateOtp() {
    return otp = otpController[0].text +
        otpController[1].text +
        otpController[2].text +
        otpController[3].text +
        otpController[4].text +
        otpController[5].text;
  }

  void _completeLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  void dispose() {
    for (var i = 0; i < 6; i++) {
      otpController[i].dispose();
      otpFocusNode[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          welcomeUserSignIn(),
          signInField(),
          signInField(label: 'Password'),
          twoStepAuthentication(),
          otpFields(context),
          signInButton(),
        ],
      ),
    );
  }

  Container welcomeUserSignIn() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 360),
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 150, bottom: 20, left: 25),
      child: const Text(
        'Chào mừng !',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Container signInField({label = 'Username'}) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 360,
      ),
      padding: const EdgeInsets.all(8),
      child: TextField(
        obscureText: label == 'Password' ? _isObscure : false,
        onChanged: (value) =>
            label != 'Password' ? username = value : password = value,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        cursorColor: Colors.orange,
        textInputAction: label != 'Password' ? TextInputAction.next : null,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          height: 1.2,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.2),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.white60,
          ),
          hintText: label,
          hintStyle: const TextStyle(
            color: Colors.white38,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white70,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          prefixIcon: Icon(
            label == 'Username'
                ? Icons.person_outline_rounded
                : Icons.lock_outline_rounded,
            color: Colors.white,
          ),
          suffixIcon: label == 'Password'
              ? IconButton(
                  icon: Icon(
                    !_isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    setState(() => _isObscure = !_isObscure);
                  },
                )
              : null,
        ),
      ),
    );
  }

  Container twoStepAuthentication({label = 'OTP'}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 360),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 50, bottom: 15),
      child: Text(
        label == 'OTP' ? 'Nhập mã OTP cơ bản' : label,
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 16,
        ),
      ),
    );
  }

  SizedBox otpFields(BuildContext context) {
    var hiddenChar = ' '; // for backward delete supporting
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          6,
          (index) => Container(
            constraints: const BoxConstraints(
              maxWidth: 59,
              maxHeight: 75,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 8,
            ),
            child: TextField(
              controller: otpController[index],
              focusNode: otpFocusNode[index],
              showCursor: false,
              onTap: () {
                if (otpController[index].text.isEmpty) {
                  otpController[index].text = hiddenChar;
                }
                otpController[index].selection = TextSelection.fromPosition(
                  TextPosition(offset: otpController[index].text.length),
                );
              },
              onTapOutside: (event) {
                if (otpController[index].text == hiddenChar) {
                  otpController[index].clear();
                }
                updateOtp();
              },
              onChanged: (value) {
                if (value.length == 6) {
                  for (var i = 0; i < 6; i++) {
                    otpController[i].text = value[i];
                  }
                  FocusScope.of(context).unfocus();
                } // when pasting OTP when and only when the OTP is 6 digits
                else {
                  if (value.isEmpty) {
                    if (index > 0) {
                      if (otpController[index - 1].text.isEmpty) {
                        otpController[index - 1].text = hiddenChar;
                      }
                      FocusScope.of(context).previousFocus();
                    }
                  } else {
                    if (index < 5) {
                      if (otpController[index + 1].text.isEmpty) {
                        otpController[index + 1].text = hiddenChar;
                      }
                      FocusScope.of(context).nextFocus();
                    } else {
                      FocusScope.of(context).unfocus();
                    }
                    if (value.length == 1) {
                      otpController[index].text = value[0];
                    } else if (value.length == 2) {
                      otpController[index].text = value[1];
                    } else {
                      for (int i = 0; i < 6; i++) {
                        otpController[i].clear();
                      }
                      otpFocusNode[0].requestFocus();
                    }
                  }
                }
                updateOtp();
              },
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  top: 18,
                  bottom: 22,
                  left: 19.4,
                  right: 14,
                ),
                filled: true,
                fillColor: Colors.black.withOpacity(0.2),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange.shade400,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ),
    );
  }

  Container signInButton() {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 337,
        maxHeight: 54,
      ),
      margin: const EdgeInsets.only(top: 50, bottom: 80),
      child: ElevatedButton(
        onPressed: () {
          if (username != 'admin' || password != 'admin' || otp != '123456') {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: const Text(
                  'Thông báo',
                  // style: TextStyle(fontSize: 18, color: Colors.purple),
                ),
                content: const Text('Đăng nhập thất bại'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 15, color: Colors.purple[300]),
                    ),
                  ),
                ],
              ),
            );
          } else {
            _completeLogin();
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.purple[700]),
          foregroundColor: MaterialStatePropertyAll(Colors.orange[400]),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        child: const Center(
          child: Text('ĐĂNG NHẬP', style: TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}
