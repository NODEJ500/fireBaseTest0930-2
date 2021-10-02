//
//  ViewController.swift
//  fireBaseTest0930-2
//
//  Created by Jun on 2021/09/30.
//

import UIKit
import Firebase


class ViewController: UIViewController {

  
    @IBOutlet weak var msg: UITextField!
    
    var ref: DatabaseReference!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }
    @IBAction func doAction(_ sender: Any) {
        var msg = self.msg.text
        ref.child("massage").setValue(msg)
    }
}

