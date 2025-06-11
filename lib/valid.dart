import 'package:flutter/material.dart';
class val extends StatefulWidget {
  const val({super.key});

  @override
  State<val> createState() => _valState();
}

class _valState extends State<val> {
  final _key = GlobalKey<FormState>();
  bool _show1 = false;
  TextEditingController ctrl = TextEditingController();
  TextEditingController ctrl1 = TextEditingController();
  TextEditingController ctrl2 = TextEditingController();
  TextEditingController ctrl3 = TextEditingController();
  a(){
    setState(() {
      ctrl.text.isNotEmpty && ctrl1.text.isNotEmpty && ctrl2.text.isNotEmpty && ctrl3.text.isNotEmpty? _show1 = true : _show1 =
      false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Form(
          key:_key,
          child:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: ctrl,
                  onChanged: (i){
                    a();
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter your name',
                      border: OutlineInputBorder()
                  ),
                  validator:(input){
                    if (input == null || input .isEmpty){
                      return "please enter a valid name";
                    }
                  } ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: ctrl1,
                  onChanged: (i){
                    a();
                  },
                  decoration: InputDecoration(
                    hintText: "enter the mail id",
                    border: OutlineInputBorder(),
                  ),
                  validator: (input){
                    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!)){
                      return 'please enter a valid id';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: ctrl2,
                    onChanged: (i){
                      a();
                    },
                    decoration: InputDecoration(
                      hintText: "enter the password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (input){
                      if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!)){
                        return "please enter a valid mobile number";
                      }
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: ctrl3,
                  onChanged: (i){
                    a();
                  },
                  decoration: InputDecoration(
                    hintText: "enter the mobile number",
                    border: OutlineInputBorder(),
                  ),
                  validator: (input){
                    if (RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(input!)){
                      return "please enter a valid mobile number";
                    }
                  },
                ),
              ),
              Visibility(
                  visible: _show1,
                  child: ElevatedButton(
                      onPressed: (){

                      },
                      child: Text('Login')))
            ],
          ),
        ));
  }
}
