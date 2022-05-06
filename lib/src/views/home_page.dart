import 'package:emplox/src/components/card_item.dart';
import 'package:emplox/src/components/title_home.dart';
import 'package:emplox/src/presenters/HomePresenter.dart';
import 'package:emplox/src/views/update_func.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key? key, }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeContract {

  late homePresenter presenter;
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    presenter = homePresenter(this);

    presenter.start();
  }

  @override
  loadingManagement() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Meu perfil", style: TextStyle(fontSize: 24),),
                Container(
                  child: ElevatedButton(
                    onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                    child: Icon(Icons.arrow_back, size: 30,),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      onPrimary: Colors.white70,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                     fixedSize: Size(10, 50),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:30.0, left: 30, right:30),
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'), 
                child: const Text("SAIR", style: TextStyle(fontSize: 20,)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white70,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(272, 51),
                ),
              ),
            )
          ],
        ),
      ),
      body: 
      AnimatedBuilder(
        animation: presenter.state, 
        builder: (context, child) => presenter.stateManagement(presenter.state.value)
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateFuncPage(funcId: presenter.id)),);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  homeSuccess() {
    return SingleChildScrollView(
      child: Container(
       color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                alignment: Alignment.centerLeft,
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                icon: const Icon(Icons.menu, size: 35,),
                color: Colors.white70,
              ),
              Container(height:30),
              TitleHome(),
              ListView.builder(
                itemCount: presenter.funcList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var func = presenter.funcList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateFuncPage(
                                  funcId: presenter.id)),
                        );
                      },
                    child: CardItem(funcName: func.name.toString(), funcRole: func.role.toString(), 
                    onPressed: () {
                      presenter.id = func.id;
                      presenter.state.value = HomeState.alert;
                    },),
                  );
                },
              ), 
            ],
          ),
        ),
      ),
    );
  }

  @override
  homeError() {
    return Container(
       color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                alignment: Alignment.centerLeft,
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                icon: const Icon(Icons.menu),
                color: Colors.white70,
              ),
              TitleHome(),
              Container(height: 100,),
              Center(
                child: Text(
                  "Nenhum usuário encontrado!", 
                  style: TextStyle(
                    color: Colors.redAccent, 
                    fontSize: 16,), 
                  textAlign:TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
  }

  @override
  loading() {
    return presenter.isLoading ? Container(child: Center(child: CircularProgressIndicator()), color: Colors.black87, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,) : Container(color: Colors.black87,);
  }

  @override
  alert(int id) {
    return Container(
      color: Colors.black87,
      child: AlertDialog(
        backgroundColor: Colors.black26,
        title: Text('Alerta', style: TextStyle(color: Colors.white),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Deseja realmente deletar esse funcionário?', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Não'),
            onPressed: () {presenter.state.value = HomeState.success;},
          ),
          TextButton(
              onPressed: () => presenter.delete(id),
              child: const Text('Sim'),
          ),
        ],
      ),
    );
  }
}