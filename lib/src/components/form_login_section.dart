import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class FormLoginSection extends StatefulWidget {
  const FormLoginSection({super.key});

  @override
  FormLoginSectionState createState() {
    return FormLoginSectionState();
  }
}

class FormLoginSectionState extends State<FormLoginSection> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final emailControler = TextEditingController();

  final passwordControler = TextEditingController();

  bool passwordVisible = true;

  Color btnbackgroundColor = Colors.grey.shade300;

  Color btnTextColor = Colors.black26;

  Color borderColor = Colors.grey.shade300;

  bool btnVisible = false;

  bool isHoverBtnSubmit = false;

  @override
  Widget build(BuildContext context) {

    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);
      return value!.isEmpty || !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }

    // Build a Form widget using the _formKey created above.
    return Container(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: Text('Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                ),
                TextFormField(
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailControler,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close,color: Colors.grey,size: 18,),
                      onPressed: () => emailControler.clear(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Enter Email',
                    hintStyle: const TextStyle(fontSize: 16,color:Colors.black45),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    counterText: "",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor, width: 1.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return validateEmail(value);
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 6, left: 10, right: 10),
                  child: Text('Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                ),
                TextFormField(
                  obscureText: passwordVisible,
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordControler,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                       icon: Icon(passwordVisible
                           ? Icons.visibility
                           : Icons.visibility_off),
                       onPressed: () {
                         setState(
                           () {
                             passwordVisible = !passwordVisible;
                           },
                         );
                       },
                     ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Enter password',
                    hintStyle: const TextStyle(fontSize: 16,color:Colors.black45),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    counterText: "",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor, width: 1.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('Go to homepage'),
                      onPressed: () {
                        context.goNamed('home');
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isHoverBtnSubmit ? Colors.blueAccent :Colors.transparent,
                      foregroundColor: isHoverBtnSubmit ? Colors.white : Colors.blueAccent,
                      elevation: 0,
                      side: const BorderSide(
                        width: 1.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
