import 'dart:io';
import 'package:test/test.dart';
import '../../high_array.dart';



/// To the HighArray class in the `high_array.dart` program
/// add a method called `getMax()` that returns the value of the highest key in the array, or –1 if the array is empty.
/// You can assume all the keys are positive numbers.

//0. Create class to access data in HighArray file
//1. Access array (nElems) and if its empty =0, return -1
//2. Create var for max to loop
//3. Loop array and if the value is bigger -> thats the max value

class HighArrayTask1  extends HighArray{
  //constructor
  HighArrayTask1(int max)
      : super(max);
  // method
   int getMax (){
   if (nElems == 0){
     return null;
   }
   int max = a[0];
   for ( int i = 1; i < nElems; i++) {
     if (a[i] > max) {
       max = a[i];
     }
   }
   print(max);
   return max;
  }
}

void main() {
  int maxSize = 10; //
  HighArrayTask1 array = new HighArrayTask1(maxSize);
// array size

   /* array.insert(10);
    array.insert(44);
    array.insert(30);
    array.insert(22);
    array.insert(88);
    array.insert(99);
    array.insert(-12);
    array.insert(2);
    array.insert(-48);
    array.insert(3);*/

  // Display items
  array.display();
  stdout.writeln("Largest value in the list :  ${array.getMax()}");
}
