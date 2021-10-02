//
//  ViewController.swift
//  fireBaseTest0930-2
//
//  Created by Jun on 2021/09/30.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController {

   
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var age: UITextField!
    
    var ref: DatabaseReference!
    var people: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        self.people = ref.child("people")
        
        ref.child("people").observe(DataEventType.value,with: {(snapshot) in
            var res = ""
            if let values = snapshot.value as? NSArray {
                for val in values {
                    let ob:NSDictionary! = val as! NSDictionary
                    let nm:String = ob.value(forKey: "name") as! String
                    let ml:String = ob.value(forKey: "mail") as! String
                    let ag:Int = ob.value(forKey: "age") as! Int
                    res += nm + "[" + ml + ":" + String(ag) + "]\n"
                }
            }
        }) { (error) in
        print(error.localizedDescription)
    }
  }
    @IBAction func doAction(_ sender: Any) {
        
        var nm:String? = self.name.text
        var ml:String? = self.mail.text
        var ag:Int? = Int(self.age.text ?? "0")
        var data = [ "name":nm, "mail":ml, "age":ag ] as [String : Any]
        var newRf = self.people.childByAutoId()
        newRf.setValue(data)
        self.name.text = ""
        self.mail.text = ""
        self.age.text = ""
    }
}
