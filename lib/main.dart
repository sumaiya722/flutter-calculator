// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
       // ignore: prefer_const_constructors
return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcbutton(String btntext, Color btncolor, Color textcolor){
  return Container(
      child: ElevatedButton(onPressed:((){
        calculation(btntext);
      }), child: Text(btntext,style: TextStyle(fontSize: 35,color: textcolor),
      ),
          style: ElevatedButton.styleFrom(backgroundColor: btncolor, fixedSize: const Size(87,87),shape: CircleBorder(),padding: EdgeInsets.all(8.0)))
  );
}
  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: Colors.black,

  appBar: AppBar(
    title: Text(expression), // This line displays the expression in the AppBar
    backgroundColor: Colors.black,
  ),
  // appBar: AppBar(title: Text('Calculator'),
  // backgroundColor: Colors.black,
  // ),
  body: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(padding: EdgeInsets.all(10),
          child: Text(text, textAlign: TextAlign.left,style: TextStyle(color: Colors.white, fontSize: 100),
        ),)
      ],
    ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //here we will put the functioning buttons
        calcbutton('AC', Colors.grey, Colors.black),
        calcbutton('(', Colors.grey, Colors.black),
        calcbutton(')', Colors.grey, Colors.black),
        calcbutton('/', Colors.amber.shade700, Colors.white),
      ],),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //here we will put the functioning buttons
              calcbutton('7', Colors.grey.shade800, Colors.white),
              calcbutton('8', Colors.grey.shade800, Colors.white),
              calcbutton('9', Colors.grey.shade700, Colors.white),
              calcbutton('*', Colors.amber.shade700, Colors.white),
            ],),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //here we will put the functioning buttons
              calcbutton('4', Colors.grey.shade800, Colors.white),
              calcbutton('5', Colors.grey.shade800, Colors.white),
              calcbutton('6', Colors.grey.shade700, Colors.white),
              calcbutton('-', Colors.amber.shade700, Colors.white),
            ],),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //here we will put the functioning buttons
              calcbutton('1', Colors.grey.shade800, Colors.white),
              calcbutton('2', Colors.grey.shade800, Colors.white),
              calcbutton('3', Colors.grey.shade700, Colors.white),
              calcbutton('+', Colors.amber.shade700, Colors.white),
            ],),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                // calculation(text);
                calculation('0');
              }, child: Text('0', style: TextStyle(fontSize: 35, color: Colors.white),),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.grey.shade800,
                padding: EdgeInsets.fromLTRB(34, 20, 50, 20),
              ),
              ),
              calcbutton('.', Colors.grey.shade700, Colors.white),
              calcbutton('=', Colors.amber.shade700, Colors.white),
              calcbutton('%', Colors.grey, Colors.black),
            ],
          )
    ]),
  ),
);
  }
  //logic for the calculator
dynamic text='0';
double numOne=0;
double numTwo=0;

dynamic result='';
dynamic finalresult='';
dynamic operator='';
dynamic preoperator='';
dynamic expression = '';

void calculation(btntext) {
  if (btntext == 'AC') {
    text = '0';
    numOne = 0;
    numTwo = 0;
    result = '';
    finalresult = '0';
    operator = '';
    preoperator = '';
  }





  else
  if (btntext == '+' || btntext == '-' || btntext == '*' || btntext == '/' ||
      btntext == '=') {
    if (numOne == 0) {
      numOne = double.parse(result);
    }
    else {
      numTwo = double.parse(result);
    }
    if (operator == '+') {
      finalresult = add();
    }
    else if (operator == '-') {
      finalresult = sub();
    }
    else if (operator == '*') {
      finalresult = mul();
    }
    else if (operator == '/') {
      finalresult = div();
    }
// //percentage
//     else if (operator == '%') {
//       final percentage = (numOne * numTwo) / 100;
//       finalresult = percentage.toString();
//     }

    preoperator=operator;
       operator=btntext;
       result='';
}



  else if(btntext=='%'){

    numTwo = double.parse(result);
    final percentage = (numOne * numTwo) / 100;
    result = percentage.toString();
    finalresult = containDecimal(result);
    expression = '$numOne % $numTwo = $finalresult';
    
    // result=numOne/100;
    // result = result.toString();
    // finalresult = result;
    // expression = '$numOne %';
    // finalresult=containDecimal(result);

  }
  else if(btntext=='.'){
    if(!result.toString().contains('.')){
      result=result.toString() + '.';
    }
    finalresult=result;
    }
  else if(btntext=='+/-'){
    result.toString().startsWith('-')
        ? result=result.toString().substring(1)
        : result='-' + result .toString();
  }

  else {
    if (result == '0') {
      result = btntext;
    } else {
      result = result + btntext;
    }
    finalresult = result;
    //expression showing
    if (numOne == 0) {
      expression = finalresult;
    } else {
      expression = '$numOne $operator $finalresult';
    }
  }
setState(() {
  text=finalresult;
});
}
String add() {
  result = (numOne + numTwo).toString();
  numOne = double.parse(result);
  return containDecimal(result);
}
String sub() {
  result = (numOne - numTwo).toString();
  numOne = double.parse(result);
  return containDecimal(result);
}
String mul() {
  result = (numOne * numTwo).toString();
  numOne = double.parse(result);
  return containDecimal(result);
}
String div() {
  result = (numOne / numTwo).toString();
  numOne = double.parse(result);
  return containDecimal(result);
}
String containDecimal(dynamic result){
  if(result.toString().contains('.')){
    List<String> splitDecimal= result.toString().split('.');
    if(!(int.parse(splitDecimal[1])>0)){
      return result=splitDecimal[0].toString();
    }
  }
  return result;
}
}