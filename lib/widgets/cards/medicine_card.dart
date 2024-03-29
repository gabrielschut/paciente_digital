import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paciente_digital/model/medicamento.dart';

class MedicineCard extends StatefulWidget {
  final Medicamento medicine;

  const MedicineCard({Key? key, required this.medicine}) : super(key: key);

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        shape: BoxShape.rectangle,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.lightBlue,
          ),
          right: BorderSide(
            width: 1,
            color: Colors.lightBlue,
          ),
          left: BorderSide(
            width: 1,
            color: Colors.lightBlue,
          ),
          bottom: BorderSide(
            width: 1,
            color: Colors.lightBlue,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 4, 4, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    widget.medicine.nome,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 26,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close_sharp,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Dosagem " + widget.medicine.dosagem.toString(),
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "De: " +
                        DateFormat("dd/MM/yyyy")
                            .format(widget.medicine.dataInicial),
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Até: " +
                        DateFormat("dd/MM/yyyy")
                            .format(widget.medicine.dataTermino),
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
