//Int型的subscript
struct TimesTable{
	let multiplier: Int

	subscript(index: Int) -> Int {
		get {
			return multiplier * index
		}
	}
}
var a = TimesTable(multiplier : 5)
print(a[3])
print("-----------------------------------------")

//String型的subscript
struct StringArray{
	var index : Int
	var arrayList : [String]

	init(index : Int){
		self.arrayList = Array(count : index, repeatedValue : "")
		self.index = self.arrayList.count
	}

	func indexIsValidForArray(index : Int) -> Bool {
		return index < self.index && index >= 0
	}

	subscript(index : Int) -> String {
		get {
			assert(indexIsValidForArray(index), "Index out of range")
			return arrayList[index]
		}
		set {
			assert(indexIsValidForArray(index), "Index out of range")
			self.arrayList[index] = newValue
		}
	}
}
var b = StringArray(index: 5)
var count = 0
for i in 0..<b.index{
	b[i] = String(++count)
}
print(b[4])
print("-----------------------------------------")

//Any
struct ObjectArray<T>{
	var arrayList : Array<T> = Array<T>()

	mutating func append(item : T){
		arrayList.append(item)
	}

	mutating func remove(index : Int){
		arrayList.removeAtIndex(index)
	}

	subscript(index : Int) -> T {
		get {
			return arrayList[index]
		}
		set {
			arrayList[index] = newValue
		}
	}
}
var c = ObjectArray<String>()
c.append("123")
c.append("456")
c.append("789")
print(c[0])
print(c[1])
print(c[2])
c.remove(1)
print(c.arrayList)
c[1] = "ERRR"
print(c.arrayList)
