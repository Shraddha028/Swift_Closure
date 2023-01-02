import UIKit

var greeting = "Hello, playground"


let addition: (Int, Int) -> Int = {
    (num1, num2) in
    print("closure....")
    return num1 + num2
}

print(addition(10,50))
