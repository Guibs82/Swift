//: Guibs

import UIKit

//: 类和结构体
// 类和结构体是人们构建代码所用的一种通用且灵活的构造体. 我们可以使用完全相同的语法规则来为类和结构体定义属性(常量, 变量)和添加方法, 从而扩展类和结构体的功能
// Swift 2.0并不要求你为自定义的类和结构去创建独立的接口和实现文件. 你所要做的是在一个单一文件中定义一个类或结构体, 系统将会自动生成面向其他代码的外部接口

//: 类和结构体对比
/*
Swift 2.0 中, 类和结构体有以下共同点:
定义属性: 用于存储值
定义方法: 用于提供功能
定义下标: 用于访问值
定义构造函数: 用于初始化相关性属性状态
通过扩展: 增加默认实现的功能
通过协议: 提供某种标准功能

与结构体相比, 类还有如下功能:
继承: 使一个类继承另一个类的特性
类型检查: 允许在运行时检查和解释一个类实例的类型
析构: 可以释放实例所占用的资源
引用计数: 使类可以被多次引用
*/

//: 类和结构体的定义
class SomeClass{
    // class definition goes here
}
struct SomeStructure {
    // structure definition goes here
}
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//: 类和结构体实例
let someResolution = Resolution() // 结构体是值类型
let someVideoMode = VideoMode() // 类是引用类型

//: 访问属性
// 使用点语法(.)访问实例中所含有的属性
someResolution.width
someVideoMode.interlaced
someVideoMode.resolution.width = 120
// 与Objective-C 语言不同, Swift 允许直接设置结构体属性的子属性

//: 结构体类型的成员逐一构造器
let vga = Resolution(width: 640, height: 480)
// 与结构体不同, 类实例没有默认的成员逐一构造器

//: 结构体和枚举是值类型
// 值类型被赋予给一个变量, 常量或本身被传递给一个函数的时候, 实际上是值拷贝
// Swift 中, 所有的基本类型: 整数, 浮点数, 布尔值, 字符串, 数组, 字典 都是值类型, 并且都是以结构体的形式在后台所实现
// 在Swift中, 所有的结构体都是值类型. 这意味它们的实例, 以及实例中所包含的任何值类型属性, 在代码中传递的时候都会被复制
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
cinema.width
hd.width

//: 枚举也遵循相同的行为准则
// 值拷贝
enum CompassPoint {
    case East, West, South, North
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
rememberedDirection

//: 类是引用类型
// 引用类型: 在被赋予到一个变量, 常量或者被传递到一个函数时, 操作的是引用. 引用是已存在的实例本身而不是拷贝
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
print(tenEighty.frameRate)
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print(tenEighty.frameRate) // 由25.0 变为30.0

//: 恒等运算符
// 因为类是引用类型, 有可能有多个常量和变量在后台同时引用某一个类的实例
// 恒等运算符可以检测两个常量或变量是否引用同一个实例
// === 等价于
// !== 不等价于
tenEighty === alsoTenEighty
tenEighty !== alsoTenEighty
/*
等价于: 表示两个类类型的常量或变量引用同一个类的实例
等于: 表示两个实例的值"相同"或"相等", 判定是要遵照类设计者定义的评判标准
*/

//: 指针
// 一个Swift 常量或变量引用一个引用类型的实例与C 语言中的指针类似, 不同的是并不直接指向内存中的某个地址, 也不要求用信号(*)来表明在创建一个引用.

//: 类和结构体的选择
/*
当符合一下条件中的一条或者多条时, 考虑结构体:
封装少量相关简单数据
在赋值和传递时使用值拷贝而不是值传递
实例使用值类型, 而非引用类型
不需要继
*/
