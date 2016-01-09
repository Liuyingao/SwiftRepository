//: Playground - noun: a place where people can play

import UIKit

//构造过程是使用类、结构体或枚举类型的实例之前的准备过程。在新实例可用前必须执行这个过程，具体操作包括设置实例中每个存储型属性的初始值和执行其他必
//须的设置或初始化工作。


//当你为存储型属性设置默认值或者在构造器中为其赋值时，它们的值是被直接设置的，不会触发任何属性观察者

struct Fahrenheit{
    var temperature: Double
    
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)")

//如果一个属性总是使用相同的初始值，那么为其设置一个默认值比每次都在构造器中赋值要好。
//两种方法的效果是一样的，只不过使用默认值让属性的初始化和声明结合得更紧密。
//使用默认值能让你的构造器更简洁、更清晰，且能通过默认值自动推导出属性的类型
struct Fahrenheit1{
    var temperature = 32.0
}

var f1 = Fahrenheit1()
print("The default temperature is \(f1.temperature)")

//自定义构造过程时，可以在定义中提供构造参数，指定所需值的类型和名字。构造参数的功能和语法跟函数和方法的参数相同
struct Celsius{
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double){
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(boilingPointOfWater.temperatureInCelsius)
print(freezingPointOfWater.temperatureInCelsius)

//跟函数和方法参数相同，构造参数也拥有一个在构造器内部使用的参数名字和一个在调用构造器时使用的外部参数名字。
//然而，构造器并不像函数和方法那样在括号前有一个可辨别的名字。因此在调用构造器时，主要通过构造器中的参数名和类型来确定应该被调用的构造器。
//正因为参数如此重要，如果你在定义构造器时没有提供参数的外部名字，Swift 会为每个构造器的参数自动生成一个跟内部名字相同的外部名。
struct Color{
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double){
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)



//如果你定制的类型包含一个逻辑上允许取值为空的存储型属性——无论是因为它无法在初始化时赋值，
//还是因为它在之后某个时间点可以赋值为空——你都需要将它定义为可选类型optional type。
class SurveyQuestion{
    var text: String
    var response: String?
    
    init(text: String){
        self.text = text
    }
    
    func ask(){
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."
print(cheeseQuestion.response)

//常量属性
class A{
    let a: String
    
    init(a: String){
        self.a = a
    }
}

//逐一成员构造器
//如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器，即使结构体的存储型属性没有默认值。
struct Size{
    var width: Double
    var height: Double
}

let twoByTwo = Size(width: 2.3, height: 4.5)
print(twoByTwo)

class Father{
    var name: String
    var work: String
    
    init(name: String, work: String){
        self.name = name
        self.work = work
    }
    
    convenience init(){
        self.init(name: "qq", work: "work")
    }
}

//规则1:如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器。
//规则2:如果子类提供了所有父类指定构造器的实现——无论是通过规则 1 继承过来的，还是提供了自定义实现——它将自动继承所有父类的便利构造器。
//（即使属性没有默认值，只要实现了父类的所有指定构造器，就会自动继承父类的所有便利构造器）
class Son: Father{
    var school: String
    
    override init(name: String, work: String){
        school = "school"
        super.init(name: "name", work: "work")
        
        self.name = "lalal"
        school = name
    }
}

var s = Son()
print(s.school)


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}


//闭包赋值
struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        print("Function is calling")
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}

let board = Checkerboard()
print(board.squareIsBlackAtRow(0, column: 1))
