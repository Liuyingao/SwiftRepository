class Vehicle{
	var currentSpeed = 1.0
	var description : String{
		return "traveling at \(currentSpeed) miles per hour"
	}

	func makeNoise(){
	}
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

class Bicycle : Vehicle{
	var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.8
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

class Train : Vehicle{
	override func makeNoise(){
		print("Choo Choo")
	}
}
let train = Train()
train.makeNoise()

//你可以提供定制的 getter（或 setter）来重写任意继承来的属性，
//无论继承来的属性是存储型的还是计算型的属性。子类并不知道继承来的属性是存储型的还是计算型的，
//它只知道继承来的属性会有一个名字和类型。你在重写一个属性时，必需将它的名字和类型都写出来。
//这样才能使编译器去检查你重写的属性是与超类中同名同类型的属性相匹配的。
class Car : Vehicle{
	var gear = 1.0

	override var currentSpeed : Double{
		get {
			return gear * 25.0
		}

		set {
			self.gear = newValue / 25
		}
	}

	override var description : String{
		return super.description + " in gear \(gear)"
	}
}
let car = Car()
car.currentSpeed = 50.0
car.gear = 3
print("Car: \(car.description)")


//重新属性观察器-计算属性或者存储属性在子类中可以随心所欲的变换
class AutoCar : Car {
	final override var currentSpeed : Double{
		willSet {
			print("AutoCar'S willSet is calling: \(newValue)")
			print("Call super class's currentSpeed: \(super.currentSpeed)")
		}
	}
}
var autoCar = AutoCar()
autoCar.gear = 5
autoCar.currentSpeed = 0.0


//final的问题，爷爷、爸爸和儿子。爷爷有个属性，爸爸继承过来了以后 ，可以改成final的，然后儿子就不可以重写了
//上面的例子中，在Car的currentSpeed属性前面加final后会报错,因为儿子不可以重写他
