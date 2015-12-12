var i = 1 + 2
print(i)

var b = 10
var a = 5
print("a=\(a), b=\(b)")
b = a
print("a=\(a), b=\(b)")

let (c, d, _) = (1, 4, 0)
print("c=\(c), d=\(d)")

//算数运算符
var e = 10.0
var f = 0.0
let div = e / f
let div1 = 10 / 1
print(div)
print(div1)

var g = 100000000000000000.0
var h = 3.0
var div2 = g / h
print(div2)

//求余
var mod = 10.2 % -2.2
print(mod)

//正负号
var p = 3
var q = 2
print("p=\(p), q=\(q)")

//比较表达式
print(p > q ? p : q)

//空合运算符
//表达式a必须是Optional类型,默认值b的类型必须要和a存储值的类型保持一致
var color: String? = "red"
var defaultColor = "white"
print(color ?? defaultColor)

for index in 1..<5
{
	print(index)
}

//与或非
let true1 = true
let false1 = false
if !false1 {
	print("True")
}

if !(true1 && false1){
	print("True")
}

if true1 || false1 {
	print("True")
}

func pri(str: String, bool: Bool) -> Bool{
	print(str)
	return bool
}

//或的判断关系，从左向右，遇到第一个true结束，不运行后面判断
if pri("0", bool: false) || pri("1", bool: true) || pri("2", bool: true){

}

//与的判断关系，从左向右，遇到第一个fasle结束，不运行后面判断
if pri("10", bool: true) && pri("11", bool: false) && pri("12", bool: true){

}

//与或并存,其实还是从左向右依次计算,直到肯定运算逻辑结果后，省略后续逻辑判断
if pri("A", bool: true) && pri("B", bool: false) || pri("C", bool: true) || pri("D", bool: true){
	print("The result is True")
}else {
	print("The result is False")
}

//运算优先级：
//逻辑运算符从左向右依次执行
if !pri("10", bool: true) && pri("11", bool: false) && pri("12", bool: true){

}
//逻辑运算符和算是运算符，也是从左向右依次执行
if !false && 3 + 4 > 1{
	print("3 + 4 > 1")
}
