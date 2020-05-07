//
//  chatDataModal.swift
//  rapptrlabs-Test
//
//  Created by karthik yalamanchili on 4/30/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import Foundation
import UIKit


struct ChatData:Codable {
    
    var data:[ChatContentText]
}

struct ChatContentText:Codable {
    
    var message : String
    var avatar_url : String
    var name : String
   //  var user_id : String
    
}



    
    
    






