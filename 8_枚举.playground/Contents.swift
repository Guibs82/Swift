//: Guibs

import UIKit

//: 枚举
// Swift 中的枚举不必给每一个枚举成员提供一个值.如果给枚举成员提供一个值(原始值),则该值的类型可以是字符串, 字符,或是一个整型值或浮点数
// 枚举成员可以指定任意类型的相关值存储到枚举成员值中,你可以定义一组通用的相关成员作为枚举的一部分,每一组都有不同的一组与它相关的适当类型的数值
// 在Swift中,枚举是first-class, 采用了很多传统上只被类(class)所支持的特征,例如 计算型属性(用于提供关于枚举当前值的附加信息),实例方法(用于提供和枚举所代表的值相关联的功能).枚举也可以定义构造函数来提供一个初始值, 也可以在原始的实现基础上扩展他们的功能, 也可以遵守协议来提供标准的功能

//: 枚举的语法
// 枚举定义了一个通用类型的一组相关值,使用enum 关键词来创建枚举并把他们的定义放在一对大括号内
// 枚举名必须以一个大写字母开头
enum SomeEnumeration {
    // enumeration definition goes here
}
// 与C语言和Objective-C 语言不同, Swift 的枚举成员在被创建时不会被赋予一个默认的整型值.
enum CompassPoint1 {
    case East
    case West
    case South
    case North
}
enum CompassPoint2 {
    case East, West, South, North
}

var directionToHead = CompassPoint1.East
directionToHead = .North   // directionToHead 的类型已被生命为一个CompassPoint1, 所以再次赋值可以使用一个缩写语法(.)

//: 匹配枚举值和switch语句
// 在判断一个枚举类型值时, switch语句必须穷举所有情况, 当不需要匹配每个枚举成员的时候,你可以提供一个默认default 分支来涵盖所有未明确被提出的枚举成员
switch directionToHead {
case CompassPoint1.East: print("东")
case .West: print("西")
case .North: print("北")
default:
    print("南")
}

//: 关联值(相关值)
// Swift 的枚举可以存储任何类型的相关值,如果需要的话, 每个成员的数据类型可以是各不相同的.
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}
var product = Barcode.QRCode("ABCDEFGHIJKLMNOP")
product = .UPCA(8, 85909, 51226, 3)
switch product {
case .UPCA(let num1,let num2, let num3,let num4):
    print("The UPCA is\(num1), \(num2), \(num3),\(num4)")
case .QRCode(let qrc):
    print("The QRCode is\(qrc)")
} // 由于case .UPCA 在前,所以当该case 符合条件时, switch 退出
// 如果一个枚举成员的所有相关值都被提取为常量或变量,为了简洁, 你可以只放置一个var或者let 标注在成员名称前
switch product {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPCA is\(numberSystem),\(manufacturer),\(product),\(check).")
case let .QRCode(productCode):
    print(productCode)
}

//: 原始值
// 枚举成员可以被默认值(原始值)赋值,其中这些原始值具有相同类型
// 注意:原始值和相关值是不同的. 当你开始在你的代码中定义枚举的时候原始值是被预先填充的值.对于一个特定的枚举成员, 它的原始值是相同的.相关值是当你在创建一个基于枚举成员的新常量或变量时才会被设置,且每次值可以不同
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

//: 原始值的隐藏赋值
// 在使用原始值为整数或者字符串类型的枚举时,不需要显式的为每一个成员赋值, Swift 将会自动为你赋值
// 当使用整数作为原始值时,隐式赋值的值依次增加1. 如果第一个值没有被赋初值,将会自动设为0
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}   // Planet.Mercury 赋了初值1, Planet.Venus 会拥有隐式赋值2 ...
// 当使用字符串作为枚举类型的初始值时,每个枚举成员的隐式初值就是该成员的名称
enum CompassPoint: String {
    case East, West, South, North
}   //CompassPoint.East 拥有隐式初值East ...

//: 使用rawValue访问枚举成员的原始值
Planet.Earth.rawValue
CompassPoint.East.rawValue

//: 使用原始值来初始化
// 如果在定义枚举类型的时候使用了原始值,那么将自动获得一个初始化方法, 这个方法将原始值类型作为参数, 返回枚举成员或nil
let possiblePlanet = Planet(rawValue: 7) // possiblePlanet 是Planet?类型

//: 递归枚举
// 递归枚举是一种枚举类型,表示他的枚举中有一个或多个枚举成员拥有该枚举的其他成员作为相关值.使用递归枚举时, 编译器会插入一个中间层.你可以在枚举成员前加上indirect 来表示这个成员可递归
// 简单的算数表达式(部分成员可递归)
enum ArithmeticExpression1 {
    case Number(Int)
    indirect case Addition(ArithmeticExpression1, ArithmeticExpression1)
    indirect case Multiplication(ArithmeticExpression1, ArithmeticExpression1)
}
// 在枚举类型的开头加上indirect表示所有成员都是可递归的
indirect enum ArithmeticExpression2 {
    case Number(Int)
    case Addition(ArithmeticExpression2, ArithmeticExpression2)
    case Multiplication(ArithmeticExpression2, ArithmeticExpression2)
}
func evaluate(expression: ArithmeticExpression2) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left,let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left,let right):
        return evaluate(left) * evaluate(right)
    }
}
let five = ArithmeticExpression2.Number(5)
print(evaluate(five))
let four = ArithmeticExpression2.Number(4)
print(evaluate(four))
let sum = ArithmeticExpression2.Addition(five,four)
print(evaluate(sum))
let mul = ArithmeticExpression2.Multiplication(five,four)
print(evaluate(mul))
