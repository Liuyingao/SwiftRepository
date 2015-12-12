//空字符串创建
let str: String = String()
if str == "" {
	print("str is empty")	
}

if str.isEmpty {
	print("str is empty")	
}

if str == " " {
	print("str is empty")	
}else {
	print("str is not empty")	//该条被显示
}

//字符串可变性
var str1 = "String1"
str1 = str1 + " String2"
print(str1)
str1 += " String3"
print(str1)

//字符串遍历
for char in "str1".characters{
	print(char)
}

//字符,不能使用单引号
var chars: [Character] = ["C", "h", "a", "r"]
print(String(chars))
var char: Character = "A"
print(char)

//字符串和字符链接,不能直接用+，因为类型不相同
//wrong： var concatenate1 = str1 + char
str1.append(char)
print(str1)

//字符串插值
let multiplier = 3
print("\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)")

//unicode
print("你好\nLeo\\\t\"hahah\'")
print("\u{6C49}")
let unicodeValue: Character = "\u{E9}\u{20DD}"
print(unicodeValue)

//字符串长度
print("The length of str1 is \(str1.characters.count)")

//字符串索引
let greeting = "Guten Tag!"
print(greeting.characters.count)
print(greeting[greeting.startIndex])
print(greeting[greeting.endIndex.predecessor().predecessor()])
print(greeting[greeting.startIndex.advancedBy(2)])

//字符串插入和删除
var welcome = "Hello"
welcome.insert("!", atIndex: welcome.endIndex)
print(welcome)
welcome.insertContentsOf(" there".characters , at: welcome.endIndex.predecessor())
print(welcome)

welcome.removeAtIndex(welcome.startIndex.advancedBy(1))
print(welcome)

//返回1，但是数据类型不是Int,是Index类型
print(welcome.startIndex.successor())

let range = welcome.startIndex...welcome.startIndex.advancedBy(2)
welcome.removeRange(range)
print(welcome)

//前缀/后缀相等 
// let romeoAndJuliet = [
//     "Act 1 Scene 1: Verona, A public place",
//     "Act 1 Scene 2: Capulet's mansion",
//     "Act 1 Scene 3: A room in Capulet's mansion",
//     "Act 1 Scene 4: A street outside Capulet's mansion",
//     "Act 1 Scene 5: The Great Hall in Capulet's mansion",
//     "Act 2 Scene 1: Outside Capulet's mansion",
//     "Act 2 Scene 2: Capulet's orchard",
//     "Act 2 Scene 3: Outside Friar Lawrence's cell",
//     "Act 2 Scene 4: A street in Verona",
//     "Act 2 Scene 5: Capulet's mansion",
//     "Act 2 Scene 6: Friar Lawrence's cell"
// ]
// var act1SceneCount = 0
// for scene in romeoAndJuliet {
//     if scene.hasPrefix("Act 1 ") {
//         ++act1SceneCount
//     }
// }
// print("There are \(act1SceneCount) scenes in Act 1")

