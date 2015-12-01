//: Guibs

import UIKit

//: 基本运算符

// Swift的赋值符(=)不返回值, 算术运算符(+, -, *, /, % 等)会检测并不允许值溢出

//: 术语

// 运算符有一元, 二元和三元运算符

//: 赋值运算符

// 赋值运算(a=b), 表示用b 的值来初始化或更新a 的值

let b = 10

var a = 5

a = b  // a 现在等于10

// 如果赋值的右边是一个多元组, 它的元素可以马上被分解成多个常量或变量

let (x, y) = (1, 2) // 现在x = 1, y = 2

// 与C 语言和 Objective-C 语言不同, Swift 的赋值运算操作不返回任何值

/*

if x = y {

//此句错误, 因为x = y 不反悔任何值

}

*/

//: 算术运算符

1 + 2

5 - 3

2 * 3

10.0 / 2.5

// 与C 语言和Objective-C 语言不同的是, Swift 默认不允许在数值运算中出现溢出情况

// 加法运算符(+)也可以用于String 的拼接

"hello, " + "world"

//: 求余运算符

9 % 4

-9 % 4

9 % -4

// a % b, 对负数b 求余时, b 的符号会被忽略. a % b 和 a % -b 结果是一样的.

//: 浮点数秋雨运算

// 不同于C 语言和Objective-C 语言, Swift 中是可以对浮点数进行求余的

8 % 2.5 // 0.5

//: 自增和自减运算

var i = 0

++i // 现在i = 1

// 当++前置的时候, 先自增再返回

// 当++后置的时候, 先返回再自增

var a1 = 0

let b1 = ++a1 // a1 和b1 现在都是1

let c1 = a1++ // a1 现在是2, 但c 是a 自增前的值1

//: 一元负号运算符

// 数值的正负号可以使用前缀(-)来切换:

let three = 3

let minusThree = -three

let plusThree = -minusThree

//: 一元正号运算符

// 一元正号运算符(+)不做任何改变地返回操作数的值

let minusSix = -6

let alsoMinusSix = +minusSix

//: 复合赋值

var a2 = 1

a2 += 2  // a2 现在是3

// 复合赋值运算没有返回值, let b = a += 2这类代码是错误的

//: 比较运算符

// 每个比较运算符都返回了一个标识表达式是否成立的布尔值

1 == 1

2 != 1

2 > 1

1 < 2

1 >= 1

2 <= 1

// 比较运算多用于条件语句, 如if 条件

let name = "world"

if name == "world" {
    
    print("Hello, World")
    
} else {
    
    print("I'm sorry \(name), but I don't recognize you")
    
}

//: 三目运算符

/*

问题 ? 答案1: 答案2

*/

/*

if question {

answer1

} else {

answer2

}

*/

let contentHeight = 40

let hasHeader = true

let rowHeight = contentHeight + (hasHeader ? 50: 20)

//: 空合运算符

// 空合运算符(a ?? b)将对可选类型a进行空判断, 如果a 包含一个值就进行解封, 否则就返回一个默认值b

// 前提条件: 表达式a 必须是Optional类型, 默认值b 的类型必须要和a 存储值的类型保持一致

// a ?? b  ====  a != nil ? a!: b

let defaultColorName = "red"

var userDefinedColorName: String?

var colorDefinedColorNameToUse = userDefinedColorName ?? defaultColorName

// 由于userDefinedColorName 的值为nil, 所以colorDefinedColorNameToUse 的值为red

userDefinedColorName = "green"

colorDefinedColorNameToUse = userDefinedColorName ?? defaultColorName

// 由于userDefinedColorName 的值为green, 所以colorDefinedColorNameToUse 的值为green

//: 区间运算符

// 闭区间运算符(a...b)定义一个包含从a 到b (包括a 和b)的所有值的去见, b 必须大于等于a

for index in 1...5 {
    
    print(index)
    
}

// 半开区间运算符(a..
