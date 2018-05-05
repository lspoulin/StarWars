//
//  ViewController.swift
//  StarWars
//
//  Created by Louis-Simon Poulin on 2018-04-21.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        let apiManager:ApiManager = ApiManager()
        apiManager.getPerson(completion: display)
        }
    
    func display(myPerson:Person?)->(){
        guard let person = myPerson else{
            print("No person")
            return
        }
        self.nameLabel.text = person.name
        self.heightLabel.text = "\(String(describing: person.height ))"
        self.massLabel.text = "\(String(describing: person.mass ))"
        self.hairColorlabel.text = person.hairColor?.rawValue
        self.skinColorlabel.text = person.skinColor?.rawValue
        self.eyeColorlabel.text = person.eyeColor?.rawValue
        self.birthYearlabel.text = person.birthYear
        self.genderlabel.text = person.gender
        self.homeWorldlabel.text = person.homeworld
    }
}
