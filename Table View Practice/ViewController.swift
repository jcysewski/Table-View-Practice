//
//  ViewController.swift
//  Table View Practice
//
//  Created by jcysewski on 1/13/16.
//  Copyright © 2016 jcysewski. All rights reserved.
//

import UIKit
// add table view data source and protocols
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    var superheros = ["Batman", "Wonder Woman", "Superman", "Iron Man", "The Flash", "Deadpool"]
    var realNames = ["Bruce Wayne", "Diana", "Clark Kent", "Tony Stark", "Barry Allen", "Wade Wilson"]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self // these set the data source and delegate to the view controller(self)
    }
    
    //this function creates a cell that wil store your data on your table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = superheros[indexPath.row]
        myTableViewCell.detailTextLabel?.text = realNames[indexPath.row]
        return myTableViewCell
    }
    
    //sets the number of rows in the table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheros.count // number of rows in the table view = number of strings in array superheros
    }

}

