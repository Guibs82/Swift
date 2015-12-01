//: Gubis

import UIKit

//: 控制流
// 循环(for, while)
// 条件(if, guard, switch)
// 控制转移(break, continue, fallthrough, return)

//: For 循环
// for-in 用来遍历一个区间(range), 序列(sequence), 集合(collection), 系列(progression)里面所有的元素执行一系列语句
// for 条件递增(for-condition-increment)语句, 用来重复执行一系列语句直到达成特定条件达成. 一般通过在每次循环完成后增加计数器来实现.

//: for-in 循环
for index in 1...5 {
    print(index)
}
// 如果你不需要知道区间内每一项的值, 你可以用下划线(_)代替变量名来忽略对值的访问
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print(answer)
// 使用for-in 遍历一个数组所有元素
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// 使用for-in 遍历字典
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// for-in 遍历字符串中的字符
let str = "Hello Guibs"
for character in str.characters {
    print(character)
}

//: for 条件递增循环
// for initialization; condition; increment { statements }
var index: Int
for index = 0; index < 3; index++ {
    print(index)
}
index

//: While 循环
// while 循环, 每次在循环开始时计算条件是否符合
// repeat-while 循环, 每次在循环结束时计算条件是否符合

//: while
// while condition { statements }
var start = 0
var finish = 5
while start < finish {
    print("Hello")
    start++
}

//: repeat-while
//repeat { statements } while condition
var begin = 0
var end = 5
repeat {
    print(begin)
    begin++
} while begin < end

//: 条件语句
// if 语句
// switch 语句

//: if
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold.")
} else if temperatureInFahrenheit <= 40 {
    print("It's warm")
} else {
    print("It's hot")
}

//: guard
// guard 语句与if 语句不同的是, guard 语句只会有一个代码块, 不想if 语句可以if else 多个代码块. 如果guard 判断其后的表达式布尔值为false时, 才会执行之后代码块里的代码, 如果为true, 则跳过整个guard 语句
func login(person: [String: String]) {
    guard let name = person["name"] else {
        print("请输入账号")
        return
    }
    
    print("你好\(name)!")
    
    guard let password = person["password"] else {
        print("密码不正确, 不能登入系统")
        return
    }
    
    print("正在登入系统, 用户名:\(name) 密码:\(password)")
}
login(["name": "Guibs"])
login(["name": "Guibs", "password": "ok"])

//: switch
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "e", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
// swift 中的switch 内break 不是必须的, 但依然可以在case 分支中的代码执行完毕前使用break 跳出
// 每一个case 分支都必须包含至少一条语句

//: 匹配区间
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

//: 绑定元组
// 我们可以用元组在同一个switch 语句中测试多个值. 元组中的元素可以是值, 也可以是区间. 另外, 使用下划线(_)来匹配所有可能的值
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the orgin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

//: 值绑定
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

//: where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x = y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x = -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//: 控制转移语句
// continue, break, fallthrough, return

//: continue
// continue 语句会告诉一个循环体立刻停止本次循环迭代, 重新开始下次循环迭代
for index in 1...5 {
    switch index {
    case 1:
        continue
    default:
        print(index)
    }
}

//: break
// break 语句会理科结束整个控制路的执行

//: 循环语句中的break
// 当在一个循环体中使用break 时, 会立刻中断该循环体的执行, 然后跳转到表示循环体结束的大括号(})后面的第一行代码

//: switch 语句中的break
// 当在一个switch 代码块中使用break 时, 会立即中断该switch 代码块的执行, 并且跳转到表示switch 代码块结束时的大括号(})后面的第一行代码

//: fallthrough
// 使用fallthrough 来实现C 风格的贯穿特性
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 15, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += "an integer"
}
print(description)

//: 带标签的语句
// label name: while condition { statements }

//: 检测API 是否可用
//if #availale(iOS 9, OSX 10.10, *) {
//    // 在iOS 使用iOS 9 APIs, 并且在OS X 使用OS X v10.10 APIs
//} else {
//    // 回滚到早前iOS and OS X的API
//}

//: return
// return 就是用在有返回值的方法中, 用来返回方法指定类型的值, 同时结束方法执行; 当然如果没有返回值也可以用来终止方法运行
