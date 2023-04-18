import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './home.dart';

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
  var signInController = List.generate(2, (index) => TextEditingController());

  var otpController = List.generate(6, (index) => TextEditingController());
  var otpFocusNode = List.generate(6, (index) => FocusNode());

  var buttonController = MaterialStatesController();

  bool _isObscure = true;

  switchObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  String getUsername() {
    return signInController[0].text;
  }

  String getPassword() {
    return signInController[1].text;
  }

  String getOTP() {
    return otpController[0].text +
        otpController[1].text +
        otpController[2].text +
        otpController[3].text +
        otpController[4].text +
        otpController[5].text;
  }

  bool isSignInEnabled() {
    return signInController[0].text.isNotEmpty &&
        signInController[1].text.isNotEmpty &&
        getOTP().length == 6 &&
        !getOTP().contains(' ');
  }

  void _completeLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  Future<dynamic> _failLogin() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: const Text('Thông báo', style: TextStyle(fontSize: 18)),
        titlePadding: const EdgeInsets.only(top: 22, left: 22),
        content: const Text('Đăng nhập thất bại'),
        contentPadding:
            const EdgeInsets.only(top: 16, left: 24.3, right: 40, bottom: 5),
        actionsPadding: const EdgeInsets.only(top: 10, right: 10, bottom: 7),
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
  }

  @override
  void dispose() {
    for (var i = 0; i < 6; i++) {
      if (i < 2) signInController[i].dispose();
      otpController[i].dispose();
      otpFocusNode[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            welcomeUserSignIn(),
            signInField(),
            signInField(_isObscure),
            twoStepAuthentication(),
            otpFields(context),
            signInButton(),
          ],
        ),
      ),
    );
  }

  Container welcomeUserSignIn() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 150, bottom: 20, left: 12),
      child: const Text(
        'Chào mừng !',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  /// params: assign 'isObscure' for password field
  Container signInField([bool? isObscure]) {
    bool isPasswordFields;
    bool izObscure;
    int index;

    isObscure == null
        ? {isPasswordFields = false, izObscure = false, index = 0}
        : {isPasswordFields = true, izObscure = isObscure, index = 1};

    List<String> labels = [
      'Username',
      'Password',
    ];
    var label = labels[index];

    List<IconData> prefixIcons = [
      Icons.person_outline_rounded,
      Icons.lock_outline_rounded,
    ];

    List<IconData> visibility = [
      Icons.visibility_off,
      Icons.visibility,
    ];

    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: signInController[index],
        obscureText: izObscure,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        cursorColor: Colors.orange,
        textInputAction: !isPasswordFields ? TextInputAction.next : null,
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
          prefixIcon: Icon(prefixIcons[index], color: Colors.white),
          suffixIcon: isPasswordFields
              ? IconButton(
                  icon: Icon(
                    !_isObscure ? visibility[0] : visibility[1],
                    color: Colors.orange,
                  ),
                  onPressed: () => switchObscure(),
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
            width: 59,
            height: 75,
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
              },
              onChanged: (value) {
                if (value.length == 6) {
                  for (var i = 0; i < 6; i++) {
                    otpController[i].text = value[i];
                  }
                  FocusScope.of(context).unfocus();
                } // pasting OTP when and only when the OTP is 6 digits
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
        onPressed: isSignInEnabled()
            ? () {
                if (getUsername() == 'admin' &&
                    getPassword() == 'admin' &&
                    getOTP() == '123456') {
                  _completeLogin();
                } else {
                  _failLogin();
                }
              }
            : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.deepPurple[600];
              }
              return Colors.purple[700];
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.purple[900];
            }
            return Colors.orange[400];
          }),
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
