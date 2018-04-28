//
//  ViewController.swift
//  StarWars
//
//  Created by Louis-Simon Poulin on 2018-04-21.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper



class ViewController: UIViewController {
    let baseURL = "https://swapi.co/api/"
    let getPersonEndpoint = "people/1/"
    
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairColorlabel: UILabel!
    @IBOutlet weak var skinColorlabel: UILabel!
     @IBOutlet weak var eyeColorlabel: UILabel!
     @IBOutlet weak var birthYearlabel: UILabel!
     @IBOutlet weak var genderlabel: UILabel!
     @IBOutlet weak var homeWorldlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let getPersonURL = URL(string:baseURL+getPersonEndpoint)!
        
        Alamofire.request(getPersonURL).responseJSON { response in
            
            if response.result.isSuccess {
                print("This is a success")
                
                let json = response.value
                print(json as Any)
                
                _ = json as! NSDictionary
            
                var person = Mapper<Person>().map(JSONString: json as! String)
                // It also supports object to json
                //let JSONString = Mapper().toJSONString(person, prettyPrint: true)
                // ObjectMapper also supports Alamofire(which I will write another blog about), Realm and a bunch of third parties.
                // Mapping collections is also easy.
            
                let person2 = Person(name: "Louis-Simon", height: 190, mass: 230, hairColor: "Black", eyeColor: "Green", skinColor: "fair", birthYear: "1980AD", gender: "Male")
                
                //example if there is an id
                /*let height:String = response.object(forKey: "height")! as? String ?? ""
                let name:String = response.object(forKey: "name")! as? String ?? ""
                let gender:String = response.object(forKey: "gender")! as? String ?? ""
                let mass:String = response.object(forKey: "mass")! as? String ?? ""
                let hairColor:String = response.object(forKey: "hair_color")! as? String ?? ""
                let birthYear:String = response.object(forKey: "birth_year")! as? String ?? ""
                let eyeColor:String = response.object(forKey: "eye_color")! as? String ?? ""
                let skinColor:String = response.object(forKey: "skin_color")! as? String ?? ""
                let homeworld:String = response.object(forKey: "homeworld")! as? String ?? ""
                */
            
                person = person2
                //let person = Person(name:name)
                self.nameLabel.text = person?.name
                self.heightLabel.text = "".person?.height
                //self.massLabel.text = String(person?.mass)
                self.hairColorlabel.text = person?.hairColor
                self.skinColorlabel.text = person?.skinColor
                self.eyeColorlabel.text = person?.eyeColor
                self.birthYearlabel.text = person?.birthYear
                self.genderlabel.text = person?.gender
                self.homeWorldlabel.text = person?.homeworld
            }
            else {
                print("Oh fuck no!")
            }
        }
        
        /*let person = Person()
        
        
        nameLabel.text = person.name
        heightLabel.text = "The height is \(person.height) inches"
        massLabel.text = "The mass is \(person.mass) lbl"
        
        birthYearlabel.text = "the birthdate of \(person.name) is \(person.birthYear)"
        hairColorlabel.text = person.hairColor.rawValue
        print(person)*/
        
        
        
    }
    
    enum HairColor:String {
        case blond = "Blond"
        case brown = "Brown"
        case black = "Black"
        case light = "Light"
        case white = "White"
    }
   


}

struct Person:Mappable {
    init?(map: Map) {
        name    <- map["name"]
        height <- map["height"]
        gender     <- map["gender"]
        mass     <- map["mass"]
        hairColor     <- map["hair_color"]
        birthYear     <- map["birth_year"]
        eyeColor     <- map["eye_color"]
        skinColor     <- map["skin_color"]
        homeworld     <- map["homeworld"]
    }
    
    init(name:String, height:Int, mass:Int, hairColor:String, eyeColor:String, skinColor:String, birthYear:String, gender:String){
        self.name = name
        self.height = height
        self.mass = mass
        self.hairColor = hairColor;
        self.eyeColor = eyeColor;
        self.skinColor = skinColor
        self.birthYear = birthYear
        self.gender = gender
    }
    
    var name:String?
    var height:Int?
    var mass:Int?
    var hairColor:String?
    var skinColor:String?
    var eyeColor:String?
    var birthYear:String?
    var gender:String?
    var homeworld:String?
    
    
    mutating func mapping(map: Map) {
        name    <- map["name"]
        height <- map["height"]
        gender     <- map["gender"]
        mass     <- map["mass"]
        hairColor     <- map["hair_color"]
        birthYear     <- map["birth_year"]
        eyeColor     <- map["eye_color"]
        skinColor     <- map["skin_color"]
        homeworld     <- map["homeworld"]
    }
}

