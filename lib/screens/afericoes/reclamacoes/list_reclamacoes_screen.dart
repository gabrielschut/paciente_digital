import 'package:flutter/material.dart';
import 'package:paciente_digital/model/afericoes/reclamacoes.dart';
import 'package:paciente_digital/screens/afericoes/reclamacoes/new_reclamacoes_screen.dart';
import 'package:paciente_digital/widgets/cards/reclamaaco_card.dart';

class ListReclaacoesScreen extends StatefulWidget {
  final List<Reclamacoes> listReclamacoes;

  const ListReclaacoesScreen({
    Key? key,
    required this.listReclamacoes,
  }) : super(key: key);

  @override
  State<ListReclaacoesScreen> createState() => _ListReclaacoesScreenState();
}

void removeDupliciti(List<Reclamacoes> reclamacoes) {
  reclamacoes = reclamacoes.toSet().toList();
}

class _ListReclaacoesScreenState extends State<ListReclaacoesScreen> {
  @override
  Widget build(BuildContext context) {
    removeDupliciti(widget.listReclamacoes);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Reclamações",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            shape: BoxShape.rectangle,
            border: const Border(
              top: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              right: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              left: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
              bottom: BorderSide(
                width: 2,
                color: Colors.lightBlue,
              ),
            ),
          ),
          height: 550,
          width: 800,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: widget.listReclamacoes.isNotEmpty
                ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: ReclamacoesCard(
                    reclamacoes: widget.listReclamacoes[index],
                  ),
                );
              },
              itemCount: widget.listReclamacoes.length,
            )
                : const Center(
              child: Text(
                "Nenhuma eliminação foi registrada",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //nova eliminação seja destruida após sair ou finalizar e traga
          // de volta para esta tela. E essa pagina seja carregada do zero.
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NewReclamacao())
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
