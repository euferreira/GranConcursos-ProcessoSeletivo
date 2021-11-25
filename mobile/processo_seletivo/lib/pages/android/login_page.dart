import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:processo_seletivo/data/controllers/login_controller.dart';
import 'package:processo_seletivo/helpers/rotas.dart';
import 'package:processo_seletivo/model/enum/tipo_login.dart';
import 'package:processo_seletivo/pages/widgets/custom_button.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(controller.usuarioLogado.value
                ? "Bem-vindo, ${controller.tituloTela.value}"
                : "Login"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: controller.usuarioLogado.value ? _usuarioLogado() : _telaLogin(),
            ),
          ),
        ));
  }

  Widget _telaLogin() => Column(
        children: [
          //Titulo
          ListTile(
            title: Text(
              "Login",
              softWrap: true,
              style:
                  GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            subtitle: Divider(
              thickness: 2,
            ),
            trailing: Icon(
              CupertinoIcons.person_add,
              size: 32,
            ),
          ),
          //Formulario
          Form(
            key: controller.formKey.value,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  TextFormField(
                    key: controller.keyLogin,
                    validator: (String value) =>
                        controller.validatorForm(controller.keyLogin, value),
                    onChanged: (String value) =>
                        controller.onChanged(controller.keyLogin, value),
                    keyboardAppearance: Brightness.dark,
                    controller: controller.tLogin.value,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Informe seu e-mail',
                      labelText: 'E-mail',
                      suffixIcon: Icon(Icons.alternate_email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    key: controller.keySenha,
                    validator: (String value) =>
                        controller.validatorForm(controller.keySenha, value),
                    onChanged: (String value) =>
                        controller.onChanged(controller.keySenha, value),
                    keyboardAppearance: Brightness.dark,
                    controller: controller.tSenha.value,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Informe sua senha',
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () => controller.isPassword.value =
                            !controller.isPassword.value,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: controller.isPassword.value,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(() => controller.realizarLogin(TipoLogin.NORMAL),
              controller.showProgress.value, 'Logar', Colors.white, true),
          SizedBox(
            height: 15,
          ),
          //Alternativas de login
          Row(
            children: [
              Expanded(
                  child: Divider(
                thickness: 2,
              )),
              SizedBox(
                width: 10,
              ),
              Text("Ou"),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Divider(
                thickness: 2,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          //Facebook
          Container(
            height: 60,
            width: 250,
            margin: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton.icon(
              onPressed: () => controller.realizarLogin(TipoLogin.FACEBOOK),
              icon: FaIcon(
                FontAwesomeIcons.facebook,
                size: 32,
              ),
              label: Text("Acesse com facebook"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  visualDensity: VisualDensity.comfortable,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: Colors.blue),
                  ))),
            ),
          ),
          //Google
          Container(
            height: 60,
            width: 200,
            child: ElevatedButton.icon(
              onPressed: () => controller.realizarLogin(TipoLogin.GOOGLE),
              icon: FaIcon(
                FontAwesomeIcons.google,
                size: 32,
              ),
              label: Text("Acesse com Google"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  visualDensity: VisualDensity.comfortable,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: Colors.red),
                  ))),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextButton(
            onPressed: () => Get.toNamed(Rotas.cadastroPage),
            child: Text("Ainda não é cadastrado? Cadastra-se agora!"),
          ),
        ],
      );

  Widget _usuarioLogado() => Column(
    children: [
      ListTile(
        title: Text("Olá, ${controller.nomeUsuario.value}"),
      ),
      Row(
        children: [
          Expanded(
              child: Divider(
                thickness: 2,
              )),
          SizedBox(
            width: 10,
          ),
          Text("V 1.0.0"),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Divider(
                thickness: 2,
              )),
        ],
      ),
    ],
  );
}
