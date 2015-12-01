//: Guibs

import UIKit

//: 继承
/*
    继承的定义
    继承的一般用法
    重写父类的方法和属性
    防止父类的特性被重写
*/

//: 继承的定义
// 一个类可以继承另外一个类的属性、方法和其他特性. 当一个类继承另外一个类时, 它被成为超类(子类), 被继承的类称为基类(父类).
// 继承是类区别其他类型的特定行为
// 可以为类中继承来的属性添加"属性观察器", 这样一来, 当属性值改变时, 类就会被通知到.

//: 继承的一般用法

// 父类
class Car {
    var speed = 0
    var speedDes: String {
        return "速度是\(speed)km/h"
    }
    
    func voice() {
        print("车要发出声音:")
    }
}
// 子类
class Bus: Car {
    var seats = 100
}

let bus = Bus()
bus.speed = 25
print("The bus has \(bus.seats) seats, and \(bus.speedDes)")

//: 重写父类的方法和属性
// 重写方法
class Train: Car {
    override func voice() {
        super.voice()
        print("呜呜~~ 苦茶苦茶~~~")
    }
}
let train = Train()
train.voice()

// 重写属性
class SmallCar: Car {
    override var speedDes: String {
        return "这个小车的速度也是" + super.speedDes
    }
    override var speed: Int {
        didSet {
            if speed > 200 {
                print("高度模式开启")
            }
        }
    }
}
let sc = SmallCar()
sc.speed = 220
print(sc.speedDes)

//: 防止父类的特性被重写
// 通过把类、属性、方法、下标在定义前加上关键字final 就可以防止被重写
// 被final 修饰的类不可悲继承