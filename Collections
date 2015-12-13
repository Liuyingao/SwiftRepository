//Swift 语言提供Arrays、Sets和Dictionaries三种基本的集合类型用来存储集合数据。
//数组（Arrays）是有序数据的集。
//集合（Sets）是无序无重复数据的集。
//字典（Dictionaries）是无序的键值对的集。

//-----------------------------------------数组-----------------------------------------------------------------
var someInts1 = [Int]()
var someInts2: [Int] = [1, 2, 3, 4]
print("The someInts1's items is \(someInts1.count)")
print("The someInts2's items is \(someInts2.count)")

var someInts3 = [5,6,7,8]
someInts2 = someInts3 + someInts2 + [0] 
print(someInts2)

someInts2 = []
print("The someInts2's items is \(someInts2.count)")

var shopList: Array<String> = ["Milk", "Eggs"]
if shopList.isEmpty {
	print("shopList is empty")
}else {
	print(shopList)
}

shopList.append("Flour")
shopList += ["Cheese"]
print(shopList)
shopList[0..<2] = ["Apples", "Banana", "Orange"]
print(shopList)
shopList.insert("Maple Syrup", atIndex: 1)
print(shopList)
shopList.removeAtIndex(1)
print(shopList)
shopList.removeFirst()
print(shopList)

for item in shopList{
	print(item)
}

for (index, item) in shopList.enumerate(){
	print("The \(index + 1) is \(item)")
}


//-----------------------------------------集合-----------------------------------------------------------------
//Swift 的所有基本类型(比如String,Int,Double和Bool)默认都是可哈希化的，可以作为集合的值的类型或者字典的键的类型。
//没有关联值的枚举成员值(在枚举有讲述)默认也是可哈希化的。
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
print(letters)

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop", "Sing a song", "Drawing", "Sleep", "Reading"]
print(favoriteGenres)
var deleteItem = favoriteGenres.remove("Rock")
if let i = deleteItem {
	print(favoriteGenres)
	print("Delete : \(i)")
}else {
	print("nil")
}

if favoriteGenres.contains("Classical") {
	print("I find it")
}else {
	print("I can't find it")
}

for favoriteGenre in favoriteGenres.sort({
		if $0.characters.count < $1.characters.count {
			return true
		}else{
			return false
		}
	}){
	print(favoriteGenre)
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [2, 4, 6, 8, 0]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

var newDigits = oddDigits.union(singleDigitPrimeNumbers)
print(newDigits.sort())
newDigits =  oddDigits.intersect(singleDigitPrimeNumbers)
print(newDigits.sort())
newDigits =  oddDigits.exclusiveOr(singleDigitPrimeNumbers)
print(newDigits.sort())
newDigits =  oddDigits.subtract(singleDigitPrimeNumbers)
print(newDigits.sort())

let cloneFatherSet: Set = [1,2,3,4,5]
let fatherSet: Set = [1,2,3,4,5]
let fatherBrotherSet: Set = [2,6,7,8,9]
let sonSet: Set = [1]

print(fatherSet.isSupersetOf(sonSet))
print(sonSet.isSubsetOf(fatherSet))
print(sonSet.isDisjointWith(fatherBrotherSet))		//是否不含有相同的值

print(sonSet.isStrictSubsetOf(fatherSet))
print(cloneFatherSet.isSubsetOf(fatherSet))			//相同的set可以互为子集
print(cloneFatherSet.isStrictSubsetOf(fatherSet))	//排除相同的set会为子集的情况

var array1: Array = [1, 2, 3]
var array2: Set = [1, 2, 3]
var array3 = [1, 2, 3]



//-----------------------------------------字典-----------------------------------------------------------------
//字典前的引申--
var tupleArray: Array<(key: Int, value: String)> = [(key : 1, value: "One"), (key : 2, value: "Two")]
print(tupleArray[0].value)
// Set不可以，因为tuple不遵循Hashable协议
// var tupleSet: Set<(key: Int, value: String)> = [(key : 1, value: "One"), (key : 2, value: "Two")]

var nameOfIntegers = [Int : String]()
print(nameOfIntegers)
nameOfIntegers[16] = "sixteen"
print(nameOfIntegers)
nameOfIntegers[1] = "one"
print(nameOfIntegers)

var airport = ["YYZ" : "Toronto Pearson", "DL" : "Dalian Airport", "BJ" : "Beijing Airport"]
print(airport)

var enmtyDictionary = Dictionary<Int, String>()
print(enmtyDictionary)

var abc : Dictionary = ["A" : "a", "B" : "b", "C" : "c"]
print(abc.keys.sort(>))
var abc1 = ["1" : "old", "2" : "22", "3" : "33"]
print(abc1["1"])

if let oldValue = abc1.updateValue("new", forKey : "1") {
	print("The old value is \"\(oldValue)\" and the new value is \"new\"")
}else {
	print("nil")
}

abc1["1222"] = "change"
print(abc1["1222"])

for (key, value) in abc1{
	print("key : \(key), value : \(value)")
}

for key in abc1.keys{
	print("key : \(key)")
}

let arrayFromDictionaryValue = [String](abc1.values)
print(arrayFromDictionaryValue)
