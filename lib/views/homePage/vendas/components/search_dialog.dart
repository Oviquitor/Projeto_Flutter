import 'package:flutter/material.dart';
import 'package:project/repository/tmpvendaRepositorio.dart';
import 'package:project/views/homePage/vendas/components/novaVenda.dart';

class SearchDialog extends StatefulWidget {
  final String? id;
  final String? nomeProd;
  final String? ref;
  final String? un;
  final String? marca;
  final String? obs;
  final String? vvenda;
  final String? estoque;

  const SearchDialog({
    super.key,
    this.id,
    this.nomeProd,
    this.ref,
    this.un,
    this.marca,
    this.obs,
    this.vvenda,
    this.estoque,
  });

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nomeProdController;
  late final TextEditingController refController;
  late final TextEditingController unController;
  late final TextEditingController marcaController;
  late final TextEditingController obsController;
  late final TextEditingController vvendaController;
  late final TextEditingController estoqueController;
  final TextEditingController valueController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();

  @override
  void initState() {
    nomeProdController = TextEditingController(text: widget.nomeProd);
    refController = TextEditingController(text: widget.ref);
    unController = TextEditingController(text: widget.un);
    marcaController = TextEditingController(text: widget.marca);
    obsController = TextEditingController(text: widget.obs);
    vvendaController = TextEditingController(text: widget.vvenda);
    estoqueController = TextEditingController(text: widget.estoque);
    super.initState();
  }

  //const SearchDialog(this.initialText);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Positioned(
            top: 200,
            left: 4,
            right: 4,
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        child: Text(
                          'Quant.',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Expanded(
                        child: TextFormField(
                          autofocus: true,
                          controller: valueController,
                          decoration: InputDecoration(),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        child: Text(
                          'Valor ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Expanded(
                        child: TextFormField(
                          autofocus: true,
                          controller: quantidadeController,
                          decoration: InputDecoration(),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                    onPressed: () {
                      tmpVendaRepositorio().addVenda(
                        _formKey,
                        widget.id,
                        nomeProdController.text,
                        refController.text,
                        unController.text,
                        marcaController.text,
                        obsController.text,
                        vvendaController.text,
                        estoqueController.text,
                        context,
                        quantidadeController.text,
                        valueController.text,
                      );
                    },
                    child: Text('Confirmar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
