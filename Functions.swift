//一个输入参数，一个输出参数
func sayHello(personName: String) -> String{
	let greeting = "Hello, " + personName + "!"
	return greeting
}

print(sayHello("Anna"))
print(sayHello("Leo"))

func sayHelloAgain(personName: String) -> String{
	let greeting = "Hello again, " + personName + "!"
	return greeting
}


//两个输入参数，一个输出参数
func sayHello(personName: String, alreadyGreeted: Bool) -> String{
	if alreadyGreeted {
		return sayHelloAgain(personName)
	}else{
		return sayHello(personName)
	}
}
//调用时，从第二个参数开始，必须加外部变量名
print(sayHello("Sim", alreadyGreeted: true))


//多个输出参数
func minMax(array: [Int]) -> (min: Int, max: Int)?{
	if array.isEmpty {
		return nil
	}

	var currentMin = array[0]
	var currentMax = array[0]
	for i in array[1 ..< array.count] {
		if i >=  currentMax {
			currentMax = i
		}else if i <= currentMin {
			currentMin = i
		}
	}
	return (currentMin, currentMax)
}

print(minMax([-1,22,3,0,5]))
print(minMax([]))


//一般情况下，第一个参数省略其外部参数名，第二个以及随后的参数使用其局部参数名作为外部参数名。
//所有参数必须有独一无二的局部参数名。尽管多个参数可以有相同的外部参数名，但不同的外部参数名能让你的代码更有可读性。
//如果你提供了外部参数名，那么函数在被调用时，必须使用外部参数名。
func oneFunction(p1: Int, ep2 p2: Int, p3: Int){

}

func otherFunction(externalParameterName localParameterName: Int){

}

oneFunction(3,ep2: 3,p3: 3)
otherFunction(externalParameterName: 3)

//如果你不想为第二个及后续的参数设置外部参数名，用一个下划线（_）代替一个明确的参数名。
//这样在调用时就不需要输入外部变量名，与上面规则不冲突
//因为第一个参数默认忽略其外部参数名称，显式地写下划线是多余的。
func anotherFunction(p1: Int, _ p2: Int, p3: Int){

}
anotherFunction(1, 2, p3: 3)


//你可以在函数体中为每个参数定义默认值（Deafult Values）。当默认值被定义后，调用这个函数时可以忽略这个参数。
func theForthFunction(parameter: Int = 9){
	print(parameter)
}

theForthFunction()
theForthFunction(3)

//将带有默认值的参数放在函数参数列表的最后。
//这样可以保证在函数调用时，非默认参数的顺序是一致的，同时使得相同的函数在不同情况下调用时显得更为清晰。
func theFifthFunction(p1: Int, p2: Int, p3: Int = 1){
	print("p1: \(p1), p2 = \(p2), p3 = \(p3)")
}
theFifthFunction(33, p2: 3)

//可变参数
//一个函数最多只能有一个可变参数。
//如果函数有一个或多个带默认值的参数，而且还有一个可变参数，那么把可变参数放在参数表的最后。
func arithmeticMean(numbers: Double...) -> Double?{
	guard !numbers.isEmpty else{
		return nil
	}

	var sum = 0.0
	for i in numbers{
		sum += i
	}
	return sum / Double(numbers.count)
}
print(arithmeticMean(1.2, 2.2, 4))
print(arithmeticMean())


//输入输出参数（In-Out Parameters）
func swapTwoInts(inout p1: Int, inout _ p2: Int) {
	let temp = p1
	p1 = p2
	p2 = temp
}

var p1 = 3
var p2 = 10
print("p1: \(p1), p2: \(p2)")
swapTwoInts(&p1, &p2)
print("p1: \(p1), p2: \(p2)")


//函数类型
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = multiplyTwoInts
print(mathFunction(1,2))


//可变参数的函数类型作为参数类型
func printMathResult(p1: Int, _ p2: Int, _ mathFunction: (Int, Int) -> Int...){
	for function in mathFunction{
		print(function(p1, p2))
	}
	
}
printMathResult(3, 4, addTwoInts, multiplyTwoInts)
printMathResult(3, 4, addTwoInts)
printMathResult(3, 4)

//函数类型作为返回类型
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int{
	return backwards ? stepForward : stepBackward
}

print(chooseStepFunction(false)(3))

//嵌套函数
var num = 99999999
func chooseStepFunctionNested(backwards: Bool) -> (Int) -> Int{
	var num1 = 88888
	func stepForward(input: Int) -> Int {
		print(++num)
		print(++num1)
    	return input + 1
	}
	func stepBackward(input: Int) -> Int {
		print(++num)
		print(++num1)
    	return input - 1
	}
	print(num1)
	return backwards ? stepForward : stepBackward
}
print(chooseStepFunctionNested(false)(5))
print(num)
