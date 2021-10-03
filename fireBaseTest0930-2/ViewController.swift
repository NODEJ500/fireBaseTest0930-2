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
    @IBOutlet weak var data: UITextView!
    
    var ref: DatabaseReference!
    var people: DatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        self.people = ref.child("people")
    }
    
    @IBAction func doAction(_ sender: Any) {
        
        self.name.endEditing(true)
        if let fstr:String = self.name.text {
        var fRef = people.queryOrdered(byChild: "name")
                .queryStarting(atValue: fstr).queryEnding(atValue: fstr + "%")
            fRef.observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
                var res = ""
                if let values = snapshot.value as? NSDictionary {
                    for (key, val) in values {
                        let ob:NSDictionary! = val as! NSDictionary
                        let nm:String = ob.value(forKey: "name") as! String
                        let ml:String = ob.value(forKey: "mail") as! String
                        let ag:Int = ob.value(forKey: "age") as! Int
                        res += nm + "[" + ml + ":" + String(ag) + "]\n"
                    }
                }
                self.data.text = res
            }) { (error) in
                print(error.localizedDescription)
        }
      }
   }
}
