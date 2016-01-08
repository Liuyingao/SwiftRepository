//: Playground - noun: a place where people can play

import UIKit

class Vehicle{
    var currentSpeed = 0.0
    var description: String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise(){
        print("lalala")
    }
}

let someVehicle = Vehicle()
someVehicle.currentSpeed = 9.8
print("vehicle: \(someVehicle.description)")


class Bicycle : Vehicle{
    var hasBasket = true
}

let someBicycle = Bicycle()
someBicycle.hasBasket = false
someBicycle.currentSpeed = 13
print("Bicycle: \(someBicycle.description)")


class Train: Vehicle{
    var gear = 9
    //存储属性可以重新为计算属性
    override var currentSpeed: Double{
        get{
            return 3
        }
        
        set{
            print("6")
        }
    }
    
    override var description: String{
        return super.description + " in gear \(gear)"
    }
    
    override func makeNoise() {
        super.makeNoise()
        print("Choo Choo")
    }
}
let someTrain = Train()
someTrain.makeNoise()
someTrain.description
someTrain.currentSpeed = 8

class HighSpeedTrain: Train{
    //计算属性不能重写为存储属性，但是可以加属性观察器，虽然没有什么用
    //如果注释掉上面train的重写，此处可以对存储属性重写属性观察器，这个就有意义了
    override var currentSpeed: Double{
        didSet{
            print("HighSpeedTrain is calling didset: \(currentSpeed)")
        }
    }
}
let someHighSpeedTrain = HighSpeedTrain()
someHighSpeedTrain.currentSpeed = 99
someHighSpeedTrain.currentSpeed = 100
