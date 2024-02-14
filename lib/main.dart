import 'package:flutter/material.dart';

void main() {
  var app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Homepage(),
        '/editAcc': (context) => const EditAccount(),
        '/connect' : (context) => Bluetooth(),
      },
      initialRoute: '/',
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blind Reader',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Blind Reader", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.red,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // method-----------------------
                  print('Logout Button Clicked!');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 130,
                      height: 130,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage("assets/image/blindPerson.jpg"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Somchai",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                // method-----------------------
                print('History Button Clicked!');
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 193, 193, 193),
                fixedSize: Size(200, 50),
              ),
              child: Text(
                'History',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                // method-----------------------
                Navigator.pushNamed(context, '/editAcc', arguments: "Hello from homepage");
                print('Profile Button Clicked!');
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 193, 193, 193),
                fixedSize: Size(200, 50),
              ),
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                // method-----------------------
                print('How to use Button Clicked!');
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 193, 193, 193),
                fixedSize: Size(200, 50),
              ),
              child: Text(
                'How to use',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // method-----------------------
                  Navigator.pushNamed(context, '/connect', arguments: "Hello from homepage");
                
                  print('Blind Mode Clicked!');
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Blind Mode",
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





class EditAccount extends StatelessWidget {
  //final String data = ModalRoute.of(context)!.settings.arguments as String;
  
  const EditAccount({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Edit account information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Full name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Date of Birth',
                ),
              ),
            ),
            Text(ModalRoute.of(context)!.settings.arguments as String, style: TextStyle(color: Colors.blue),)
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // method-----------------------
            Navigator.pop(context);
            print('Save Button Clicked!');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          child: Text('Save', style: TextStyle(color: Colors.white)),
        ),
      ),
    ));
  }
}
class Bluetooth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/image/Picture1.png', width: 298, height: 330,) ,
        SizedBox(height: 30),
        Text('connection successfully.',style: TextStyle(color: Colors.green,fontSize: 25),
        ),
      ],
    );
  }
}