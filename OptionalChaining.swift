//: Playground - noun: a place where people can play

import UIKit

class Person{
    var residence: Residence?
}

class Room{
    var name: String
    init(name: String){
        self.name = name
    }
}

class Residence{
    var rooms = [Room]()
    var numberOfRooms: Int{
        return rooms.count
    }
    
    subscript(index: Int) -> Room{
        get{
            return rooms[index]
        }
        
        set{
            rooms[index] = newValue
        }
    }
    
    func printNumberOfRooms(){
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName!
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber!) \(street!)"
        } else {
            return nil
        }
    }
}

var leo = Person()
leo.residence = Residence()
leo.residence?.rooms.append(Room(name: "Bath"))
leo.residence?.rooms.append(Room(name: "Kitchen"))

if let i = leo.residence?.numberOfRooms{
    print("leo's residence has \(i) room(s).")
}else{
    print("Unable to retrieve the number of rooms.")
}

print(leo.residence?[0].name)
print(leo.residence?.rooms[1].name)

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
leo.residence?.address = someAddress
if let i = leo.residence?.address?.street{
    print(i)
}else{
    print("No address")
}
print(leo.residence?.address?.buildingIdentifier())
print(leo.residence?.address?.buildingIdentifier()?.hasPrefix("29"))


var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
print(testScores["Bev"]?[2]++)
print(testScores["Bev"]?[2])


