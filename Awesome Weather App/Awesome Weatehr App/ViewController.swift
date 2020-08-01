//
//  ViewController.swift
//  Awesome Weatehr App
//
//  Created by Bill Skrzypczak on 8/1/20.
//  Copyright © 2020 Bill Skrzypczak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // TODO: This is step 1
        // Tell my function where to look for the weather data
        //
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334") {
            if let data = NSData(contentsOf: url as URL){
                
                // TODO: This is step 2
                // Parse thru the data
                //
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                    
                    // TODO: This is step 3
                    // Temporarily store the parsed data in a dictionary
                    //
                    let newDict = parsed
                    
                    // TODO: This is step 4
                    // Print out these 3 pieces of data in the terminal window to check them.
                    //
                    print(newDict["currently"]!["summary"] as Any)
                    print(newDict["currently"]!["temperature"] as Any)
                    print(newDict["currently"]!["dewPoint"] as Any)
                    
                    self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!)"
                    self.currentSummary.text = "\(newDict["currently"]!["summary"]!!)"
                    self.currentlyDewpoint.text = "\(newDict["currently"]!["dewPoint"]!!)"

                }
                
                    // TODO: This is step 5
                    // If you have a problem reading the Jason data print and error
                    //
                catch let error as NSError {
                    print("A JSON parsithng error occurred, here are the details:\n \(error)")
                }
                
            }
        }
    }

    // TODO: This is step 6
    // Add the outlets to hold the data
    //
    @IBOutlet var currentTemp: UILabel!
    
    @IBOutlet var currentSummary: UILabel!
    
    @IBOutlet var currentlyDewpoint: UILabel!
    

    
}
