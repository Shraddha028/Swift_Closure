import UIKit

var greeting = "Hello, playground"


class Networking {
    
    let networkRequest: (URLRequest) -> URLRequest
    
    init(_networkRequest:@escaping (URLRequest) -> URLRequest) {
        print("Step1***")
        self.networkRequest = _networkRequest
    }
    
    func fetchRquest() -> URLRequest {
        print("Step2***")
        let url = "https://Google.com"
        let urlRequest = URLRequest(url: URL(string: url)!)
        let request = self.networkRequest(urlRequest)
        return request
    }
}
    
// This closure execute later
let network = Networking { urlRequest in
    print("Step3**")
    var request = urlRequest
    request.setValue("tokenstring", forHTTPHeaderField: "AUTHORIZATION")
    return request
}


let fetctRequest = network.fetchRquest()

print(fetctRequest.value(forHTTPHeaderField: "AUTHORIZATION"))
