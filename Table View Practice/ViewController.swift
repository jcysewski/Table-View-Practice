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
    
    @IBAction func addButtonTapped(sender: AnyObject)
    {
        let myAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default)
        { (addAction) -> Void in
            let superheroNameTextField = myAlert.textFields![0] as UITextField
            let aliasNameTextField = myAlert.textFields![1] as UITextField
            self.superheros.append(superheroNameTextField.text!)
            self.realNames.append(aliasNameTextField.text!)
            self.myTableView.reloadData()
        }
        
        myAlert.addAction(addAction)
        
        
        myAlert.addTextFieldWithConfigurationHandler
        { (superheroTextField) -> Void in
            superheroTextField.placeholder = "Add Superhero Name"
        }
        myAlert.addTextFieldWithConfigurationHandler
            { (aliasTextField) -> Void in
                aliasTextField.placeholder = "Add Real Name"
        }
        
        
        
        self.presentViewController(myAlert, animated: true, completion: nil) //presents the alert view
    }
    
    
    @IBAction func editButtonTapped(sender: AnyObject)
    {
        myTableView.editing = !myTableView.editing
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
    //alows you to delete rows from the table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superheros.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }

    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true // allows you to move rows
    }
    
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
            let superhero = superheros[sourceIndexPath.row]
            superheros.removeAtIndex(sourceIndexPath.row)
            superheros.insert(superhero, atIndex: destinationIndexPath.row)
        
            let alterEgo = realNames[sourceIndexPath.row]
            realNames.removeAtIndex(sourceIndexPath.row)
            realNames.insert(alterEgo, atIndex: destinationIndexPath.row)
        }

}

























