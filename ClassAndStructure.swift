//与其他编程语言所不同的是，Swift 并不要求你为自定义类和结构去创建独立的接口和实现文件。
//你所要做的是在一个单一文件中定义一个类或者结构体，系统将会自动生成面向其它代码的外部接口。
struct Resolution {
	var width = 0
	var height = 0
}

class VideoMode{
	var resolution = Resolution()
	var interlaced = false
	var frameRate = 0.0
	var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
let vga = Resolution(width: 600, height : 800)

//结构体是值类型
var cinema = vga
cinema.width = 1440
print("The vga's width is \(vga.width), the cinema's width is \(cinema.width)")

//类是引用类型
var tenEighty = VideoMode()
tenEighty.resolution = cinema
tenEighty.interlaced = true
tenEighty.frameRate = 25.0
tenEighty.name = "1080i"

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 35.0
print("tenEighty's frameRate is \(tenEighty.frameRate), alsoTenEighty's frameRate is \(alsoTenEighty.frameRate)")

//恒等
//“等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
//“等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
var tenEightyCopy = VideoMode()
tenEightyCopy.resolution = cinema
tenEightyCopy.interlaced = true
tenEightyCopy.frameRate = 35.0
tenEightyCopy.name = "1080i"

if tenEighty === alsoTenEighty{
	print("alsoTenEighty == tenEighty")
}else{
	print("alsoTenEighty !== tenEighty")
}

if tenEighty === tenEightyCopy{
	print("tenEightyCopy == tenEighty")
}else{
	print("tenEightyCopy !== tenEighty")
}

//按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
//	该数据结构的主要目的是用来封装少量相关简单数据值。
//	有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
//	该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
//	该数据结构不需要去继承另一个既有类型的属性或者行为。
var a = 22.7
tenEighty.frameRate = a
a = 33.7
print("tenEighty.frameRate: \(tenEighty.frameRate), a : \(a)")

//在你的代码中，拷贝行为看起来似乎总会发生。
//然而，Swift 在幕后只在绝对必要时才执行实际的拷贝。
//Swift 管理所有的值拷贝以确保性能最优化，所以你没必要去回避赋值来保证性能最优化。
