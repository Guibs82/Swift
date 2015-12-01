//: Guibs

import UIKit

//: 属性
// 存储属性
// 计算属性
// 属性观察器
// 全局变量和局部变量
// 静态属性
/*
    属性: 将值根特定的类、结构或枚举关联
    存储属性: 存储常量或变量作为实例的一部分 [只适用于类和结构体]
    计算属性: 计算(而不是存储)一个值 [可用于类、结构体和枚举里]
    类型属性: 直接用于类型本身的属性
    属性观察器: 监控属性值的变化, 以此来处罚一个自定义的操作 [属性观察器可以添加到自己写的存储属性上, 也可以添加到从父类继承的属性上]
*/

//: 存储属性
// 简单地说, 一个存储属性就是存储在特定类或结构体的实例里的一个常量或变量.
// 从可变性来说存储属性分为 常量存储属性(let) 和 变量存储属性(var)
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

//: 常量结构体的存储属性
// 如果创建了一个结构体的实例并将其赋值给一个常量, 则无法修改该实例的任何属性, 即使定义了变量存储属性
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 1 // 报错, 因为rangeOfFourItems 是let
/*
    报错原因: 结构体 struct 是值类型
             如果此处是class 则可以, 因为class 是引用类型
*/

//: 延时存储类型
// 延时存储类型是指当第一次被调用的时候才会计算其初始值的属性. 在属性声明前使用lazy 来标示
// 延时存储类型必须声明成变量(var), 因为常量属性在构造过程完成之前必须要有初始值.
class GameMap {
    var mapName = "map1"
}

class Hero {
    lazy var fightMap = GameMap()
    var online = true
}

let swifter = Hero() // Hero 实例的fightMap 属性还没有被创建
print(swifter.fightMap.mapName) // 使用时才创建fightMap 对象
// 注意: 如果一个lazy 属性在没有初始化时就同时被多个县城访问, 则无法保证该属性只会被初始化一次

// 一个类型中属性的全部信息(包括命名、类型和内存管理特征)都在唯一一个地方(类型定义中)定义.

//: 计算属性
// 除存储属性外, 类、结构体和枚举可以定义"计算属性", 计算属性不直接存储值, 而是提供一个"getter" 和一个可选的"setter" 来间接获取和设置其他属性或变量的值
struct Point {
    var x = 0, y = 0
}

struct FootLength {
    var walk = 0, run = 0
}

struct Walk {
    var pPoint = Point()
    var pFootLength = FootLength()
    
    var walkPoint: Point {
        get {
            let newX = pPoint.x + pFootLength.walk
            let newY = pPoint.y + pFootLength.walk
            return Point(x: newX, y: newY)
        }
        
        set{
            pPoint.x = newValue.x - pFootLength.walk
            pPoint.y = newValue.y - pFootLength.walk
        }
    }
}

var onceWalk = Walk(pPoint: Point(), pFootLength: FootLength(walk: 10, run: 20))
print("第一次移动后坐标:\(onceWalk.walkPoint.x),\(onceWalk.walkPoint.y)")
print("第一次移动后的人物坐标:\(onceWalk.pPoint.x),\(onceWalk.pPoint.y)")

onceWalk.walkPoint = Point(x: 30, y: 30)
print("第一次移动后坐标:\(onceWalk.walkPoint.x),\(onceWalk.walkPoint.y)")
print("第一次移动后的人物坐标:\(onceWalk.pPoint.x),\(onceWalk.pPoint.y)")
// 计算属性的setter 没有定义表示新值的参数名, 则可以使用默认名称newValue
// 只有getter 没有setter 的计算属性就是只读计算属性
// 只读计算属性的生命可以去掉get 关键字
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

//: 属性观察器
// 属性观察器: 监控和相应属性值的变化, 每次属性被更改值的时候(不论新值和旧值是否相等), 都会调用属性观察器.

/*
    willSet: 在新的值被设置之前调用
             [willSet 观察器会将新的属性值作为固定参数传入, 在willSet的实际代码中可以为这个参数指定一个名称, 如果不指定则使用默认名称newValue]
    didSet:  在新的值被设置之后立即调用
             [didSet 观察器会将旧值作为参数传入, 可以为该参数命名或使用默认名oldValue]

    Ps: 父类的属性在子类的构造器中被赋值时, 它在父类中的willSet 和didSet 观察器会被调用
*/
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("You walked \(newValue) steps just now")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 300

//: 全局变量和局部变量
/*
    全局变量: 在函数、方法、闭包或任何类型之外定义的变量
    局部变量: 在函数、方法或闭包内部定义的变量
*/
// Ps: 全局的常量或变量都是延迟计算的, 局部范围的常量或变量不会延迟计算

//: 类型属性(静态属性)
// 用于定义特定类型所有实例共享的数据, 比如所有实例都能用的一个常量, 或者所有实例都能访问的一个变量
// 使用static 来定义值类型的类型属性
struct kr {
    static var krCount = 0
    var name: String = "kr"
}

let kr1 = kr(name: "kr1")
kr.krCount
