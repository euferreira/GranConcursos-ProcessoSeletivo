import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:processo_seletivo/data/controllers/cadastro_controller.dart';
import 'package:processo_seletivo/pages/widgets/custom_button.dart';

class CadastroPage extends GetView<CadastroController> {
  const CadastroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Obx(
              () => Column(
                children: [
                  //Titulo
                  ListTile(
                    title: Text(
                      "É simples, fácil e rápido",
                      softWrap: true,
                      style: GoogleFonts.roboto(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      "Informe abaixo seu e-mail e senha, e comece a usar!",
                      softWrap: true,
                      style: GoogleFonts.roboto(),
                    ),
                  ),
                  Divider(thickness: 2,),
                  Form(
                    key: controller.formKey.value,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          TextFormField(
                            key: controller.keyNome,
                            validator: (String value) => controller.validatorForm(controller.keyNome, value),
                            keyboardAppearance: Brightness.dark,
                            controller: controller.tNome.value,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Informe seu nome',
                              labelText: 'Nome',
                              suffixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12,),
                          TextFormField(
                            key: controller.keyEmail,
                            validator: (String value) => controller.validatorForm(controller.keyEmail, value),
                            keyboardAppearance: Brightness.dark,
                            controller: controller.tEmail.value,
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
                            validator: (String value) => controller.validatorForm(
                                controller.keySenha, value),
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
                  SizedBox(height: 10,),
                  CustomButton(controller.cadastrarUsuario, controller.showProgress.value, 'Cadastrar', Colors.white, true),
                ],
              )
          ),
        ),
      ),
    );
  }
}
