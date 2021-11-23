
class Feed_historias extends StatefulWidget {
  const Feed_historias({ Key? key }) : super(key: key);

  @override
  _Feed_historiasState createState() => _Feed_historiasState();
}

class _Feed_historiasState extends State<Feed_historias> {
  
//Referenciar a coleção do Firestore
  // ignore: prefer_typing_uninitialized_variables
  var historias;

  @override
  void initState() {
    super.initState();

    historias = FirebaseFirestore.instance
        .collection('historias');
  }

  //
  // Especificar a aparência de cada elemento da List
  //
  exibirItemColecao(item) {
    String titulo = item.data()['nome'];
    String subtitulo = item.data()['preco'];

    return ListTile(
      title: Text(
        nome,
        style: const TextStyle(fontSize: 30),
      ),
      subtitle: Text(
        'R\$ $preco',
        style: const TextStyle(fontSize: 25),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          //
          // APAGAR um documento
          //
         historias.doc(item.id).delete();
        },
      ),
      onTap: () {
      //  Navigator.pushNamed(context, '/cadastro', arguments: item.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Café Store'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
        actions: [
         
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      backgroundColor: Colors.brown.shade100,

      //
      // LISTAR os documentos da COLEÇÃO
      //
      body: StreamBuilder<QuerySnapshot>(
          //fonte de dados (coleção)
          stream: historias.snapshots(),

          //exibir os dados retornados
          builder: (context, snapshot) {
            //verificar o estado da conexão
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Não foi possível conectar ao Firestore'),
                );

              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              //se os dados foram recebidos com sucesso
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return exibirItemColecao(dados.docs[index]);
                    });
            }
          }),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/cadastro');
        },
      ),
    );
  }
}
