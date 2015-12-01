//: Guibs

import UIKit

//: 集合类型
// Swift 语言提供Array、Set、和Dictionary 三种基本的集合类型用来存储集合数据
// Array(数组)是有序数据的集
// Set(集合)是无序无重复数据的集
// Dictionary(词典)是无序的键值对的集
// Swift 语言中的Array、Set、Dictionary 中存储的数据值类型必须明确

//: Array(数组)
// 数组使用有序列表存储同一类型的多个值. 相同的值可以多次出现在一个数组的不同位置中.
// Array<SomeType> || [SomeType]

//: 创建一个空数组
var peoples1 = Array<String>()
var peoples2 = [String]()
print("peoples1 and peoples2 are \(peoples1) and \(peoples2)")

//: 创建一个带有默认值的数组
var threeDoubles1 = [String](count: 3, repeatedValue: "Guibs")
var threeDoubles2 = Array<String>(count: 3, repeatedValue: "Guibs")

//: 通过两个数组想家创建一个数组
var PC = [String](count: 1, repeatedValue: "Mac")
var Phone = [String](count: 1, repeatedValue: "iPhone")
var Apple = PC + Phone

//: 用字面量构造数组
var shoppingList1: Array<String> = ["iPhone", "MacBook", "iMac", "AppleWatch"]
var shoppingList2: [String] = ["iPhone", "MacBook", "iMac", "AppleWatch"]
var shoppingList3 = ["iPhone", "MacBook", "iMac", "AppleWatch"]

//: 访问和修改数组
// 使用数组的只读属性count 来获取数组中的数据项数量
shoppingList1.count
// 是哟哦那个布尔值属性isEmpty 作为检查数组是否为空
shoppingList1.isEmpty
// 使用append 在数组后面添加新的数据项
shoppingList1.append("iPod")
// 使用加法赋值运算符(+=)也可以在数组后面添加一个或多个拥有相同类型的数据项
shoppingList2 += ["iPod", "AppleCare"]
// 使用下标语法来获取数组中的数据项
var iPhone = shoppingList1[0]
// 可以用下标来改变某个已有索引值对应的数据值
shoppingList3[3] = "AppleCare"
// 使用下标来改变一系列数据值(新数据的数量可以少于原有数据)
print(shoppingList2)
shoppingList2[2...3] = ["AppleWatch"]
print(shoppingList2)
// 使用insert(_,atIndex:)方法来在某个具体索引值之前添加数据项
shoppingList2.insert("iPad", atIndex: 2)
// 使用removeAtIndex方法一出数组中的某一项 -- 方法返回被移除项
shoppingList2.count
let removedPro = shoppingList2.removeAtIndex(2) // 移除并返回iPad
shoppingList2.count

//: 数组的遍历
// 我们可以使用for-in 循环来遍历所有数组中的数据项
for item in shoppingList2 {
    print(item)
}
// 使用enumerate()方法进行数组遍历, 来返回一个由每一个数据项索引和数据值组成的元组
for (index, value) in shoppingList2.enumerate() {
    print(index, value)
}

//: Set(集合)
// 集合用来存储相同类型并且没有确定顺序的值. 集合的元素不可重复
// Set<SomeType>
/*
集合类型的哈希值:
一个类型为了存储在集合中, 该类型必须是可哈希化的
Swift 的所有基本类型(比如String, Int, Double 和Bool)默认都是可哈希化的. 没有关联值的枚举成员值默认也是可哈希化的
*/

//: 创建和构造一个空的集合
// 通过构造器, letters 变量的类型被推断为Set<Character>
var letters = Set<Character>()
// 通过一个空的数组字面量创建一个空Set
letters.insert("a")
letters = []

//: 用数组字面量创建集合
var favoriteGenres1: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]

