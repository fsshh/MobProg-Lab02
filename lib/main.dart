import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import flutter material design
// text, container, scaffold, appbar, etc.
void main() {
  // starting point of every dart file

  runApp(const SimplePortfolioApp());
  // flutter function that runs our application
  // function - standalone block of code
  // method - a function that define within a class and operates on objects data
  // 
  // MyApp() - your application
}
  
class SimplePortfolioApp extends StatelessWidget{
  // class name 
  // doesn't change
  const SimplePortfolioApp ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp (
    debugShowCheckedModeBanner: false,
    title: 'Portfolio',
    home: HomePage(),


    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
  // State - return the objects
  // State for the HomePage
  // createState - Method
  // _HomePageState() - hold data that can change, trigger rebuild our application
}

class _HomePageState extends State<HomePage>{
  String selectedPage = 'Home';
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  Widget _buildContent() {
    if (selectedPage == 'Home') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              'lib/assets/images/dexter1x1.jpg',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Dexter Logdonio',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Flutter Developer',
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      );
    }
    return Text('Coming soon: $selectedPage');
  }

  @override
  Widget build(BuildContext context){
      return Scaffold( // page structure (hold AppBar, drawer, body)
      backgroundColor: Color.fromARGB(0, 215, 13, 161),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
        title: Text('Portfolio',
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Dexter Logdonio'),
                  SizedBox(height: 4),
                  Text('Flutter Developer'),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home, color: Colors.blue),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedPage = 'Home';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedPage = 'About';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.lightbulb, color: Colors.blue),
              title: Text('Skills'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedPage = 'Skills';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedPage = 'Contact';
                });
              },
            ),

            Divider(),
              ListTile(
                leading: Icon(Icons.download, color: Colors.blue),
                title: Text('Download Resume'),
                onTap: () {
                  Navigator.pop(context);
                  print('Download Resume tapped');
                },
            ),
          ],
        )
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: _buildContent(),
            ),
          ),
      ),


    );
  } 

  @override 
  void dispose(){
     _scrollController.dispose();
    super.dispose();
  }
}

