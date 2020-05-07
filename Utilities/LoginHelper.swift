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






