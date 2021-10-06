//
//  ViewController.swift
//  fireBaseTest0930-2
//
//  Created by Jun on 2021/09/30.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage

class ViewController: UIViewController {

   
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var data: UITextView!
    
    var db:Firestore!
    var people: CollectionReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = Storage.storage()
        
        let txtRef = storage.reference(withPath: "sample.text")
        let MAX_SIZE:Int64 = 1024 * 1024
        txtRef.getData(maxSize: MAX_SIZE) { result, error in
            self.data.text = String(data: result! , encoding: String.Encoding.utf8)
        }
       
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func doAction(_ sender: Any) {
       
    
    }
}
