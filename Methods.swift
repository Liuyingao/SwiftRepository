//实例方法
class Counter{
	var count = 0

	func increment(){
		count++
	}	

	//Swift中方法的名称通常用一个介词指向方法的第一个参数，比如：with，for，by等等
	func incrementBy(amount: Int){
		count += amount
	}

	//Swift 默认仅给方法的第一个参数名称一个局部参数名称；默认同时给第二个和后续的参数名称局部参数名称和外部参数名称。
	func incrementBy(amount: Int, numberOfTimes: Int){
		count += amount * numberOfTimes
	}

	func reset(){
		count = 0
	}
}

//有时为方法的第一个参数提供一个外部参数名称是非常有用的，尽管这不是默认的行为。你自己可以为第一个参数添加一个显式的外部名称。
//相反，如果你不想为方法的第二个及后续的参数提供一个外部名称，可以通过使用下划线（_）作为该参数的显式外部名称，这样做将覆盖默认行为。
let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()
counter.increment()
counter.increment()
counter.incrementBy(5, numberOfTimes: 3)
print(counter.count)
counter.reset()

//在实例方法中修改值类型
//结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。但也有例外
struct Point{
	var x = 0.0, y = 0.0
	mutating func modifyByX(deltaX: Double, deltaY: Double){
		x += deltaX
		y += deltaY
	}
}
var point = Point(x : 5, y : 8)
point.modifyByX(3, deltaY: 3)
print("point: (\(point.x), \(point.y))")

//给self赋值
enum TriStateSwitch{
	case Off
	case Low
	case High

	mutating func next(){
		switch self {
		case Off:
			self = .Low
		case Low:
			self = .High
		case High:
			self = .Off
		}
	}
}

var ovenLight = TriStateSwitch.Off
ovenLight.next()
ovenLight.next()
ovenLight.next()
print(ovenLight)

//类方法
//声明结构体和枚举的类型方法，在方法的func关键字之前加上关键字static。类可能会用关键字class来允许子类重写父类的方法实现。
//也就是说使用static的方法是final的，不可以被子类重写，而用class的方法是可以被子类重写的
class SomeClass{
    static var age = 0
	var internalAge = 0

	static func someTypeClass() -> String{
		return "SomeClass"
	}

	class func addAge(amount: Int){
		age += amount
	}

	func addInternalAge(amount: Int){
		internalAge += amount
	}
}
print(SomeClass.someTypeClass())

class SonOfSomeClass: SomeClass{
	override var internalAge : Int{
		willSet {
			print("Will Set of SonOfSomeClass")
		}
	}

	override class func addAge(amount: Int){
		age += amount * 2
	}

	override func addInternalAge(amount: Int){
		internalAge += amount * 2
	}
}

SonOfSomeClass.addAge(5)
print(SonOfSomeClass.age)//10
print(SomeClass.age)	//10

var son = SonOfSomeClass()
son.addInternalAge(11)
print(son.internalAge)
