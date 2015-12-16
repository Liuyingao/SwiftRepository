for var i = 0; i < 10; i++ {
	print(i)
}

for _ in 1...10 {
	print("haha")
}

var i = 0
while i < 10 {
	print(i++)
}

repeat {
	print(i++)
}while i < 20


var temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}


let someCharacter = "a"
switch someCharacter {
case "a"..."c":
	print("ABC")
	fallthrough
case "d"..."f":
	print("DEF")
	fallthrough
case "g", "h":
	print("GH")
default:
	print("Other letter")
}

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
	print("(0, 0) is at the origin")
case (_, 0):
	print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
	print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
	print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
	print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

let anotherPoint = (2, 2)
switch anotherPoint {
case (let i, 0):
	print("on the x-axis with an x value of \(i)")
case (0, let i):
	print("on the y-axis with an x value of \(i)")
case (let i, let j):
	print("somewhere else at (\(i), \(j))")
}

let yetAnotherPoint = (-1, 1)
switch yetAnotherPoint {
case let (x, y) where x == y:
	print("(\(x), \(y)) is on the line x == y")
case (let x, let y) where x == -y:
	print("(\(x), \(y)) is on the line x == -y")
case let(x, y):
	print("(\(x), \(y)) is just some arbitrary point")
}

//continue, break, fallthrough
let helloWorld = "Hello World"
var puzzleOutput = ""
for character in helloWorld.characters{
	switch character {
	case "a", "b", "c", "d":
		continue
	default:
		puzzleOutput.append(character)
	}
}
print(puzzleOutput)

let numberString = "012345678"
var number = ""
for character in numberString.characters{
	switch character {
	case "1", "3", "5", "7":
		print("\(character)")
		continue
	case "2", "4", "6", "8":
		continue
		print("\(character)")
	case "0":
		break
	default:
		print("error")
	}
	break
}

Loop: for var i = 0; i < 5; i++ {
	loop:	for var j = 0; j < 5; j++ {
				print(j)
				if j == 1 {
					continue Loop
				}
				if j == 2 {
					continue loop 
				}
			}
}

func returnGuard(){
	return
}

//guard
var maxNumber = 0
while maxNumber++ < 10{
	print("maxNumber = \(maxNumber)")
	guard maxNumber != 10 else {
		break
	}
}

//版本检查
if #available(iOS 9, OSX 10.10, *) {
    print("在 iOS 使用 iOS 9 的 API, 在 OS X 使用 OS X v10.10 的 API")
} else {
    print("使用先前版本的 iOS 和 OS X 的 API")
}
