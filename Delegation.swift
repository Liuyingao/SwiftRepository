//反向代理传值
protocol ModifyCountDelegate {
	func modifyCount(count: Int)
}

class Page1 : ModifyCountDelegate {
	var count = 0
	
	func modifyCount(count : Int){
		self.count = count
		print("Page1's count is \(self.count)")
	}

	func printCount(){
		print("Func print count \(count)")
	}
}

class Page2 {
	var delegate : ModifyCountDelegate? = nil

	func modifyPage1Count(count : Int){
		if let i = delegate {
			i.modifyCount(count)
		}
	}
}

var p1 = Page1()
var p2 = Page2()
p1.printCount()
p2.delegate = p1
p2.modifyPage1Count(8)
print("---------------------------------------------")

//代理模式
class Page3 : ModifyCountDelegate {
	var count = 0
	
	func modifyCount(count : Int){
		self.count = count
		print("Page3's count is \(self.count)")
	}

	func printCount(){
		print("Func print page3's count \(count)")
	}
}

class Page4 : ModifyCountDelegate {
	var delegate : ModifyCountDelegate = Page3() 

	func modifyCount(count : Int){
		print("[delegate begin]")
		delegate.modifyCount(count)
		print("[delegate end]")
	}
}

var p4 = Page4()
p4.modifyCount(8)
