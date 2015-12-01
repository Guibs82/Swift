//: Guibs

import UIKit

//: 下标
// 下标可以定义在类、结构体、枚举中, 可以当做是访问集合、列表或序列的快捷方式, 使用下标脚本的索引设置和获取值, 不需要在调用实例的特定的赋值和访问方法
struct Square {
    subscript(radius: Double) -> Double {
        return M_PI * pow(radius, 2)
    }
}

let area = Square()
print(area[10])

//: 下标的用法
var array = [1, 2, 3, 4, 5, 6]
print("The third is \(array[2])")
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
numberOfLegs

//: 下标选项
struct Matrix {
    var rows, columns: Int
    var grid: [Int]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0)
    }
    // 检查索引是否超越数组大小
    func indexIsValid(row: Int, column: Int) -> Bool {
        return (row  >= 0 && row < rows && column >= 0 && column < columns)
    }
    // 用下标方法存储矩阵对应的数组
    subscript(row: Int, column: Int) -> Int {
        get {
            assert(indexIsValid(row, column: column), "数组索引越界")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row, column: column), "数组索引越界")
            grid[(row * columns) + column] = newValue
        }
    }
}
// 创建一个3行3列的矩阵
var matrixDemo = Matrix(rows: 3, columns: 3)
matrixDemo[0, 0] = 1
matrixDemo[0, 1] = 2
matrixDemo[0, 2] = 3
matrixDemo[1, 0] = 4
matrixDemo[1, 1] = 5
matrixDemo[1, 2] = 6
matrixDemo[2, 0] = 7
matrixDemo[2, 1] = 8
matrixDemo[2, 2] = 9
print("矩阵中的项是:")
for item in matrixDemo.grid {
    print("\(item)")
}

