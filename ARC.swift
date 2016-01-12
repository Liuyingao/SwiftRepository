//: Playground - noun: a place where people can play

import UIKit

//在被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用。
//弱引用总是可选类型，并且当引用的实例被销毁后，弱引用的值会自动置为nil。
//Person和Apartment的例子展示了两个属性的值都允许为nil，并会潜在的产生循环强引用。
//这种场景最适合用弱引用来解决。
class Person{
    var name: String
    var apartment: Apartment?
    
    init(name: String){
        self.name = name
    }
    
    deinit{
        print("\(self.name) is being deinitialized")
    }
}
class Apartment{
    var unit: String
    weak var tenant: Person?
    
    init(unit: String){
        self.unit = unit
    }
    
    deinit{
        print("\(self.unit) is being deinitialized")
    }
}
var john: Person? = Person(name: "John")
var unit4A: Apartment? = Apartment(unit: "4A")
john!.apartment = unit4A
unit4A!.tenant = john
john = nil
print("\(unit4A?.tenant) is living in")
unit4A = nil
print("-----------------------------------------")



//和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用是永远有值的。
//因此，无主引用总是被定义为非可选类型（non-optional type）。
//还需要注意的是如果你试图访问实例已经被销毁的无主引用
//Swift 确保程序会直接崩溃，而不会发生无法预期的行为。
//Customer和CreditCard的例子展示了一个属性的值允许为nil，
//而另一个属性的值不允许为nil，这也可能会产生循环强引用。
//这种场景最适合通过无主引用来解决。
class Customer{
    var name: String
    var card: Card?
    
    init(name: String){
        self.name = name
    }
    
    deinit{
        print("\(self.name) is being deinitialized")
    }
}
class Card{
    var number: Int
    unowned var customer: Customer
    
    init(number: Int, customer: Customer){
        self.number = number
        self.customer = customer
    }
    
    deinit{
        print("\(self.number) is being deinitialized")
    }
}
var leo: Customer? = Customer(name: "Leo")
var card: Card? = Card(number: 99887766, customer: leo!)
leo?.card = card
leo = nil
//print("Customer's name is \(card?.customer.name)")
card = nil
print("-----------------------------------------")


//两个属性都必须有值，并且初始化完成后永远不会为nil。
//在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解析可选属性。
class Country{
    let name: String
    var captialCity: City!
    
    init(name: String, city: String){
        self.name = name
        self.captialCity = City(name: city, country: self)
    }
    
    deinit{
        print("\(self.name) is being deinitialized")
    }
    
}
class City{
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country){
        self.name = name
        self.country = country
    }
    
    deinit{
        print("\(self.name) is being deinitialized")
    }
}

var china: Country? = Country(name: "China", city: "Beijing")
print(china?.captialCity?.name)
china = nil
print("-----------------------------------------")

//在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用。
//相反的，在被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用。
//弱引用总是可选类型，并且当引用的实例被销毁后，弱引用的值会自动置为nil。
//这使我们可以在闭包体内检查它们是否存在。
class HTMLElement{
    var name: String
    var text: String?
    lazy var asHTML: Void -> String = {
        [unowned self] in
        if let i = self.text{
            return "<\(self.name)>\(i)</\(self.name)>"
        }else{
            return "<\(self.name)></\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil){
        self.name = name
        self.text = text
    }
    
    deinit{
        print("\(self.name) is being deinitialized")
    }
}
var p: HTMLElement? = HTMLElement(name: "P", text: "Hello")
print(p!.asHTML())
p = nil

