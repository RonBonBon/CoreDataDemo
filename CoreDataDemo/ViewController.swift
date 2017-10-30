//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by hackeru on 10 Heshvan 5778.
//  Copyright © 5778 com.arichafamily. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Dao.shared.savePerson(firstName: "Moshe", lastName: "Cook", age: 23)
        Dao.shared.readPeople()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

