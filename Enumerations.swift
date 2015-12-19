//枚举-自己就是一个类型
enum CompassPoint{
	case North
	case South
	case East
	case West
}
print(CompassPoint.North)

enum Planet{
	case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
print(Planet.Earth)
var planetValue = Planet.Mars
planetValue = .Saturn

var directionToHead = CompassPoint.East
switch directionToHead {
case CompassPoint.North:
	print("Lots of planets have a north")
case CompassPoint.South:
	print("Watch out for penguins")
case CompassPoint.East:
	print("Where the sun rises")
case .West:
	print("Where the skies are blue")
}

//关联值（Associated Values）
enum BarCode{
	case UPCA(Int, Int, Int, Int)
	case QRCode(String)
}

var productBarCode = BarCode.UPCA(8, 85909, 51226, 3)
// productBarCode = .QRCode("ABCDEFGHIJKLMNOP")
switch productBarCode{
	case .UPCA(let numberSystem, let manufacturer, let product, let check):
		print("\(numberSystem)-\(manufacturer)-\(product)-\(check)")
	case .QRCode(let productCode):
		print("\(productCode)")
}

//原始值（Raw Values）
//原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值，像上述三个 ASCII 码。
//对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。
enum ABC: String {
	case A = "a"
	case B //= "b"
	case C //= "c"
}
//当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称。
var abc = ABC.B.rawValue
print(abc)

//使用原始值初始化枚举实例（Initializing from a Raw Value）
var b = ABC(rawValue: "a")
print(b)

//递归枚举（recursive enumeration）
indirect enum A{
	case number(Int)
	case B(A)
}
