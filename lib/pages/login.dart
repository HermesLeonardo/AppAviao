import 'package:appaviao/pages/primeira_tela.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/pages/tela_criar_conta.dart';
import 'package:appaviao/pages/tela_inicial.dart';

class LoginTela extends StatefulWidget {
  const LoginTela({super.key});

  @override
  _LoginTelaState createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.45, // Ajuste da altura do container
                  decoration: BoxDecoration(
                    color: const Color(0xFF003049),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(screenWidth),
                      bottomRight: Radius.circular(screenWidth),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/aviaosfundo.png',
                        height:
                            screenHeight * 0.3, // Aumentei o tamanho da imagem
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  'BEM VINDO DE VOLTA!',
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF003049),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.person, color: Color(0xFF003049)),
                      filled: true,
                      fillColor: const Color(0xFFC7C7C7),
                      hintText: 'Usuário',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o seu usuário';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xFF003049)),
                      filled: true,
                      fillColor: const Color(0xFFC7C7C7),
                      hintText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a sua senha';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _rememberMe = newValue!;
                          });
                        },
                      ),
                      const Text(
                        'Lembrar de mim',
                        style: TextStyle(color: Color(0xFF003049)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrimeiraTela(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 89, 135),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'ENTRAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaCadastro(),
                        ),
                      );
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'Não possui uma conta? ',
                        style: TextStyle(color: Color(0xFF003049)),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Cadastre-se aqui',
                            style: TextStyle(
                              color: Color(0xFF003049),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
