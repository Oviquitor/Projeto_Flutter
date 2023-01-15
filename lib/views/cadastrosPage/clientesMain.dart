import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:project/repository/my_firebase.dart';
import 'package:project/repository/repositorio.dart';
import 'package:project/views/cadastrosPage/clientesScreen.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  final contactsSnapshot = MyFirebase.contactsCollection.snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 120,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: contactsSnapshot,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    final List<QueryDocumentSnapshot> documentos =
                        snapshot.data!.docs;
                    if (documentos.isEmpty) {
                      return Center(
                        child: Text(
                          "Nenhum cliente cadastro",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: documentos.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final contactId = documentos[index].id;
                        final contact =
                            documentos[index].data() as Map<String, dynamic>;
                        final String name = contact['name'];
                        final String phone = contact['phone'];
                        final String email = contact['email'];
                        final String avatar =
                            "https://avatars.dicebear.com/api/avataaars/$name.png";
                        return ListTile(
                          onTap: () {},
                          leading: Hero(
                            tag: contactId,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                avatar,
                              ),
                            ),
                          ),
                          title: Text(name),
                          subtitle: Text("$phone \n$email"),
                          isThreeLine: true,
                          //  trailing should be delete and edit button
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ClientesScreen(
                                          action: ActionScreenClientes.editar,
                                          id: contactId,
                                          name: name,
                                          phone: phone,
                                          email: email),
                                    ),
                                  );
                                },
                                splashRadius: 24,
                                icon: const Icon(IconlyBroken.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  Repositorio().deletar(contactId);
                                },
                                splashRadius: 24,
                                icon: const Icon(IconlyBroken.delete),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Erro ao carregar lista"),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
