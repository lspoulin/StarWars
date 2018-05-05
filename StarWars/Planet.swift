//
//  Person.swift
//  StarWars
//
//  Created by Louis-Simon Poulin on 2018-05-05.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

import Foundation
import ObjectMapper

struct Planet:Mappable {
    var name:String?

    init(){
        
    }
    
    init?(map: Map) {
        name    <- map["name"]
    }
    
    init(name:String){
        self.name = name
    }
    
    mutating func mapping(map: Map) {
        name    <- map["name"]
        
    }
}

