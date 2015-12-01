//: Guibs

import UIKit

//: 初始化
/*
    初始化: 是类、结构体或枚举实例化前的准备过程. 此过程主要是为存储属性赋予初始值, 并且执行一些创建实例需要的一些值的设置和初始化
    构造器: 用来创建特定类型新实例的特殊方法

    Ps: 与Objective-C 中的构造器不同, Swift 的构造器无需返回值, 他们主要任务是保证新实例在第一次使用前正确完成初始化
*/

//: 为存储属性赋值
// 类和结构体在创建实例时, 必须为所有的存储属性设置合适的初始值. 存储属性的值不能处于一个未知的状态
/*
    init() {
        //构造过程
    }
*/
class 优衣库 {
    let pb: String = "boy" // 默认值属性
    let pg: String
    
    init() {        // 构造器赋值
        pg = "girl"
    }
}
let place = 优衣库()
place.pb
place.pg

//: 自定义构造器
class A {
    var va: Double = 1.0
    init(状态1 a1: Double) {
        va += a1
        print("状态1:\(va)")
    }
    init(状态2 a2: Double) {
        va -= a2
        print("状态1:\(va)")
    }
}

let a1 = A(状态1: 1)
let a2 = A(状态2: 1)
// Ps: 你可以在构造过程中的任意时间点修改常量属性的值,只要在构造过程结束时是一个确定的值

//: 默认构造器
/*
    类的默认构造器: 调用时没哟任何参数
    结构体的默认构造器: 调用时分为没有任何参数的构造器 和 逐一显示成员属性参数的构造器两种
*/
class CTest {
    var pa: String?
    var pb: Int = 0
    var pc = false
}
let cTest = CTest()
cTest.pa
cTest.pb
cTest.pc

struct STest {
    var pa: String?
    var pb: Int = 0
    var pc = false
}
let sTest1 = STest()
sTest1.pa
sTest1.pb
sTest1.pc
let sTest2 = STest(pa: "lalala", pb: 1, pc: true)
sTest2.pa
sTest2.pb
sTest2.pc

//: 值类型的初始化
struct KM1 {
    var s1 = 0
    var s2 = 0
}

struct KM2 {
    var s1 = 0
    var s2 = 0
}

struct Test {
    var km1s = KM1()
    var km2s = KM2()
    init() {
        print("一门没考!")
    }
    init(km1s: KM1, km2s: KM2) {
        self.km1s = km1s
        self.km2s = km2s
    }
    init(km1sWillAdd: KM1, km2s: KM2) {
        let km1sAddS1 = km1sWillAdd.s1 + 10
        let km1sAddS2 = km1sWillAdd.s2 + 10
        let km1s = KM1(s1: km1sAddS1, s2: km1sAddS2)
        self.km1s = km1s
        self.km2s = km2s
    }
}

let t1 = Test()
t1.km1s.s1
t1.km1s.s2
t1.km2s.s1
t1.km2s.s2

let km1 = KM1(s1: 1, s2: 1)
let km2 = KM2(s1: 1, s2: 1)

let t2 = Test(km1s: km1, km2s: km2)
t2.km1s.s1
t2.km1s.s2
t2.km2s.s1
t2.km2s.s2

let t3 = Test(km1sWillAdd: km1, km2s: km2)
t3.km1s.s1
t3.km1s.s2
t3.km2s.s1
t3.km2s.s2

//: 引用类型的初始化
// 引用类型的初始化主要是指:类里面的所有存储属性,包括所有继承自父类 的属性,都必须在构造过程中设置初始值。

//: 指定构造器
/*
    类中最主要的构造器
    每一个类至少有一个指定构造器
    初始化本类中提供的所有属性
    调用父类的构造函数初始化父类的属性
    init(参数) {
        语句
    }
*/

//: 便利构造器
/*
    类中次要的构造器
    可以调用类中的指定构造器
    创建特别类型的实例
    是调用指定构造器的快捷方式
    convenience init(参数) {
        语句
    }
*/

//: 类的代理初始化调用
/*
    规则:
        指定构造器必须调用其直接弗雷德指定构造器(向上代理)
        便利构造器必须调用同一类中定义的其他构造器(横向代理)
        便利构造器必须最终以调用一个指定构造器结束(指定结束)
*/

//: 两段式构造过程
/*
    第一阶段: 每个存储属性通过引入它们的类的构造函数来设置初始值。当每一个存储属性值被确定后, 第二阶段开始, 它给每个类一次机会在新实例准备使用之前进一步定制它们的存储型属性。
*/

//: 四种有效的安全检查
/*
    安全检查1:
    指定构造函数必须保证它所在类引入的所有属性都必须先初始化完成, 之后才能将其它构造任务向上代理给父类中的构造函数。
    如上所述, 一个对象的内存只有在其所有存储属性确定之后才能完全初始化。为了满足这一规则, 指定构造函数必须保证它所在类引入的属性在它往上代理之前先完成初始化。
    安全检查2:
    指定构造函数必须先向上代理调用父类构造函数, 然后再为继承的属性设置新值。如果没这么做, 指定构造函数赋予的新值将被父类中的构造函数所覆盖。
    安全检查3:
    便利构造函数必须先代理调用同一类中的其它构造函数, 然后再为任意属性赋新值。如果没这么做, 便利构造函数赋予的新值将被同一类中其它指定构造函数所覆盖。
    安全检查4:
    构造函数在第一阶段构造完成之前, 不能调用任何实例方法、不能读取任何实例属性的值, self的值不能被引用。
*/