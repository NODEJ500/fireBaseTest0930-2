//
//  ViewController.swift
//  fireBaseTest0930-2
//
//  Created by Jun on 2021/09/30.
//

import UIKit
import Firebase


class ViewController: UIViewController {

   
    @IBOutlet weak var data: UITextView!
    var ref: DatabaseReference!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
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
            self.data.text = res
        }) { (error) in
        print(error.localizedDescription)
    }
  }
}
