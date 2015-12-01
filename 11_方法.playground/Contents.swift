//: Guibs

import UIKit

//: 方法
// 方法是与某些特定类型相关联的函数. 类、结构体、枚举都可以定义实例方法也可以定义静态方法
/*
    实例方法
    静态方法
*/

//: 实例方法
// 实例方法是属于某个特定的类、结构体或者枚举类型实例的方法. 实例方法提供访问和修改实例属性的方法或提供与实例目的相关的功能, 并以此来支撑实例的功能.
// 实例方法能够隐藏式访问它所属类型的所有的其他实例方法和属性
// 实例方法只能被它所属的类的某个现存的特定实例调用
enum MonsterExp: Int {
    case 骷髅 = 10
    case 毒虫 = 20
    case 独眼巨人 = 30, 幽灵 = 40
}

struct ExpTimes {
    var isOpen = false
    var times = 0
}

class Player {
    var exp = 0
    var expTiems = ExpTimes()
    
    func offLineExp() {
        exp += 200
        print("当前玩家挂机经验值:\(exp)")
    }
    
    func fightExp(theExpOfMonster monsterExp: Int, theTimesOfExp expTimes: Int) {
        exp += monsterExp * expTimes
        if expTiems.isOpen {
            exp *= expTiems.times
        }
        print("Now the exp is \(exp)")
    }
}

var player = Player()
player.offLineExp()
player.fightExp(theExpOfMonster: MonsterExp.毒虫.rawValue, theTimesOfExp: 3)
player.expTiems.isOpen = true
player.expTiems.times = 2
player.fightExp(theExpOfMonster: MonsterExp.毒虫.rawValue, theTimesOfExp: 2)

//: 在实例方法中修改值类型
struct Point {
    var x = 0, y = 0
    mutating func move(mX x: Double, mY y: Double) {

    }
}

var point = Point()
point.x
point.y
point.move(mX: 2, mY: 1)
point.x
point.y

//: 类型方法(静态方法)
// 不用创建特定类型的实例, 就能调用的具体功能函数
class gamer {
    static var name = "guibs"
    class func serverName1() {
        print("The server name1 is \(name)")
    }
    static func serverName2() {
        print("The server name2 is \(name)")
    }
    // 该版本中class 与static 在静态方法名前的修饰效果相同
}

gamer.name
gamer.serverName1()
gamer.serverName2()

