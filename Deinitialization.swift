//: Playground - noun: a place where people can play

import UIKit

//析构器只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用。析构器用关键字deinit来标示，类似于构造器要用init来标示。
class TestA{
    var name = "name"
    
    deinit{
        print("The TestA's name is \(name)")
    }
}

var a: TestA? = TestA()
a = nil

class Bank{
    static var coinsInBank = 10000
    
    static func vendCoins(var numberOfCoinsToVend: Int) -> Int{
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receiveCoins(coins: Int){
        coinsInBank += coins
    }
}

class Player{
    var coinsInPurse: Int
    
    init(coins: Int){
        coinsInPurse = Bank.vendCoins(coins)
    }
    
    func winCoins(coins: Int){
        coinsInPurse += Bank.vendCoins(coins)
    }
    
    deinit{
        Bank.receiveCoins(coinsInPurse)
    }
}

var palyer1: Player? = Player(coins: 1000)
print(Bank.coinsInBank)
palyer1 = nil
print(Bank.coinsInBank)
