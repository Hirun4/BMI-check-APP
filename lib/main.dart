

import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}
class MyApp extends StatefulWidget {
 
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int height=160;
  int weight=60;
  String gender = '';
  late double result= calculate(height: height, weight: weight);
  
  // ignore: recursive_getters
  String get data => data;
  @override
  Widget build(BuildContext context) {
    var bmicategory=bmi(result);
    
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title:"sachith",
      home:SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("BMI calculator",
          style: TextStyle(color: Color.fromARGB(255, 248, 247, 247),fontSize: 30,fontWeight: FontWeight.w600),
          ),
          backgroundColor: const Color.fromARGB(255, 245, 68, 180),
          actions: [IconButton(onPressed:(){}, icon:const Icon(Icons.menu,color: Color.fromARGB(255, 250, 249, 249),)
          )
          ],
          ),
          body:SingleChildScrollView(
            child: Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                          
                           setState(() {
                              gender="M";
                           }
                           
                          );
                        },
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration( color: gender=="M" ?const Color.fromARGB(255, 247, 194, 227):const Color.fromARGB(115, 226, 205, 217),
                             borderRadius: BorderRadius.circular(25)),
                            child: const Column(
                            
                             children: [ 
                             Icon(Icons.male,size: 100,color:  Color.fromARGB(255, 224, 78, 185),),
                             Text("male",style: TextStyle(fontSize: 20),),
                             
                             ],
                            ),
                          ),
                        ),
                        const Spacer(),
                     
                     
                       GestureDetector(
                        onTap: (){
                       
                        setState(() {
                          gender="F";
                        }
                      );
                       
                    },
                         child: Container(
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration( color: gender=="F" ?const Color.fromARGB(255, 247, 194, 227):const Color.fromARGB(115, 226, 205, 217),
                          borderRadius: BorderRadius.circular(25)),
                         
                         
                         
                           child: const Column(
                             children: [
                             Icon(Icons.female,size: 100,color: Color.fromARGB(255, 224, 78, 185),),
                             Text("female",style: TextStyle(fontSize: 20),),
                            
                             ],
                            ),
                         ),
                       ),
                                   ],
                      
                          
                      ),
                   ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text("HEIGHT",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 234, 94, 194)),
                              ),
                               Text("$height cm",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(onPressed: (){
                                        setState(() {
                                        if(height<250){
                                          height++;
                                          result=calculate(height: height, weight: weight);
                                          }
                                        }
                                      );
                                    },
                                     backgroundColor:const Color.fromARGB(255, 233, 142, 197),
                                    child: const Icon(Icons.add)),
                                  ),
                                   FloatingActionButton(onPressed: (){
                                        setState(() {
                                          if(height>50){
                                          height--;
                                          result=calculate(height: height, weight: weight);
              
                                          }
                                        });
                                    },
                                   backgroundColor:const Color.fromARGB(255, 233, 142, 197),
                                    child: const Icon(Icons.remove)
                                   )
                                ],
                              )
                            ],
                          ),
                        ),
                      
                      const Spacer(),
              
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text("WEIGHT",style: TextStyle(fontSize: 30,color:  Color.fromARGB(255, 234, 94, 194)),
                              ),
                               Text("$weight kg",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
              
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(onPressed: (){
                                      setState(() {
                                        if(weight<300){
                                        weight++;
                                        result=calculate(height: height, weight: weight);
                                        }
                                      }
                                    );
                                  },
                                      backgroundColor:const Color.fromARGB(255, 233, 142, 197), child: const Icon(Icons.add)),
                                  ),
                                  FloatingActionButton(onPressed: (){
                                    setState(() {
                                      if(weight>0){
                                      weight--;
                                      result=calculate(height: height, weight: weight);
                                      }
                                    }
                                  );
                                },
                                  backgroundColor:const Color.fromARGB(255, 233, 142, 197), child: const Icon(Icons.remove,color: Color.fromARGB(255, 12, 12, 12),))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
              
                    Column(
                      children: [
                        const Text("RESULT",style: TextStyle(fontSize: 70,color: Color.fromARGB(255, 233, 109, 198),fontWeight: FontWeight.w500),
                        ),
                        Text(result.toStringAsFixed(2),style: const TextStyle(fontSize: 60,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 10,),
                        Container(
                        height: 100,
                        width: 350,
                       
                       
                        decoration: BoxDecoration(
                          
                        // ignore: unrelated_type_equality_checks
                        color: bmicategory == 'Underweight'
                            ? const Color.fromARGB(255, 233, 241, 65)
                            // ignore: unrelated_type_equality_checks
                            : bmicategory == 'Overweight'
                                ? const Color.fromARGB(255, 237, 105, 96)
                                : const Color.fromARGB(255, 96, 241, 101),
                                borderRadius: BorderRadius.circular(50),
                        ),
                                child: Center(child: Text(bmi(result),
                                style: const TextStyle(fontSize: 60,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 248, 247, 247))
                                ,)
                                ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          width: 350,
                          decoration: BoxDecoration(  color: Color.fromARGB(255, 255, 254, 254),
                          borderRadius: BorderRadius.circular(50),
                          
                       
                          ),
                          child:Center(child: Text(gender=="M" ? "You are male":"You are female",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                          ),
                          

                          
                          
                        ),
                      ),
                     

                       Padding(
                         padding: const EdgeInsets.all(1.0),
                         child: Container(
                           height: 100,
                           width: 350,
                           decoration: BoxDecoration(  color: Color.fromARGB(255, 255, 255, 255),
                           borderRadius: BorderRadius.circular(50),
                           
                                                
                           ),
                           child: Center(
                             child: Text(bmicategory == 'Overweight' ? "'Overweight - Consider adopting a balanced diet and regular exercise routine. Consult with a healthcare professional for personalized advice.'" : 
                             bmicategory =='Underweight' ? "'Underweight - Consider consulting with a healthcare professional for personalized advice on nutrition and health.'" : "'Normal - Maintain a healthy lifestyle with regular exercise and balanced nutrition.'",
                             style: const TextStyle(fontSize: 15),),
                           ),
                         
                           
                           
                         ),
                       )
                    
                      
                       
                      ],
                    )
                  
                ],
              ),
          
          ),
        ),
      ),
      
    );
  }
  double calculate({required int height,required int weight}){
     return ((weight/(height*height))*10000);
     
  }
   String bmi(double result){
    if(result<=18.5){
      return 'Underweight';
    }
    if(result>=25){
      return 'Overweight';
    }
    else{
      return 'Normal';
    }
  }

 
  
}


    
  


