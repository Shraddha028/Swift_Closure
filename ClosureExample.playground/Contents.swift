import UIKit

var greeting = "Hello, playground"
    
    // simple closure
typealias Addition = (Int,Int) -> Int


let addition: Addition = {
    (num1, num2) in
    print("closure....")
    return num1 + num2
}

print(addition(10,50))

 // Passing closure as a parameter

func checkString(flag: Bool, result: ((String) -> ())) {
    if flag {
        result("Shraddha")
    }
}

checkString(flag: false, result: {
    name in
    print("Hello \(name)")
})

print("Welcome Back......")


// use of autoclosure

func checkStringValue(flag: Bool, result: @autoclosure () -> String ) {
    if flag {
        print("Hello \(result())")
    }
}

func test() -> String {
    return "Test Message"
}

checkStringValue(flag: true, result: test())


 //non escaping

func printStar(count : Int, str: String, callBack: (() -> Void)) {
    callBack()
    print("Welcome print Star.....")

    for i in 1...count {
        print("* : \(i) * \(str)")
    }

    print("End of print Star.....")
}

printStar(count: 10, str: "Shraddha") {
    print("Done")
}

// escaping

func printStar1(count : Int, str: String, callBack:@escaping (() -> Void)) {

    DispatchQueue.main.async {
        callBack()
    }

    print("Escaping Started.....")

    for i in 1...count {
        print("* : \(i) * \(str)")
    }

    print("End of print Star.....")
}

printStar1(count: 10, str: "Shraddha") {
    print("Escaping Last")
}

class Test {
  var name = "shraddha"
    
    init(_name: String) {
        self.name = _name
    }
}
/// Captur List
func valueClosureExample() {
    var a = 100

    let addition = { [a] in
        print("Inside Closure \(a)")
    }

    addition()

    a = 90

    addition()

    a = 80

    addition()
}

func refClosureExample() {
    var obj = Test(_name: "bngh")

    let addition = { [obj] in
        print("Inside Closure \(obj.name)")
        obj.name = "bnnbnmb"
    }

    addition()
    //obj.name = "ght"

    //obj = Test()
    addition()
    print("test: \(obj.name)")

}

refClosureExample()


var testOnj = Test(_name: "Accenture")

func testFunction() {

    let capture = { [testOnj] in
        print("Value is \(testOnj.name)")
    }
    capture()

    testOnj = Test(_name: "MNO")

    capture()
}

testFunction()

testOnj.name = "shraddha"

testFunction()


class ExampleClass {
    var counter = 1
    var name = "shraddha"

    lazy var closure: () -> Void = { [counter] in
        print(counter)
    }
}

let obj = ExampleClass()

obj.closure()
obj.name = "rst"
obj.closure()


class ExampleClass1 {
    var counter = 234

    lazy var closure: () -> Void = { [weak self] in
        guard let self = self else { return }
        print(self.counter)
    }
}

var obj1 = ExampleClass1()
obj1.closure()
obj1.counter = 20
obj1.closure()

print(CFGetRetainCount(obj))

