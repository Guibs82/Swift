//: Guibs

import UIKit

//: 闭包

//: 闭包的定义
// 闭包是自包含的函数代码块,可以在代码中被传递和使用. 闭包可以捕获和存储其所在上下文中任意常量和变量的引用. Swift会为你管理在捕获过程中涉及到的所有内存操作.
/*
在函数章节中介绍的全局和嵌套函数实际上也是特殊的闭包,闭包采取如下三种形式之一:
全局函数:一个有名字但不会捕获任何值的闭包
嵌套函数:一个有名字并且可以捕获其封闭函数域内值的闭包
闭包表达式:是一个利用轻量级语法所写的可以捕获其上下文中变量或者常量值的匿名闭包
*/
/*
Swift 2.0鼓励开发者在常见场景中进行语法优化,主要优化如下:
利用上下文推断参数和返回值类型
隐式返回单表达式闭包,即单表达式闭包可以省略return 关键字
参数名称缩写
尾随闭包的使用
*/

//: 闭包表达式
// 闭包表达式是一种利用简洁语法构建内联闭包的方式

//: sorted 函数
// Swift 标准库提供了名为sort的函数, 会根据你提供的用于排序的闭包函数将已知类型数组中的值进行排序.一旦完成, sort 方法会返回一个与原数组大小相同,包含同类型元素企鹅元素已正确排序的新数组. 原数组不会被sort 方法修改
let city = ["Alix","Jack", "Guibs","Mick"]
city.sort()
// sort 函数需要传入两个参数
// 1. 已知类型的数组
// 2. 闭包函数,该闭包函数需要传入与数组类型相同的两个值, 并返回一个布尔类型值来告诉sorted 函数当排序结束后传入的第一个参数排在第二个参数前面还是后面.如果第一个参数值出现在第二个参数值前面, 排序闭包函数需要返回true, 反之返回false
func backward(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var newCity1 = city.sort(backward)

//: 闭包表达式语法
/*
闭包表达式语法一般形式:
{
(parameters) -> return Type in
statements
}
*/
// 闭包表达式语法可以使用常量,变量和inout 作为参数,不提供默认值. 也可以在参数列表的最后使用可变参数.元组也可以作为参数和返回值.
var newCity2 = city .sort({(s1:String, s2: String) ->Bool in
    return s1 > s2
})

//: 根据上下文推断
// 因为排序闭包函数是作为sort方法的参数进行传入的, Swift 可以推断其参数和返回值类型, 返回剪头(->)和在参数周围的括号也可以被省略
var newCity3 = city.sort({s1, s2 in return s1 > s2})

//: 单表达式闭包隐式返回
// 如果闭包的语句只有单表达式,可以把return 省略掉
var newCity4 = city.sort({s1, s2 in s1 > s2})

//: 参数名称缩写
// Swift 自动为内联函数提供了半数名缩写功能,您可以直接通过$0, $1, $2... 来顺序调用闭包的参数. 如果你在闭包表达式中使用参数名称缩写,您可以在闭包参数列表中省略对其定义, 并且对应参数名称缩写的类型会通过函数类型进行推断. in 关键字同样也可以被省略.
var newCity5 = city.sort({$0 > $1})

//: 运算符函数
// Swift 2.0的String类型定义了关于大于号(>)的字符串实现,其作为一个函数接受两个String 类型的参数并返回Bool 类型的值.
var newCity6 = city.sort(>)

//: 尾随闭包
// 如果闭包是函数最后一个参数,我们可以使用尾随闭包来增强函数的可读性.
func someFunctionThatTakesAClosure(closure: () ->Void) {
    // Statements
}
// 不使用尾随闭包的函数调用
someFunctionThatTakesAClosure({
    // 闭包主体部分
})
// 使用尾随闭包的函数调用
someFunctionThatTakesAClosure(){
    // 闭包主体部分
}
var newCity7 = city.sort(){$0 > $1}
// 数字转换 --尾随闭包在函数后简洁封装了具体的闭包功能, 而不再需要将整个闭包包裹在map 函数的括号内
let ditNumber: Dictionary = [
    0: "零", 1:"一", 2:"二", 3:"三", 4:"四",
    5: "五", 6:"六", 7:"七", 8:"八", 9:"九"
]
// 需要转换为汉字的数字数组
let numbers = [1800, 756, 9800]
// 尾随闭包
let strResult = numbers.map{
    (var number) -> String in
    var outPut: String = ""
    while(number > 0) {
        outPut = ditNumber[number % 10]! + outPut
        number /= 10
    }
    return outPut
}

//: 捕获值
// 闭包可以在其定义的上下文中捕获常量或变量,即使定义这些常量和变量的原域已经不存在, 闭包仍然可以在闭包函数体内引用和修改这些值
// Swift 2.0 最简单的闭包形式是嵌套函数,也就是定义在其他函数的函数体内的函数. 嵌套函数可以捕获外部函数所有的参数以及定义的常量和变量
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
// 注意:如果你将闭包赋值给一个类实例属性, 并且该闭包通过指向该实例或其他成员来捕获了该实例, 你将创建一个在闭包和实例间的强引用环. Swift 用捕获列表来打破这种强引用环

//: 闭包是引用类型
// 函数和闭包都是引用类型
// 无论你将函数或者闭包赋值给一个常量还是变量,实际都是将常量或变量的值设置为对应函数或闭包的引用
