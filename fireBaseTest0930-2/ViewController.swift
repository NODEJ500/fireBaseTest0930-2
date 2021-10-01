//
//  ViewController.swift
//  fireBaseTest0930-2
//
//  Created by Jun on 2021/09/30.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        FirebaseApp.configure()
        label.text = FirebaseApp.app()?.name
    }

   

}

