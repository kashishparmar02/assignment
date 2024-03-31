import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:code_editor/code_editor.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/java.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[900],
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/allProblems': (context) => AllProblemsPage(),
        '/allPopularQuestions': (context) => AllPopularQuestionsPage(),
        "/problemDetails": (context) => ProblemDetailsPage(),
        '/savedQuestions': (context) => SavedQuestionsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static final List _pages = [
    HomePage(),
    SavedQuestionsPage(),
    Center(child: Text('Profile Page')),
  ];

  final List<Map<String, dynamic>> savedQuestions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle_outlined),
        title: Row(
          children: [
            SizedBox(width: 3),
            Text(
              'John Doe',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: Colors.white),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> recentProblems = [
    {
      'title': 'Two Sum',
      'type': 'Array',
      'description':
      'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.',
    },
    {
      'title': 'Reverse String',
      'type': 'String',
      'description':
      'Write a function that reverses a string. The input string is given as an array of characters s.',
    },

    {
      'title': 'Reverse linked list',
      'type': 'Linked List',
      'description':
      'Write a function that reverses a linkedlist.',
    },
    {
      'title': 'Parentheses match',
      'type': 'Stack',
      'description':
      'Check whether parentheses are matching or not',
    },
    {
      'title': 'Palindrome',
      'type': 'String',
      'description':
      'Check whether the string is palindrome or not',
    },
  ];

  final List<Map<String, dynamic>> popularQuestions = [
    {
      'title': 'Two Sum',
      'type': 'Array',
      'description':
      'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.',
      'constraints': 'Constraints for Two Sum problem',
      'testCases': 'Test cases for Two Sum problem',
      'sampleIO': 'Sample input/output for Two Sum problem',
    },
    {
      'title': 'Reverse String',
      'type': 'String',
      'description':
      'Write a function that reverses a string. The input string is given as an array of characters s.',
      'constraints': 'Constraints for Reverse String problem',
      'testCases': 'Test cases for Reverse String problem',
      'sampleIO': 'Sample input/output for Reverse String problem',
    },
    {
      'title': 'Balanced Binary Tree',
      'type': 'Tree',
      'description':
      'Given a binary tree, determine if it is height-balanced',
      'constraints': 'Constraints for Reverse String problem',
      'testCases': 'Test cases for the problem',
      'sampleIO': 'Sample input/output for the problem',
    },
    {
      'title': 'Linked List Cycle',
      'type': 'Linked List',
      'description':
      'Given head, the head of a linked list, determine if the linked list has a cycle in it.',
      'constraints': 'Constraints for Reverse String problem',
      'testCases': 'Test cases for the problem',
      'sampleIO': 'Sample input/output for the problem',
    },
{
'title': 'Linked List Nodes',
'type': 'Linked List',
'description':
'Given head, the head of a linked list, determine number of nodes in it.',
'constraints': 'Constraints for Reverse String problem',
'testCases': 'Test cases for the problem',
'sampleIO': 'Sample input/output for the problem',
},
    // Add more popular questions here
  ];

  @override
  Widget build(BuildContext context) {
    final savedQuestions =
    (context.findAncestorStateOfType<_MyHomePageState>()!.savedQuestions);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        hintText: 'Search a problem',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Handle filter button press
                    },
                    icon: Icon(Icons.filter_list, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/allProblems');
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: recentProblems.map((problem) {
                  final tileColor = getTileColor(problem['type']);
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/problemDetails',
                        arguments: problem,
                      );
                    },
                    child: Container(
                      width: 120,
                      height: 100,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: tileColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              problem['title'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Type: ${problem['type']}',
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Questions:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/allPopularQuestions');
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: popularQuestions.length,
              itemBuilder: (context, index) {
                final question = popularQuestions[index];
                final tileColor = getTileColor(question['type']);
                final isSaved =
                savedQuestions.contains(mapQuestion(question));
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: tileColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      question['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Type: ${question['type']}',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_add_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isSaved) {
                            savedQuestions.remove(mapQuestion(question));
                          } else {
                            savedQuestions.add(mapQuestion(question));
                          }
                        });
                      },
                    ),
                    onTap: () {
                      _showCodeScreen(context, question);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color getTileColor(String problemType) {
    switch (problemType) {
      case 'Array':
        return Colors.blue;
      case 'String':
        return Colors.green;
      case 'Linked List':
        return Colors.purple;
      case 'Tree':
        return Colors.orange;
      case 'Graph':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Map<String, dynamic> mapQuestion(Map<String, dynamic> question) {
    return {
      'title': question['title'],
      'type': question['type'],
      'description': question['description'],
      'constraints': question['constraints'],
      'testCases': question['testCases'],
      'sampleIO': question['sampleIO'],
    };
  }
}

class AllProblemsPage extends StatelessWidget {
  final List<Map<String, dynamic>> allProblems = [
    {
      'title': 'Two Sum',
      'type': 'Array',
      'description':
      'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.',
    },
    {
      'title': 'Reverse String',
      'type': 'String',
      'description':
      'Write a function that reverses a string. The input string is given as an array of characters s.',
    },
    // Add all other problems here
    {
      'title': 'Reverse String',
      'type': 'String',
      'description':
      'Write a function that reverses a string. The input string is given as an array of characters s.',

    },
    {
      'title': 'Balanced Binary Tree',
      'type': 'Tree',
      'description':
      'Given a binary tree, determine if it is height-balanced',

    },
    {
      'title': 'Linked List Cycle',
      'type': 'Linked List',
      'description':
      'Given head, the head of a linked list, determine if the linked list has a cycle in it.',

    },
    {
      'title': 'Linked List Nodes',
      'type': 'Linked List',
      'description':
      'Given head, the head of a linked list, determine number of nodes in it.',

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Problems'),
      ),
      body: ListView.builder(
        itemCount: allProblems.length,
        itemBuilder: (context, index) {
          final problem = allProblems[index];
          final tileColor = getTileColor(problem['type']);
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                problem['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Type: ${problem['type']}',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/problemDetails',
                  arguments: problem,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Color getTileColor(String problemType) {
    switch (problemType) {
      case 'Array':
        return Colors.blue;
      case 'String':
        return Colors.green;
      case 'Linked List':
        return Colors.purple;
      case 'Tree':
        return Colors.orange;
      case 'Graph':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

class AllPopularQuestionsPage extends StatefulWidget {
  @override
  _AllPopularQuestionsPageState createState() => _AllPopularQuestionsPageState();
}

class _AllPopularQuestionsPageState extends State<AllPopularQuestionsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> popularQuestions =
    [
      {
        'title': 'Two Sum',
        'type': 'Array',
        'description':
        'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.',
        'constraints': 'Constraints for Two Sum problem',
        'testCases': 'Test cases for Two Sum problem',
        'sampleIO': 'Sample input/output for Two Sum problem',
      },
      {
        'title': 'Reverse String',
        'type': 'String',
        'description':
        'Write a function that reverses a string. The input string is given as an array of characters s.',
        'constraints': 'Constraints for Reverse String problem',
        'testCases': 'Test cases for Reverse String problem',
        'sampleIO': 'Sample input/output for Reverse String problem',
      },
      // Add more popular questions here
      {
        'title': 'Balanced Binary Tree',
        'type': 'Tree',
        'description':
        'Given a binary tree, determine if it is height-balanced',
        'constraints': 'Constraints for Reverse String problem',
        'testCases': 'Test cases for the problem',
        'sampleIO': 'Sample input/output for the problem',
      },
      {
        'title': 'Linked List Cycle',
        'type': 'Linked List',
        'description':
        'Given head, the head of a linked list, determine if the linked list has a cycle in it.',
        'constraints': 'Constraints for Reverse String problem',
        'testCases': 'Test cases for the problem',
        'sampleIO': 'Sample input/output for the problem',
      },
      {
        'title': 'Linked List Nodes',
        'type': 'Linked List',
        'description':
        'Given head, the head of a linked list, determine number of nodes in it.',
        'constraints': 'Constraints for Reverse String problem',
        'testCases': 'Test cases for the problem',
        'sampleIO': 'Sample input/output for the problem',
      },
      {
        'title': 'Tree Diameter',
        'type': 'Tree',
        'description':
        'Find the diameter of the given tree.',
        'constraints': 'Constraints for Reverse String problem',
        'testCases': 'Test cases for the problem',
        'sampleIO': 'Sample input/output for the problem',
      },
      {
        'title': 'FCFS',
        'type': 'Queue',
        'description':
        'IMplement the FCFS Algo using queue.',
        'constraints': 'Constraints for Reverse String problem',
        'testCases': 'Test cases for the problem',
        'sampleIO': 'Sample input/output for the problem',
      },
    ];

    // Access savedQuestions from the parent stateful widget
    final List<Map<String, dynamic>> savedQuestions =
        (context.findAncestorStateOfType<_MyHomePageState>() ?? _MyHomePageState())
            .savedQuestions;

    return Scaffold(
      appBar: AppBar(
        title: Text('All Popular Questions'),
      ),
      body: ListView.builder(
        itemCount: popularQuestions.length,
        itemBuilder: (context, index) {
          final question = popularQuestions[index];
          final tileColor = getTileColor(question['type']);
          final isSaved = savedQuestions.contains(mapQuestion(question));
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                question['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_outline,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    if (isSaved) {
                      savedQuestions.remove(mapQuestion(question));
                    } else {
                      savedQuestions.add(mapQuestion(question));
                    }
                  });
                },
              ),
              onTap: () {
                _showCodeScreen(context, question);
              },
            ),
          );
        },
      ),
    );
  }

  Color getTileColor(String questionType) {
    switch (questionType) {
      case 'Array':
        return Colors.blue;
      case 'String':
        return Colors.green;
      case 'Linked List':
        return Colors.purple;
      case 'Tree':
        return Colors.orange;
      case 'Graph':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Map<String, dynamic> mapQuestion(Map<String, dynamic> question) {
    return {
      'title': question['title'],
      'type': question['type'],
      'description': question['description'],
      'constraints': question['constraints'],
      'testCases': question['testCases'],
      'sampleIO': question['sampleIO'],
    };
  }
}



class ProblemDetailsPage extends StatelessWidget {
  final CodeController controller = CodeController(
    text: 'public class Main \npublic static void main(String[] args) \n{\nSystem.out.println("your code here");\n}\n}', // Initial code
    language: java // Choose the language you want to support
  );

  @override
  Widget build(BuildContext context) {
// Receive the problem details as a Map from the arguments
    final Map<String, dynamic>? problemDetails =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;


    return Scaffold(
      appBar: AppBar(
        title: Text('Problem Details'),
      ),
      body: problemDetails == null
          ? Center(
        child: Text('No problem details available'),
      )
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                problemDetails['title'] ?? 'Problem Title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                problemDetails['description'] ?? 'Problem Description',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Constraints',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                problemDetails['constraints'] ?? 'List of constraints',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Test Cases',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                problemDetails['testCases'] ?? 'List of test cases',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Sample Input/Output',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                problemDetails['sampleIO'] ?? 'Sample input and output',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              // Code editor section remains the same
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[800],
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(Icons.code, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Code Editor',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: CodeTheme(
                        data: CodeThemeData(styles: monokaiSublimeTheme),
                        child: CodeField(
                          controller: controller,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle submit button press
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavedQuestionsPage extends StatefulWidget {
  @override
  _SavedQuestionsPageState createState() => _SavedQuestionsPageState();
}

class _SavedQuestionsPageState extends State<SavedQuestionsPage> {
  @override
  Widget build(BuildContext context) {
    final savedQuestions =
    (context.findAncestorStateOfType<_MyHomePageState>()!.savedQuestions);

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Questions'),
      ),
      body: savedQuestions.isEmpty
          ? Center(
        child: Text(
          'No saved questions',
          style: TextStyle(color: Colors.white),
        ),
      )
          : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: savedQuestions.length,
                  itemBuilder: (context, index) {
                    final question = savedQuestions[index];
                    final tileColor = getTileColor(question['type']);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: tileColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          question['title'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Type: ${question['type']}',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        onTap: () {
                          _showCodeScreen(context, question);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getTileColor(String questionType) {
    switch (questionType) {
      case 'Array':
        return Colors.blue;
      case 'String':
        return Colors.green;
      case 'Linked List':
        return Colors.purple;
      case 'Tree':
        return Colors.orange;
      case 'Graph':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}


void _showCodeScreen(BuildContext context, Map<String, dynamic> questionDetails) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Alert"),
        content: Text("Avoid any kind of plagiarism"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                '/problemDetails',
                arguments: questionDetails,
              );
            },
            child: Text("Agree"),
          ),
          // TextButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: Text("No"),
          // ),
        ],
      );
    },
  );
}
