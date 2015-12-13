func reflectInfor(obj : Any)
{
    let objInfo : Mirror = Mirror(reflecting: obj)

    print("-----------------------------------------")
    //基本类型
    if let style = objInfo.displayStyle {
        print("displayStyle : \(style)")
    }else {
        print("displayStyle : nil")
    }

    //对象名称|类名
    print("subjectType : \(objInfo.subjectType)")

    //父类名
    print("superclassMirror : \(objInfo.superclassMirror())")

    //遍历子成员
    print("There are \(objInfo.children.count) property:")
    for case let (key?, value) in objInfo.children {
        print(key, value)
    }

    // dump(objInfo)
    //AnyForwardCollection<(Optional<String>, protocol<>)>(_box: Swift._CollectionBox<Swift.Mirror.LegacyChildren>)
    //print(objInfo.children)
}

//----------------------------------结构体---------------------------------
struct Person {
    var name    :   String
    var age     :   Int = 0
    
    func showMessage(){
        print("name=\(name),age=\(age)")
    }
}

var p = Person(name: "Kenshin", age: 29)
reflectInfor(p)

//---------------------------------Class------------------------------------
class Animal{
    var breed : String

    init(breed : String){
        self.breed = breed
    }
}

class Dog: Animal{
    var name    :   String
    var weight  :   Double

    init(breed: String, name: String, weight: Double){
        self.name = name
        self.weight = weight

        super.init(breed: breed)
    }

    func sound(){
        print("\(name) is bark")
    }
}

var dog = Dog(breed : "Dog", name : "Milk", weight: 20.0)
reflectInfor(dog)

//------------------------------------------Int------------------------------
var intType = 1
reflectInfor(intType)

//-----------------------------------------枚举------------------------------
enum TestRichEnum  
{  
    case Option1 (String)  
    case Option2 (String)  
}  
let opt = TestRichEnum.Option1("text")  
reflectInfor(opt)



