//
//  SuperheroClass.swift
//  Table View Practice
//
//  Created by jcysewski on 1/15/16.
//  Copyright © 2016 jcysewski. All rights reserved.
//

import UIKit

class SuperheroClass: NSObject
{
    var name = "" //these replace the arrays
    var alias = ""
    var power = 0
    var picture = UIImage(named: "Default")
    
    init(Name: String, ALias: String, Power: Int, Picture: UIImage) //convinence initializers makes objects of the SuperheroClass
    {
        super.init()
        name = Name
        alias = ALias
        power = Power
        picture = Picture
    }
    init(Name: String, ALias: String) //convinence initializers makes objects of the SuperheroClass
    {
        super.init()
        name = Name
        alias = ALias
    }

}
