//
//  ViewController.swift
//  Boogie2
//
//  Created by Arvind Subramanian on 6/14/15.
//  Copyright (c) 2015 iOS Boogie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func randomColor() {
        let red = CGFloat(arc4random()%256)/256.0
        let green = CGFloat(arc4random()%256)/256.0
        let blue = CGFloat(arc4random()%256)/256.0
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        println(color)
        
        colorView.backgroundColor = color
    }
    
    
}

