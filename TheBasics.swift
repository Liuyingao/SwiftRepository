// 变量
var x = 0.0, y = 0.0, z = 0.0
var friendlyWelcome = "Leo"
print("The current value of friendlyWelcome is \(friendlyWelcome)")

//常量
let minValue = Int.min
let maxValue = Int.max
print("The max value of Int8 is \(maxValue), the min value of Int8 is \(minValue)");

//小数
// Double最多精确15位（整数和小数总和，不包括小数点和正负号，即无论正负，都只能精确显示15个数字，整数如果多了，小数就少了，最后一位四舍五入）
//Float最多精确6位（整数和小数总和，不包括小数点和正负号，即无论正负，都只能精确显示6个数字，整数如果多了，小数就少了，最后一位四舍五入）
let doubleValue : Double = -1234.12345678901234567890	//-1234.12
let floatValue : Float = -1234.12345678901234567890		//-1234.12345678901
let doubleValue1 : Double = 1234.12345678901234567890	//1234.12
let floatValue1 : Float = 1234.12345678901234567890		//1234.12345678901
print("float  number: \(floatValue1)")
print("double number: \(doubleValue1)")

//整型
//2进制、8进制、16进制
let decimalInterger = 17
let binaryInterger = 0b10001
let octalInterger = 0o21
let hexadecimalInterger = 0x11
print(decimalInterger)
print(binaryInterger)
print(octalInterger)
print(hexadecimalInterger)
//科学技术法\增强可读性数字写法
let scienceInterger : Double = 1e2
let easyToReadInterger = 100_000_000//100,000,000
print(scienceInterger)
print(easyToReadInterger)

//超范围			
// let overLimitInt8 : Int16 = Int8.max + 1			//因为数据类型不同，所以报错
//let overLimitInt8 : Int16 = Int16(Int8.max + 1)	//这个是错误的，括号内的Int8.max + 1 已经越界
let overLimitInt8 : Int16 = Int16(Int8.max) + 1
print(overLimitInt8)

//Int->Double、Double->Int:小数->整数 小数位会被截断，而不是四舍五入
let doubleVlaue1 = 3.5415
let intValue1 = 5
// var Value: Int = Int(doubleVlaue1)	//3
var Value: Double = Double(intValue1)	//5.0
print(Value)

//类型别名
typealias RadioSample = UInt16
let radioSample = RadioSample.max
print(radioSample)

//布尔值
let boolValue = true
if boolValue {
	print("TRUE")
} else {
	print("FALSE")
}

let i = 1
if i == 1 {
	print("TRUE")
}

//TUPLES
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status of code is \(statusCode)")
print("The status of message is \(statusMessage)")

let (stautsCode1, _) = http404Error
print("The status of code1 is \(stautsCode1)")
print("The status of message1 is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status of code is \(http200Status.statusCode)")
print("The status of description is \(http200Status.description)")

let http401Status: (Int?, String?, Double?)? = (401, "Warning", 3.14)//nil
let temp: Int? = http401Status?.0
if let int = temp {
	print(int)
}
print((http401Status?.1))
print(http401Status?.2)


func canThrowAnError() throws{
	print("can throw an error")
}

try canThrowAnError()


//Assert
let assertInt = 5
assert(assertInt > 0, "assertInt should bigger than 0")
print("Everything is OK")
