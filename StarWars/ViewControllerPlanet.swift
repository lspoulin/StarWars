//
//  ViewController.swift
//  StarWars
//
//  Created by Louis-Simon Poulin on 2018-04-21.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

import UIKit


class ViewControllerPlanet: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    
    var homeworldURLString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let apiManager:ApiManager = ApiManager<Planet>()
        apiManager.get(getURL: homeworldURLString!,  completion: display)
        }
    
    func display(myPlanet:Any?)->(){
        guard let planet:Planet = myPlanet as? Planet else{
            print("No planet")
            return
        }
        labelName.text = planet.name
       
    }
    
}
