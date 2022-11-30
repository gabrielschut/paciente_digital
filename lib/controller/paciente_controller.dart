import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/provider/paciente_provider.dart';
import 'package:paciente_digital/screens/paciente/edit_paciente_form_screen.dart';
import 'package:paciente_digital/screens/paciente/new_paciente_form_screen.dart';

class PacienteController extends GetxController {
  final PacienteProvider pacienteProvider = PacienteProvider();

  final pacienteList = <Paciente>[].obs;
  RxBool loading = false.obs;
  String message = "";
  final idPaciente = 0;

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController wightController = TextEditingController();
  TextEditingController circAbdominalCOntroller = TextEditingController();
  TextEditingController heightController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode sexFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();
  FocusNode bloodTypeFocusNode = FocusNode();
  FocusNode wightFocusNode = FocusNode();
  FocusNode circAbdominalFocusNode = FocusNode();
  FocusNode heightFocusNode = FocusNode();

  @override
  void onReady() async {
    super.onReady();
    getAll();
  }

  @override
  getAll() {
    loading(true);
    pacienteProvider.getAll().then((data) {
      pacienteList.value = data;
      loading(false);
    });
  }

  editSaveMode() {
    circAbdominalFocusNode.unfocus();
    if (formKey.currentState!.validate()) {
      loading(true);
      if (Get.arguments == null) {
        savePaciente();
      }
    }
  }

  editUpdateMode() {
    circAbdominalFocusNode.unfocus();
    if (formKey.currentState!.validate()) {
      loading(true);
      if (Get.arguments == null) {
        updatePaciente();
      }
    }
  }

  addPaciente() {
    formKey.currentState?.reset();
    nameController.text = "";
    sexController.text = "";
    ageController.text = "";
    bloodTypeController.text = "";
    wightController.text = "";
    circAbdominalCOntroller.text = "";
    heightController.text = "";
    Get.to(() => NewPacienteForm());
  }

  editPaciente(Paciente paciente) {
    formKey.currentState?.reset();
    nameController.text = paciente.nome;
    sexController.text = paciente.sexo;
    ageController.text = paciente.idade.toString();
    bloodTypeController.text = paciente.tipoSanguineo!;
    wightController.text = paciente.peso.toString();
    circAbdominalCOntroller.text = paciente.circunferenciaAbdominal.toString();
    heightController.text = paciente.altura.toString();
    Get.to(() => EditPacienteForm());
  }

  savePaciente() async {
    final Paciente newPaciente = Paciente(
      id: 0,
      nome: nameController.text.trim(),
      sexo: sexController.text.trim().isNotEmpty? sexController.text : "Indefinido",
      idade: int.parse(ageController.text.trim()),
      peso: double.tryParse(wightController.text.trim()),
      altura: double.tryParse(heightController.text.trim()),
      tipoSanguineo: bloodTypeController.text.trim().isNotEmpty? bloodTypeController.text : "Indefinido",
      circunferenciaAbdominal: double.tryParse(circAbdominalCOntroller.text.trim()),
    );
    pacienteProvider.save(newPaciente).then((value){
      loading(false);
      refreshPacienteList();
    });
  }

  updatePaciente() async {
    final Paciente newPaciente = Paciente(
      id: Get.arguments,
      nome: nameController.text.trim(),
      sexo: sexController.text.trim(),
      idade: int.parse(ageController.text.trim()),
      peso: double.tryParse(wightController.text.trim()),
      altura: double.tryParse(heightController.text.trim()),
      tipoSanguineo: bloodTypeController.text.trim(),
      circunferenciaAbdominal: double.tryParse(circAbdominalCOntroller.text.trim()),
    );
    pacienteProvider.update(newPaciente).then((value){
      loading(false);
      refreshPacienteList();
    });
  }

  deletePaciente(int id) async {
    loading(true);
    pacienteProvider.delete(id).then((value){
      loading(false);
      refreshPacienteList();
    });
  }

  refreshPacienteList() {
    getAll();
    Get.back();
    Get.back();
  }
}
