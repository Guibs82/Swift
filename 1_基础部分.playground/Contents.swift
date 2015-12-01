//: Guibs

import UIKit

//: 基础部分

//: 常量和变量

//: 声明常量和变量

// let: 常量 var: 变量

let maximumNumberOfLoginAttempts = 10

var currentLoginAttempt = 0

//: 类型标注

var welcomeMessage: String

welcomeMessage = "Hello"

//: 常量和变量的命名

// 常量与变量名不能包括数学符号, 箭头, 保留的(或非法的)Unicode 码位, 连线与制表符. 也不能以数字开头, 但是可以在常量与变量名的其他地方包含数字.

var friendlyWelcome = "Hello"

friendlyWelcome = "Bonjour!"

//: 输出常量和变量

print(friendlyWelcome)

print("以字符串插值的方式输出friendlyWelcome的值\(friendlyWelcome)")

//: 注释

// 这是一个注释

/*

这是一个多行注释

*/

/*

这是第一个多行注释的开头

/*这是第二个被嵌套的多行注释*/

这是第一个多行注释的结尾

*/

//: 分号

// 在同一行内写多条独立语句时, 必须用分号

let cat = "?"; print(cat)

//: 整数

// Int 和UInt 类型的长度与当前平台的原生字长相同

Int.min

Int.max

UInt.min

UInt.max

//: 浮点数

// Double 表示64位浮点数, 精确度15位

// Float  表示32位浮点数, 精确度6位

//: 类型安全和类型推断

// 当推断浮点数类型时, Swift 总会选择Double 而不是Float

let meaningOfLife = 42

// meaningOfLife 会被推测为Int 类型

let pi = 3.1415926

// pi 会被推测为Double 类型

let anotherPi = 3 + 0.1415926

// anotherPi 会被推测为Double类型

//: 数值型字面量

// 为了增强可读性, 数值类型字面量可以包含额外的格式增强可读性

let paddedDouble = 000123.456

let oneMillion = 1_000_000

let justOverOneMillion = 1_000_000.000_000_1

//:整数字面量

// 十进制, 无前缀

let decimalInteger = 17

// 二进制, 前缀是0b

let binaryInteger  = 0b10001

// 八进制, 前缀是0o

let octalInteger  = 0o21

// 十六进制, 前缀是0x

let hexadecimalInteger = 0x11

//: 浮点字面量

// 浮点字面量可以是十进制或者十六进制, 小数点两边至少有一个十进制或者十六进制的数字

// 浮点字面量还有一个可选指数(十进制: e 十六进制: p)

let decimalDouble = 17e2

//17 * 10^2

let hexadecimalDouble = 0x11p2

//17 * 2^2

//: 数值类型转换

//: 整数转换

//let cannotBeNegative: UInt8 = -1

// UInt8 类型不能存储负数, 所以会报错

//let tooBig: Int8 = Int8.max + 1

// Int8 类型不能存储超过最大值的值, 所以会报错

let twoThousand: UInt16 = 2_000

let one: UInt8 = 1

let twoThousandAndOne = twoThousand + UInt16(one)

//: 整数和浮点数转换

let three = 3

let pointOneFourOneFiveNine = 0.14159

let piByAdd = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(piByAdd)

// Int() 的方式来初始化一个新的整数时, 浮点值会被截断

//: 类型别名

typealias AudioSample = UInt16

var maxUInt16 = AudioSample.max

// 此时AudioSample 就代指UInt16

//: 布尔值

// Swift 有两个布尔常量, true 和 false

let orangesAreOrange = true

let turnipsAreDelicious = false

//: 元组

// 元组内的值可以是任意类型, 并不要求是相同类型

let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")

print("The status message is \(statusMessage)")

// 如果只需要一部分元组, 分解的时候可以把要忽略的部分用下划线(_)标记

let (justStatusCode, _) = http404Error

print("The status code is \(justStatusCode)")

// 可以通过下标访问元组中的单个元素, 下标从0开始

print("The status code is \(http404Error.0)")

print("The status message is \(http404Error.1)")

// 可以在定义元组的时候给单个元素命名

let http200Status = (statusCode: 200, description: "OK")

// 给元组中元素命名后, 可以通过名字来获取这些元素的值

print("The status code is \(http200Status.statusCode)")

print("The status message is \(http200Status.description)")

// 注意: 元组在临时组织值的时候很有用, 但是并不适合创建复杂结构. 如果你的数据结构不是临时使用, 请使用类或者结构体

//: 可选类型

let possibleNumber = "123"

let convertedNumber = Int(possibleNumber)

// convertedNumber被推测为类型"Int?"(Optional Int)

//: 隐式解析可选类型

// 把想要用作可选类型的后面的问号(如: String?)改为感叹号(如: String!)来声名一个隐式解析可选类型

let possibleString: String? = "An optional string."

let forcedString: String = possibleString! // 需要用感叹号(!)来获取值

let assumedString: String! = "An implicitly unwrapped optional string."

let implicitString: String = assumedString // 不需要用感叹号(!)来获取值

// 注意: 如果你在隐式解析可选类型没有值的时候尝试取值, 一样会触发运行时错误. 所以如果一个变量之后可能变成nil, 请不要使用隐式解析可选类型

//: nil

// nil只能用于可选类型

// 如果你声明一个可选常量或者变量但是并没有赋值, 他们会被自动设置为nil

// 与objective-C 不同, Swift中的nil 指的不是一个不存在对象的指针, 而是一个确定的用来表示值缺失的值

var surveyAnswer: String?

// surveyAnswer 被自动设置为nil

//: if 语句以及强制解析

if convertedNumber != nil {
    
    print("convertedNumber contains some integer value.")
    
}

// 当你确定可选类型确实包含值之后, 你可以在可选的名字后面加一个感叹号(!)来获取值. 这被成为可选值的强制解析

if convertedNumber != nil {
    
    print("convertedNumber has an integer value of \(convertedNumber!)")
    
}

// 注意: 使用!来获取一个不存在的可选值会导致运行时错误

//: 可选绑定

// 使用可选绑定来判断可选类型是否包含值, 如果包含就把值付给一个临时常量或者变量

/*

// 单可选绑定

if let constantName = someOptional {

statements

}

// 多可选绑定

if let constantName = someOptional, anotherConstantName = someOtherOptional {

statements

}

*/

if let actualNumber = Int(possibleNumber) {
    
    print("'\(possibleNumber)'has an integer value of \(actualNumber)")
    
} else {
    
    print("'\(possibleNumber)' could not be converted to an integer")
    
}

//: 错误处理

// 一个函数可以通过在声明中添加throws 关键词来抛出错误消息

func canThrowAnErrow()throws {
    
    // statements
    
}

// 当你的函数能跑出错误消息时, 你应该在表达式中前置try关键字

do {
    
    try canThrowAnErrow()
    
    // 没有错误消息抛出
    
} catch {
    
    // 有一个错误消息抛出
    
} catch {
    
    // statements
    
} catch {
    
    // statements
    
}

// 一个do语句创建了一个新的包含作用域, 使得错误能被传播到一个或多个catch语句

//: 断言

// 断言会在运行时判断一个逻辑条件是否为true, 如果条件为true, 代码会继续进行; 如果位false, 代码之行结束, 你的应用被终止

let age = -3

assert(age >= 0, "A person's age cannot be less than zero")

// 因为age < 0, 所以断言会触发, 控制台打印A person's age cannot be less than zero
