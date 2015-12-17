//闭包是自包含的函数代码块，可以在代码中被传递和使用。
//闭包采取如下三种形式之一：
//1全局函数是一个有名字但不会捕获任何值的闭包
//2嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
//3闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包

let names = ["Chris", "Alex", "Ewa", "Berry", "Barry", "Daniella"]

//返回true表示S1在S2前面，返回false表示S1在S2后面
func backWards(s1: String, s2: String) -> Bool{
	return s1 < s2
}
print(names.sort(backWards))

//使用闭包
var reserve = {(s1: String, s2: String) -> Bool in
	return s1 > s2
}
print(names.sort(reserve))

//简化1
print(names.sort({
	(s1: String, s2: String) -> Bool in
	return s1.characters.count < s2.characters.count
	}))

//简化2
let numbers = [1,4,2,7,99,0,43]
print(numbers.sort({
	s1, s2 in 
	return s1 < s2
	})) 

//简化3
print(numbers.sort({
	s1, s2 in s1 > s2
	}))

//简化3
print(numbers.sort({$0 > $1}))

//简化4
print(numbers.sort(>))

//尾随闭包
var reserve1 = names.sort(){
	if $0.characters.count < $1.characters.count {
		return true
	}else if $0.characters.count > $1.characters.count {
		return false
	}else{
		return $0 < $1
	}
}
print(reserve1)

//简化尾随闭包
var reserve2 = names.sort{
	if $0.characters.count > $1.characters.count {
		return true
	}else if $0.characters.count < $1.characters.count {
		return false
	}else{
		return $0 < $1
	}
}
print(reserve2)

//
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers1: [Int] = [0, 2, 55, 23]

var reserve3 = numbers1.map{
	var result = ""
	for i in String($0).characters{
		result = result + digitNames[Int(String(i))!]!
	}
	print(result)
}

//捕获值+闭包是引用类型+函数类型可选值
func makeAFunc(amount: Int) -> (() -> Int)?{
	var totle = 0

	func increase() -> Int{
		totle += amount
		return totle
	}

	return increase
}

//N1引用了闭包increase，而increase又引用了makeAFunc的totle，因此totle会被一直持有，美调用一次就被累加，而不会释放
var n1 = makeAFunc(10)
print(n1!())
print(n1!())
print(n1!())
//N2指向N1，其实是同一个对象，所以还是会继续累加
var n2 = n1
print(n2!())
n2 = nil
n1 = nil
print(n1?())
//N3因为重新调用了makeAFunc，其实是重新创建了另外一个闭包对象，跟N1N2无关，因此另外有一个totle生成
var n3 = makeAFunc(7)
print(n3?())
print(n1?())



//非逃逸闭包
//当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
//external1的参数p是一个闭包，如果加了noescape，就只允许在external1内使用
func external1(@noescape p: (Int) -> Int){
	print(p(99))
}
external1{$0 + 1}

//如果要在external2外面使用p，在加@noescape的情况下会编译报错，表示p不允许在函数external2外被调用
//不加@noescape则函数没有错误  @noescape
var test: [(Int) -> Int] = []
func external2( p: (Int) -> Int){
	test.append(p)
}

external2{$0 + 1}
print(test[0](5))


//自动闭包（Autoclosures）
//自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。
//这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。
//这种便利语法让你能够用一个普通的表达式来代替显式的闭包，从而省略闭包的花括号。
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func serveCustomer(customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer( { customersInLine.removeAtIndex(0) } )

func serveCustomer1(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer1(customersInLine.removeAtIndex(0))
