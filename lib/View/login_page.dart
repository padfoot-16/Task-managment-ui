import "package:flutter/material.dart";
import "package:managmentui/widgets/my_button.dart";
import "package:managmentui/widgets/my_textfield.dart";

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({Key?key, required this.onTap}):super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void signIn() async {
    
  }
  void googlesign()async{
   
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
                    MyBuotton(
                      onTap: signIn,
                      text: "Sign In",
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Or Continue with",
                          style:
                              TextStyle(fontSize: 18, color: Colors.deepPurple),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: googlesign,
                        child: SizedBox(
                            height: 70,
                            child: Image.asset("lib/assets/goo.png")
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not a memeber?",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                            child: const Text(
                          "Register Now",
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
    ));
  }
}