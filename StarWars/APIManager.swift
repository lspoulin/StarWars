//
//  APIManager.swift
//  StarWars
//
//  Created by Louis-Simon Poulin on 2018-05-05.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

let baseURL = "https://swapi.co/api/"
let getPersonEndpoint = "people/1/"

class ApiManager<M:Mappable>{
    
    public func getPersonURL() -> String?{
        return baseURL+getPersonEndpoint
    }
    
    public func get(getURL:String, completion: @escaping ( _ mappable:Any) -> ()){
        
        Alamofire.request(getURL).responseJSON { response in
            if response.error != nil{
                print("\(String(describing: response.error))")
                return
            }
            if response.result.isSuccess {
                print("This is a success")
                guard let value  = response.value else {return}
                print(value as Any)
                
                guard let mappableObject = Mapper<M>().map(JSONObject: value) else{
                    print("Not a mappable")
                    return
                }
                completion(mappableObject)
            }
            else {
                print("Not a success")
            }
        }
        completion(AnyClass.self)
    }
}
