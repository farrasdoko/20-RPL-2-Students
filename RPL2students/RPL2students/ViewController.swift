//
//  ViewController.swift
//  RPL2students
//
//  Created by Gw on 02/12/17.
//  Copyright © 2017 FarrasDoko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblusername: UILabel!
    @IBOutlet weak var lblnama: UILabel!
    @IBOutlet weak var lblid: UILabel!
    
    var passId:String?
     var passUsername:String?
    var passlbNama:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblid.text = passId!
         lblnama.text = passlbNama!
        lblusername.text = passUsername!
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


