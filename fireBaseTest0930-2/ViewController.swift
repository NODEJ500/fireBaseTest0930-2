//
//  ViewController.swift
//  fireBaseTest0930-2
//
//  Created by Jun on 2021/09/30.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore

class ViewController: UIViewController {

   
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var data: UITextView!
    
    var db:Firestore!
    var people: CollectionReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.db = Firestore.firestore()
        self.people = db.collection("people")
        self.people.addSnapshotListener{( querySnapshot, err) in
            var res:String = ""
            for val in querySnapshot!.documents {
                let nm:String = val.get("name") as! String
                res += nm + "[" + val.documentID + "] \n"
            }
            self.data.text = res
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    @IBAction func doAction(_ sender: Any) {
        self.name.endEditing(true)
        let nm:String = self.name.text!
        self.people.document(nm).delete()
    }
    
}