//: 访问和修改一个集合
// 使用只读属性count 来获取Set 中元素的数量
favoriteGenres1.count
// 使用布尔属性isEmpty 来检测Set 是否为空
favoriteGenres1.isEmpty
// 调用Set 的insert 方法来添加一个新元素
favoriteGenres1.insert("Popular")
// 使用remove删除一个元素, 如果Set 中包含该元素则删除后返回被删除的元素, 如果Set 中不包含则返回nil
favoriteGenres1.remove("Popular")
// 使用contains方法来检测Set 中是否含有某个值
favoriteGenres1.contains("Rock")

//: 遍历一个集合
for genre in favoriteGenres1 {
    print(genre)
}
// Swift 的Set 类型没有确定的顺序, 为了按照特定顺序来遍历一个Set 中的值可以使用sort()方法
for genre in favoriteGenres1.sort() {
    print(genre)
}

//: 基本集合操作
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [2, 4, 5, 8, 9]
// 交集
setA.intersect(setB).sort()
// 差集 -- 存在于setA 或者setB 中但不被setA 和setB 共同含有的值
setA.exclusiveOr(setB).sort()
// 并集
setA.union(setB).sort()
// 补集 -- setA 中不存在于setB 中的值
setA.subtract(setB).sort()

//: 集合成员关系和相等
// 是否相等
setA == setB
// 是否是子集
setA.isSubsetOf(setB)
// 是否是父集
setA.isDisjointWith(setB)
// 是否没有相同值
setA.isDisjointWith(setB)

//: 字典
// 字典是一种存储多个相同类型的值的容器. 每个值(value)都关联唯一的键(key). 字典中的数据项没有具体顺序

//: 字典类型的快捷语法
// Swift 的字典使用Dictionary<Key, Value> 定义, 其中Key 是字典中键的数据类型, Value 是字典中对应于这些键所存储的值的数据类型. 我们也可以用[Key: Value]这样快捷的形式去创建一个字典类型
// 注意: 一个字典的Key 类型必须遵循Hashable 协议

//: 创建一个空字典
var namesOfIntegers1 = Dictionary<Int, String>()
var namesOfIntegers2 = [Int: String]()
var namesOfIntegers3: [Int: String] = [:] // 使用空字典字面量来创建一个空字典

//: 用字典字面量创建字典
var airports1: Dictionary<String, String> = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//: 访问和修改字典
// 通过字典的只读属性count 来获取某个字典的数据项数量
airports1.count
// 使用布尔属性isEmpty 检查字典是否为空
airports1.isEmpty
// 使用下标语法来添加新的数据项
airports1["LHR"] = "London" // airports1 字典现在有三个数据项
// 使用下标语法来改变特定键对应的值
airports1["LHR"] = "London Heathrow"
// updateValue( _,forKey:_)方法可以设置或者更新特定键对应的值, 并且返回对应值类型的可选值. 在这个键不存在对应值的时候, 会设置新值返回nil. 在存在时则更新现有值, 返回之前的原值
let oldValue = airports1.updateValue("Dublin Airport", forKey: "DUB")
// 使用下标语法来通过给某个键对应的值赋值为nil 来从字典中移除一个键值对
airports1["LHR"] = nil // key 为"LHR"的键值对被移除
// removeValueForKey()方法在键值对存在的情况下会移除该键值对并返回被移除的值或者在没有值的情况下返回nil
let removedValue = airports1.removeValueForKey("DUB")

//: 字典遍历
// 我们可以使用for-in 循环来遍历某个字典中的键值对. 每一个字典中的数据项都以(key, value)元组形式返回
airports1
for (airportsCode, airportsName) in airports2 {
    print(airportsCode, airportsName)
}
// 通过keys 或者values 属性, 我们也可以遍历字典的键或值
for airportCode in airports2.keys {
    print(airportCode)
}
for airportName in airports2.values {
    print(airportName)
}
// 如果我们只是需要使用某个字典的键集合或者值集合来作为某个接受Array 实例API 的参数, 可以直接使用keys 或者values 属性构造一个新数组
let airportCodes = Array<String>(airports2.keys)
let airportNames = [String](airports2.values)

//: 注意: Swift 的字典类型是无序集合类型. 为了以特定的顺序遍历字典的键或值. 可以对字典的keys 或values 属性使用sort()方法

