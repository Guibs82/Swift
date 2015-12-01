//: Guibs

import UIKit

//: 字符串和字符
// Swift 的String 类型与Foundation NSString 类进行了无缝桥接

//: 字符串字面量
// 字符串字面量是由双引号("")包裹的具有固定顺序的文本字符集. 可以用于为常量和变量提供初始值
let someString = "Some string literal value"
// someString 常量通过字符串字面量进行初始化, swift 会推断该常量为String 类型

//: 初始化空字符串
let emptyString = ""    // 空字符串字面量
let anotherEmptyString = String()   // 初始化方法
// 两个字符串均为空并等价
// 可以用.isEmpty 来判断字符串是否为空
emptyString.isEmpty
anotherEmptyString.isEmpty

//: 字符串可变性
// 你可以通过将一个特定字符串分配给一个变量来对其进行修改, 或者分配给一个常量来保证其不会被修改
var variableString = "Horse"
variableString += "and carriage"
// variableString 现在被改为"Horse and carriage"
let constantString = "Highlander"
// constantString += " and another Highlander" // 会报编译错误
// Ps: 在Objective-C 中, 你需要通过NSString 和NSMutableString 来指定字符串是否可以被修改

//: 字符串是值类型
// Swift 的String 类型是值类型. 如果你创建了一个心的字符串, 当它进行常量或变量赋值操作, 或者传递给一个函数/方法时, 会进行值拷贝.
// Cocoa 中的NSString 则是传递该NSString 实例的一个引用

//: 使用字符
// Swift 的String 类型表示特定序列的Character 类型值的集合. 每一个字符值代表一个Unicode 字符. 你可以通过for-in 循环来遍历字符串中的character 属性来获取每一个字符的值
for character in "Dog!?".characters {
    print(character)
}
// 可以通过标明一个Character 类型并用字符字面量进行赋值, 可以创建一个独立的字符常量或变量
let dollar: Character = "$"
print(dollar)
// 字符串可以通过传递一个值类型为Character 的数组来作为自变量来初始化
let catCharacter: [Character] = ["C", "a", "t", "!", "?"]
let catString = String(catCharacter)

//: 连接字符串和字符
// 字符串可以通过加法运算符(+)相加(连接)在一起, 创建一个新的字符串
let string1 = "hello"
let string2 = " three"
var welcome = string1 + string2
// 可以通过加法赋值运算符(+=)将一个字符串添加到一个已存在的字符串变量上
var instruction = "look over"
instruction += string2
// 可以用append()方法将一个字符附加到一个字符串变量的尾部
let exclamationMark: Character = "!"
welcome.append(exclamationMark)

//: 字符串插值
// 字符串插值是一种构建新字符串的方式, 可以包含常量、变量、字面量和表达式. 但是不能包含非转义双引号(")和反斜杠(\), 也不能包含回车和换行符
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//: Unicode
let wiseWords = "\"Imagination is more important than knowledge\" - English"
let dollaarSign = "\u{24}"
let blackHeart = "\u{2665}"
let speaklingHeart = "\u{1F496}"
// 可扩展的字形群集
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

//: 计算字符数量
// 使用字符串的characters 属性的count 属性来获得一个字符串中的Character 值的数量
let unusualMenagerie = "Koala?, Sbauk?, Penguin?, Dromedary?"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

//: 访问与修改字符串
// 每一个String 值都有一个关联的索引(index)类型, String.index, 它对应着字符串中的每一个Character 的位置
// 由于不同的字符可能会占用不同数量的内存空间, 所以要知道Character 的确定位置, 就必须从String 开头遍历每一个Unicode标量直到结尾. 因此Swift的字符串不能用整数(integer)做索引
// 1. 字符串索引
let strs = "Hello, Guibs."
strs.startIndex // strs 的第一个索引
strs.endIndex   // strs 的最后一个索引
// 2. 通过下标获取字符
let a1 = strs[strs.startIndex]  // 第一个下标的字符 H
let a2 = strs[strs.startIndex.successor()]  // 第一个下标的下一个下标 e
let a3 = strs[strs.endIndex.predecessor()]  // 最后一个下标的前一个下标 .
let index = strs.startIndex.advancedBy(1)   // 创建strs 的索引类型下标
strs[index]

// 3. 遍历字符串下标的值
for index in strs.characters.indices {
    print(index)
}
// 4. 插入字符
var strHello = "Guibs"
strHello.insert("!", atIndex: strHello.endIndex) // 在语句最尾部分插入字符
// 5. 插入字符串
strHello.insertContentsOf("Fighting ".characters, at: strHello.startIndex)
// 6. 删除指定索引处字符(成功就返回删除了的字符)
strHello.removeAtIndex(strHello.startIndex.advancedBy(14)) // !
// 7. 删除指定索引处字符串
let range = strHello.endIndex.advancedBy(-2)..<strHello.endIndex
strHello.removeRange(range)

//: 比较字符串
// 字符串相等 -- 如果两个字符串以同一顺序包含完全相同的字符, 则认为两个字符串相等
var a = "Guibs"
var b = "Jobs"
var c = "Guibs"
if a == b {
    print("a和b相等")
} else if a == c {
    print("a和c相等")
} else {
    print("a即不等于b也不等于c")
}
// 前缀/后缀相等
let names = ["Guibs", "GhostG", "Rio_G", "Jobs"]
for name in names {
    if name.hasPrefix("G") {
        print("\(name) hasPrefix G")    // 前缀为G
    }
    if name.hasSuffix("s") {
        print("\(name) hasSuffix s")    // 后缀为s
    }
}
