//
//  Person.swift
//  StarWars
//
//  Created by Louis-Simon Poulin on 2018-05-05.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

import Foundation
import ObjectMapper

enum HairColor:String {
    case blond = "blond"
    case brown = "brown"
    case black = "black"
    case light = "light"
    case white = "white"
}

enum EyeColor:String {
    case blue = "blue"
    case brown = "brown"
    case black = "black"
    case green = "green"
    case grey = "grey"
}

enum SkinColor:String {
    case fair = "fair"
    case brown = "brown"
    case black = "black"
    case light = "light"
    case white = "white"
}

struct Person:Mappable {
    var name:String?
    var height:Int = 0
    var mass:Int = 0
    var hairColor:HairColor?
    var skinColor:SkinColor?
    var eyeColor:EyeColor?
    var birthYear:String?
    var gender:String?
    var homeworld:String?
    
    init(){
        
    }
    
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
    
    init(name:String, height:Int, mass:Int, hairColor:HairColor, eyeColor:EyeColor, skinColor:SkinColor, birthYear:String, gender:String){
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
        mass <- (map["mass"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        hairColor <- map["hair_color"]
        birthYear     <- map["birth_year"]
        eyeColor     <- map["eye_color"]
        skinColor     <- map["skin_color"]
        homeworld     <- map["homeworld"]
    }
}

