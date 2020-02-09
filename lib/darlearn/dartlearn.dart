
/// 定义一个类
class Point{
  num x;
  num y;
  num z=0;
  num get k=>2;
  set  k(num test)=>x-y;

  Point(num x,num y){
    this.x = x;
    this.y = y;
  }
  Point.origin(num x,num y){
    this.x = x;
    this.y = y;
  }

}
abstract class DartAbstractTestClass{
  void abstractMethod();
}
enum Color { red, green, blue }