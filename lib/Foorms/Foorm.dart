import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name='';
  String _email='';
  String _Leader='';
  String _CLGNAME='';
  String _phoneNumber='';
  String _TeamSize='';
  String _AboutAbstract='';
 

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return Column(
      children: [
      const Padding(
           padding:  EdgeInsets.only(right:278.0,bottom: 5),
           child: Row(
             children: [
               Text("Team Name",
               style: TextStyle(fontSize: 20),),
                 Text("*",
               style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 189, 38, 27)),),
             ],
           ),
         ),
     TextFormField(
      
      decoration: InputDecoration(
        
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'Enter your Name',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _name = value??'';
      },
    ),
      ]
    );
  }
  

  Widget _buildEmail() {
     return
     Column(
      children:[ 
        Text('Email ID'),
        TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'Enter Mail Id',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _email = value??'';
      },
    )]
     );
   
  }

  Widget _buildLeader() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'Enter your Name',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _Leader = value??'';
      },
    );
  }

  Widget _buildCLGNAME() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'Enter Collage Name',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _CLGNAME = value??'';
      },
    );
  }

  Widget _buildPhoneNumber() {
     return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'Enter your Number',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Number is requierd';
        }

        return null;
      },
      onSaved: (String? value) {
        _phoneNumber = value??'';
      },
    );
  }
   Widget _buiLdAboutAbstract() {
     return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'brief description...............',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'requierd';
        }

        return null;
      },
      onSaved: (String? value) {
        _AboutAbstract = value??'';
      },
    );
  }
   Widget _buiLdTeamSize() {
     return Scaffold();
  }
  


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildName(),
                SizedBox(height: 15),
                _buildEmail(),
                  SizedBox(height: 15),
                    _buildPhoneNumber(),  
                  SizedBox(height: 15),
                _buildCLGNAME(),
                  SizedBox(height: 15),
                     _buildLeader(),
                SizedBox(height: 15),
                    _buiLdAboutAbstract(),
                SizedBox(height: 15),
                _buiLdTeamSize(),
                SizedBox(height: 100),

                ElevatedButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState?.save();
                    

                    print(_name);
                    print(_email);
                    print(_phoneNumber);
                     print(_Leader);
                    print(_CLGNAME);
                   print(_TeamSize);
                     print(_AboutAbstract);
                  
                

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}