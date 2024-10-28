import "package:flutter/material.dart";
import "package:managmentui/widgets/my_button.dart";
import "package:managmentui/widgets/my_textfield.dart";


class RegistrePage extends StatefulWidget {
  final void Function()? onTap;
  const RegistrePage({super.key, required this.onTap});

  @override
  State<RegistrePage> createState() => _RegistrePageState();
}

class _RegistrePageState extends State<RegistrePage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  void signUp() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              child: Column(
                children: [
                  Container(
                      height: 220,
                      padding: const EdgeInsets.all(16),
                      child: Icon(Icons.trolley,size: 150,),),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Welcome back you've been missed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    MyTextfield(
                        controller: emailcontroller,
                        hinttext: "Put your email here",
                        obscuretext: false,
                        icon: const Icon(Icons.person)),
                    const SizedBox(
                      height: 25,
                    ),
                    MyTextfield(
                        controller: passwordcontroller,
                        hinttext: "Put your password here",
                        obscuretext: true,
                        icon: const Icon(Icons.lock)),
                    const SizedBox(
                      height: 25,
                    ),
                    MyTextfield(
                        controller: confirmpasswordcontroller,
                        hinttext: "Confirm your password here",
                        obscuretext: true,
                        icon: const Icon(Icons.lock)),
                    const SizedBox(
                      height: 25,
                    ),
                    MyBuotton(
                      onTap: signUp,
                      text: "Sign In",
                      color: Colors.deepPurple,
                    ),
                    
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already a memeber?",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                            child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))
                      ],
                    )
                  ],
                ))
          ],
        ),
        ),
      ),
    );
  }
}