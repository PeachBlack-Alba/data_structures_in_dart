import 'dart:io';
import 'package:test/test.dart';
import '../../high_array.dart';



/// To the HighArray class in the `high_array.dart` program
/// add a method called `getMax()` that returns the value of the highest key in the array, or –1 if the array is empty.
/// You can assume all the keys are positive numbers.



class HighArrayTask1  extends HighArray{

  /// Inheritance tha super class
  HighArrayTask1(int max)
      : super(max);


  List<int> a; // ref to array a
  int nElems; // number of data items


  int getMax (){
   if (nElems == 0){
     return -1;
   }
   int max = a[0];
   for ( int i = 0; i < nElems; i++) {
     if (a[i] > max) {
       max = a[i];
     }
   }
   return max;
  }
}

void main() {
  int maxSize = 10; //
  HighArrayTask1 array = new HighArrayTask1(maxSize);
// array size

    array.insert(10);
    array.insert(44);
    array.insert(30);
    array.insert(22);
    array.insert(88);
    array.insert(99);
    array.insert(94);
    array.insert(2);
    array.insert(66);
    array.insert(3);

  // Display items
  array.display();
  stdout.writeln("Largest value in the list :  ${array.getMax()}");
}
