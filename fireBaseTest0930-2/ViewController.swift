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
       
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func doAction(_ sender: Any) {
        print("ボタンが押されました")
        self.name.endEditing(true)
        let fstr:String = self.name.text!
        self.people.whereField("name" , isEqualTo:fstr)
            .getDocuments() {(querySnapshot, er) in
            var result:String = ""
            for val in querySnapshot!.documents{
                let nm:String = val.get("name") as! String
                let ml:String = val.get("mail") as! String
                let ag:String = String(val.get("age") as! Int)
                result += nm + "[" + ml + ":" + ag  + "] \n"
            }
            print(result)
            self.data.text = result
        }
    }
}
