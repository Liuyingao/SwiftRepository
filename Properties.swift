struct FixedLengthRange {
	var firstValue: Int
	let length : Int
}
// var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// rangeOfThreeItems.firstValue = 6
// rangeOfThreeItems.length = 6
let rangeOfFourItems = FixedLengthRange(firstValue: 1, length: 4)
// rangeOfFourItems.firstValue = 6

//延时属性
struct LazeProperty{
	lazy var data = FixedLengthRange(firstValue: 1, length: 2)
	var valueCount : Int

	init(valueCount: Int){
		self.valueCount = valueCount
	}
}

var demo = LazeProperty(valueCount : 1)
print(demo)
print(demo.data)

//计算属性
struct Rect{
	var width : Double
	var length : Double
	var square : Double{
		get{
			return width * length
		}

		set{
			width = newValue / length
			length = newValue / width
		}
	}
}

var newRect = Rect(width: 2.0, length: 4.0)
print(newRect.width)
print(newRect.length)
print(newRect.square)
newRect.square = 10
print(newRect.width)
print(newRect.length)
print(newRect.square)

//属性观察器
class ObserverFather{
	var property1 = 0{
		willSet {
			print("Father property1's willset: newValue:\(newValue), oldValue: \(property1)")
		}

		didSet {
			print("Father property1's didSet: newValue:\(property1), oldValue: \(oldValue)")
		}
	}

	var property2 : Int{
		return property1 * 2
	}

	var property3 : Int{
		get {
			return property1 + property2
		}
		set {
			property1 = newValue - 1
		}
	}
}
var obs = ObserverFather()
obs.property1 = 3
print(obs.property2)
print("----------------------------")

//可以为除了延迟存储属性之外的其他存储属性添加属性观察器，
//也可以通过重写属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。
class ObserverSon: ObserverFather{
	override var property1: Int {
		willSet {
			print("Son property1's willset: newValue:\(newValue), oldValue: \(property1)")
		}

		didSet {
			print("Son property1's didset: newValue:\(property1), oldValue: \(oldValue)")
		}
	}

	override var property2 : Int{
		get {
			return property1 * 4
		}
		set {
			property1 = newValue / 4
		}
	}

	override var property3: Int{
		willSet {
			print("Son property3's willset: newValue:\(newValue), oldValue: \(property3)")
		}

		didSet {
			print("Son property3's didset: newValue:\(property3), oldValue: \(oldValue)")
		}
	}
}
var obs1 = ObserverSon()
// obs1.property2 = 8
obs1.property3 = 100

//类属性
//static则可以用在所有地方
//class只能用在类的计算属性上
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var count = 0

    class var computedTypeProperty: Int {
        return count++
    }
    static var overrideableComputedTypeProperty: Int {
        return 107
    }
}
print(SomeClass.computedTypeProperty)
print(SomeClass.computedTypeProperty)
print(SomeClass.computedTypeProperty)
print(SomeClass.computedTypeProperty)
print(SomeClass.count)
