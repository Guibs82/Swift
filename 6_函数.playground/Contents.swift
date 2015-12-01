//: Guibs

import UIKit

//: 函数

//: 函数的定义和调用
// 当你定义一个函数时, 你可以定义一个或多个有名字和类型的值作为函数的输入(参数, parameters), 也可以定义某种类型的值作为函数执行结束的输出(返回类型, return type)
// 一个函数的实参必须与函数参数列表里参数的顺序一致
func sayHello1(personName: String) -> String {
    let say = "你好, \(personName)"
    return say
}
func sayHello2(personName: String) -> String {
    return "你好, \(personName)"
}
print(sayHello1("Guibs"))

//: 函数的参数和返回值

//: 多重输入参数
// 函数可以有多个输入参数, 写在圆括号中, 用逗号分割
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
print(halfOpenRangeLength(2, end: 4))

//: 多参量函数
// 函数可以有多种输入参数
func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return "Hello"
    } else {
        return "Hello Again"
    }
}
sayHello("Guibs", alreadyGreeted: false)

//: 无参函数
// 函数可以没有参数
func sayHello() -> String {
    return "Hello"
}
print(sayHello())

//: 无返回值函数
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)")
}
sayGoodbye("Guibs")
// 严格上来说, 虽然没有返回值被定义, sayGoodbye(_:)函数依然返回了值. 没有定义返回值类型的函数会返回特殊的值, 叫Void. 它其实是一个空的元组, 没有任何元素, 可以写成()

//: 无返回值的函数调用有返回值的函数
func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}
func printWithoutCount(stringToPrint: String) {
    printAndCount(stringToPrint)
}
printAndCount("Guibs")
printWithoutCount("Guibs")
// 返回值可以被忽略, 但定义了有返回值的函数必须返回一个值, 如果在函数定义底部没有返回值, 并且试图这样做, 将导致编译错误

//: 多重返回值函数
// 可以用元组类型让多个值作为一个复合值从函数中返回
func minMax1(array: [Int]) -> (min: Int, max: Int) {
    var min = array[0]
    var max = array[0]
    for value in array {
        if value < min {
            min = value
        }
        if value > max {
            max = value
        }
    }
    return (min, max)
}
let result1 = minMax1([3, 1, 5, -9, 23])
result1.min
result1.max
// 元组在函数返回类型中定义了名字, 所以不需要在返回时命名

//: 元组可选返回类型
// 元组可选类型(如(Int, Int)?) 与元组包含可选属性(如(Int?, Int?))是不同的. 可选的元组类型, 整个数组是可选的, 而不是元组中的每个元素的值
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        }
        if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
var arrays = [Int]()
let result2 = minMax2(arrays)
result2

//: 函数的参数名称
// 函数的参数都有一个外部参数名和一个本地参数名. 外地参数名用来标记传递给函数调用的参数, 本地参数名在实现函数的时候使用
func someFunction1(firstParaName p1: Int, secondParaName p2: Int) {
    // statements
}
someFunction1(firstParaName: 1, secondParaName: 2)
// 一般情况下, 第一个参数省略其外部参数名, 第二个以后的参数使用其本地参数名作为自己的外部参数名. 所有的参数都需要有不同的本地参数名, 但可以共享相同的外地参数名
func someFunction2(firstParaName: Int, secondParaName: Int) {
    // statements
}
someFunction2(1, secondParaName: 2)
// 如果你不想为第二个以及后续参数设置参数名, 用一个下划线(_)代替一个明确的参数名
func someFunction3(firstParaName: Int, _ secondParaName: Int) {
    // statements
}
someFunction3(1, 2)

//: 默认参数值
// 你可以在函数体中为每个参数定义默认值. 当默认值被定义后, 调用这个函数时可以忽略这个参数的赋值操作
func funcWithDefaultPara(para: String = "Guibs") {
    print("Hello \(para)")
}
funcWithDefaultPara()
funcWithDefaultPara("RIO_G")
// 注意: 将带有默认值的参数放在函数参数列表的最后

//: 可变参数
// 一个可变参数可以接受零个或多个值
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
var result = arithmeticMean(1, 2, 3)
result = arithmeticMean(1.1, 2, 5.9)
// 如果你的函数有一个或者多个参数有默认值, 还有一个可变参数, 请将可变参数放在参数列表的最后

//: 常量参数和变量参数
// 函数参数默认是常量, 可以通过才参数名前加关键字var 来定义变量参数
func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let orginalString = "Hello"
let paddedString = alignRight(orginalString, totalLength: 10, pad: "-")

//: 输入和输出参数
// 如果想要一个函数可以修改参数的值, 并且想要在这些修改在函数调用结束后仍然存在, 那么就应该把这个参数定义为输入输出参数, 在参数定义前加inout 关键字
// 只能将变量作为输入输出参数, 不能传入常量或者字面量, 因为这二者是不能被修改的. 当传入的参数作为输入输出参数时, 需要在参数前加& 符号, 表示这个值可以被修改
// 输入输出参数不能有默认值, 可变参数不能用inout 标记. 如果你用inout 标记一个参数, 就不能再用var 或者let 标记
func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var a1 = 1
var a2 = 2
swapTwoInts(&a1, &a2)
a1
a2

//: 函数类型
// 每个函数都有特定的函数类型, 由函数的参数类型和返回类型组成
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}
// 这两个函数的类型是(Int, Int) -> Int
func printHelloWorld() {
    print("Hello World")
}
// 这个函数的类型是() -> Void

//: 使用函数类型
var mathFunction: (Int, Int) -> Int = addTwoInts
var fucResult = mathFunction(2, 3)

//: 函数类型作为参数类型
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    mathFunction(a, b)
}
printMathResult(mathFunction, 2, 3)

//: 函数类型作为返回类型
func 加一(number: Int) -> Int {
    return number + 1
}
func 减一(number: Int) -> Int {
    return number - 1
}
func returnFunc(choose: Int) -> (Int) -> Int {
    if choose == 1 {
        return 加一
    } else {
        return 减一
    }
}
var returnFunction = returnFunc(1)
returnFunction(2)

//: 嵌套函数
func getSalary(addSalary: Bool) -> (Int, Int) -> Int {
    func add(s: Int, a: Int) -> Int {
        return s + a
    }
    func jian(s: Int, j: Int) -> Int {
        return s - j
    }
    return addSalary ? add: jian
}
var salaryResult = getSalary(true)
salaryResult(1000, 200)
salaryResult = getSalary(false)
salaryResult(1000, 200)
