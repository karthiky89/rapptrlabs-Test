//
//  LoginHelper.swift
//  rapptrlabs-Test
//
//  Created by karthik yalamanchili on 4/28/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import Foundation



//struct loginData: Decodable{
//    var code: String
//    var message: String
//    
//}

class loginClient {
    
    var  RequestUrl: URL?
    var LoginId : String?
    var loginCred: String?
    
    enum LoginDataError : Error{
        case nodata
        case dataError
    }
    
    init(email:String, password:String) {
        
        let requestUrl = "http://dev.rapptrlabs.com/Tests/scripts/login.php?email=\(String(describing: email))&password=\(String(describing: password))"
        guard self.RequestUrl == URL(string: requestUrl)! else {fatalError()}
        
    }
    
    
    
    
    

    
}






/*
 func hitAPI(_for URLString:String) {
 let configuration = URLSessionConfiguration.default
 let session = URLSession(configuration: configuration)
 let url = URL(string: URLString)
 //let url = NSURL(string: urlString as String)
 var request : URLRequest = URLRequest(url: url!)
 request.httpMethod = "POST"
 request.addValue("application/json", forHTTPHeaderField: "Content-Type")
 request.addValue("application/json", forHTTPHeaderField: "Accept")
 let dataTask = session.dataTask(with: url!) {
 data,response,error in
 // 1: Check HTTP Response for successful GET request
 guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
 else {
 print("error: not a valid http response")
 return
 }
 switch (httpResponse.statusCode) {
 case 200:
 //success response.
 break
 case 400:
 break
 default:
 break
 }
 }
 dataTask.resume()
 }
 */
