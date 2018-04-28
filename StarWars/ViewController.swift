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
            if response.error != nil{
                print("\(String(describing: response.error))")
                return
            }
            if response.result.isSuccess {
                print("This is a success")
                guard let value  = response.value else {return}
                let person = Mapper<Person>().map(JSONObject: value)
                
                self.nameLabel.text = person?.name
                self.heightLabel.text = "\(String(describing: person?.height ?? 0))"
                self.massLabel.text = "\(String(describing: person?.mass ?? 0))"
                self.hairColorlabel.text = person?.hairColor
                self.skinColorlabel.text = person?.skinColor
                self.eyeColorlabel.text = person?.eyeColor
                self.birthYearlabel.text = person?.birthYear
                self.genderlabel.text = person?.gender
                self.homeWorldlabel.text = person?.homeworld
                
                
            }
            else {
                print("Not a success")
            }
        }
    }
    
   
}
enum HairColor:String {
    case blond = "Blond"
    case brown = "Brown"
    case black = "Black"
    case light = "Light"
    case white = "White"
}

struct Person:Mappable {
    var name:String?
    var height:Int = 0
    var mass:Int = 0
    var hairColor:String?
    var skinColor:String?
    var eyeColor:String?
    var birthYear:String?
    var gender:String?
    var homeworld:String?
    
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
    
    mutating func mapping(map: Map) {
        name    <- map["name"]
        height <- (map["height"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        gender     <- map["gender"]
       // mass     <- map["mass"]
        mass <- (map["mass"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        hairColor     <- map["hair_color"]
        birthYear     <- map["birth_year"]
        eyeColor     <- map["eye_color"]
        skinColor     <- map["skin_color"]
        homeworld     <- map["homeworld"]
    }
}

